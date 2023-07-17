// ignore_for_file: constant_identifier_names

import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'c_url_logger_service.freezed.dart';

class DioCurlLoggerService {
  DioCurlLoggerService._();
  static final instance = DioCurlLoggerService._();
  final StreamController<CurlLoggerItem> _streamController =
      StreamController.broadcast();

  Stream<CurlLoggerItem> get stream => _streamController.stream;

  void attachTo(Dio dio) {
    dio.interceptors
        .removeWhere((element) => element is _DefaultDioCUrlInterceptor);
    dio.interceptors.add(interceptor);
  }

  late final interceptor = _DefaultDioCUrlInterceptor(
    onCUrlRequest: (request) {
      _streamController.add(
        CurlLoggerItem(
          request: request,
          response: null,
        ),
      );
    },
    onCurlResponse: (request, response) {
      _streamController.add(
        CurlLoggerItem(
          request: request,
          response: response,
        ),
      );
    },
    onCurlError: (request, err) {
      _streamController.add(
        CurlLoggerItem(
          request: request,
          response: err.response,
        ),
      );
    },
  );
}

class _DefaultDioCUrlInterceptor extends Interceptor {
  final Function(RequestOptions options)? onCUrlRequest;
  final Function(RequestOptions options, Response response)? onCurlResponse;
  final Function(RequestOptions options, DioError error)? onCurlError;
  _DefaultDioCUrlInterceptor({
    this.onCUrlRequest,
    this.onCurlResponse,
    this.onCurlError,
  });

  @override
  void onRequest(RequestOptions request, RequestInterceptorHandler handler) {
    final mRequest = request.addRequestId.addRequestTime;
    onCUrlRequest?.call(mRequest);
    super.onRequest(mRequest, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
    final options = response.requestOptions.addResponseTime;
    onCurlResponse?.call(options, response);
    print(options.extra);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
    final options = err.requestOptions.addResponseTime;
    onCurlError?.call(options, err);
  }
}

extension RequestOptionExtension on RequestOptions {
  RequestOptions get addRequestId {
    final data = Map.from(extra).cast<String, dynamic>();
    data[CurlLoggerItem.flutter_debugger_toolkit_request_id] = generateUUID();
    return copyWith(extra: data);
  }

  RequestOptions get addRequestTime {
    final data = Map.from(extra).cast<String, dynamic>();
    data[CurlLoggerItem.flutter_debugger_toolkit_request_time] = DateTime.now();
    return copyWith(extra: data);
  }

  RequestOptions get addResponseTime {
    final data = Map.from(extra).cast<String, dynamic>();
    data[CurlLoggerItem.flutter_debugger_toolkit_response_time] =
        DateTime.now();
    return copyWith(extra: data);
  }
}

String _cURLRepresentation(RequestOptions options) {
  final List<String> components = ['curl -i'];
  if (options.method.toUpperCase() != 'GET') {
    components.add('-X ${options.method}');
  }

  options.headers.forEach((k, v) {
    if (k != 'Cookie') {
      components.add('-H "$k: $v"');
    }
  });

  if (options.data != null) {
    String componentType = '-d';
    // FormData can't be JSON-serialized, so keep only their fields attributes
    if (options.data is FormData) {
      componentType = '-f';
      options.data = Map.fromEntries((options.data as FormData).fields)
        ..addAll(
          Map.fromEntries(
            (options.data as FormData).files.map(
                  (e) => MapEntry(
                    e.key,
                    e.value.filename ?? '',
                  ),
                ),
          ),
        );
    }

    final data = json.encode(options.data).replaceAll('"', '\\"');
    components.add('$componentType "$data"');
  }

  components.add('"${options.uri.toString()}"');

  return components.join(' \\\n\t');
}

@freezed

///[CurlLoggerItem]
class CurlLoggerItem with _$CurlLoggerItem {
  static const flutter_debugger_toolkit_request_id =
      'flutter_debugger_toolkit_request_id';
  static const flutter_debugger_toolkit_request_time =
      'flutter_debugger_toolkit_start_request_time';
  static const flutter_debugger_toolkit_response_time =
      'flutter_debugger_toolkit_finish_request_time';
  static const warningDuration = Duration(seconds: 5);
  static const trashDuration = Duration(seconds: 30);

  ///[CurlLoggerItem]
  const factory CurlLoggerItem({
    required RequestOptions request,
    required Response? response,
  }) = _CurlLoggerItem;
  const CurlLoggerItem._();

  String get curl => _cURLRepresentation(request);

  bool get requesting => response == null;

  bool get isError {
    final statusCode = response?.statusCode;
    if (statusCode == null) {
      return false;
    }
    if (statusCode >= 400 && statusCode < 600) {
      return true;
    } else {
      return false;
    }
  }

  // RequestOptions get request => response.requestOptions;
  String get requestMethod {
    return request.method;
  }

  String get displayRequestBody {
    if (request.data != null) {
      if (request.data is FormData) {
        request.data = Map.fromEntries((request.data as FormData).fields)
          ..addAll(
            Map.fromEntries(
              (request.data as FormData).files.map(
                    (e) => MapEntry(
                      e.key,
                      e.value.filename ?? '',
                    ),
                  ),
            ),
          );
      }

      const encoder = JsonEncoder.withIndent("     ");
      final data = encoder.convert(request.data);

      return data;
    }
    return '';
  }

  String get responseBeauty {
    final responseData = response?.data;
    final contentLength = response?.headers.map['Content-Length'] ??
        responseData.toString().length;
    if (contentLength is int) {
      if ((contentLength) < 500) {
        if (responseData is Map) {
          const encoder = JsonEncoder.withIndent("     ");
          final data = encoder.convert(responseData);
          return data;
        }
      } else {
        return '<large-data> ${(contentLength / 1024).toStringAsFixed(2)}KB';
      }
    }
    return '$responseData';
  }

  String get responseBeautyHTML {
    final responseData = response?.data;
    if (responseData is Map) {
      return _mapToHtml(responseData.cast<String, dynamic>());
    }
    return '$responseData';
  }

  String get requestId {
    return request.extra[flutter_debugger_toolkit_request_id] as String;
  }

  DateTime get requestTime {
    return request.extra[flutter_debugger_toolkit_request_time] as DateTime;
  }

  DateTime? get responseTime {
    return request.extra[flutter_debugger_toolkit_response_time] as DateTime?;
  }

  Duration? get duration {
    final requestTime = this.requestTime;
    final responseTime = this.responseTime;
    if (responseTime == null) {
      return null;
    }
    return responseTime.difference(requestTime).abs();
  }
}

String _mapToHtml(dynamic data, {int indentationLevel = 0}) {
  final indentation = '&nbsp;' * 2 * indentationLevel;
  final indentationNextLevel = '&nbsp;' * 2 * (indentationLevel + 1);
  final html = StringBuffer();

  if (data is Map<String, dynamic>) {
    html.writeln('{<br>');
    data.forEach((key, value) {
      html.write('$indentationNextLevel<strong>"$key"</strong>: ');
      html.writeln(_mapToHtml(value, indentationLevel: indentationLevel + 1));
    });
    html.write('$indentation}<br>');
  } else if (data is List<dynamic>) {
    html.writeln('[<br>');
    for (final item in data) {
      html.write(indentationNextLevel);
      html.writeln(_mapToHtml(item, indentationLevel: indentationLevel + 1));
    }
    html.write('$indentation]<br>');
  } else {
    html.write('$data,<br>');
  }

  return html.toString();
}

String generateUUID() {
  final random = Random();
  final dateTime = DateTime.now();

  return '${dateTime.microsecondsSinceEpoch}';
}
