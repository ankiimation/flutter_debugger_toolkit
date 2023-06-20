import 'dart:async';
import 'dart:convert';

import 'package:dart_exporter_annotation/dart_exporter_annotation.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'c_url_logger_service.freezed.dart';

@Export()
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

  static final Map<RequestOptions, DateTime> _requestTimeMapping = {};
  static final Map<RequestOptions, DateTime> _responseTimeMapping = {};

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
    _requestTimeMapping[options] = DateTime.now();
    onCUrlRequest?.call(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
    _responseTimeMapping[response.requestOptions] = DateTime.now();
    onCurlResponse?.call(response.requestOptions, response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
    _responseTimeMapping[err.requestOptions] = DateTime.now();
    onCurlError?.call(err.requestOptions, err);
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

@Export()
@freezed

///[CurlLoggerItem]
class CurlLoggerItem with _$CurlLoggerItem {
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
    if (responseData is Map) {
      const encoder = JsonEncoder.withIndent("     ");
      final data = encoder.convert(responseData);
      return data;
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

  DateTime? get requestTime {
    return _DefaultDioCUrlInterceptor._requestTimeMapping[request];
  }

  DateTime? get responseTime {
    return _DefaultDioCUrlInterceptor._responseTimeMapping[request];
  }

  Duration? get duration {
    final requestTime = this.requestTime;
    final responseTime = this.responseTime;
    if (requestTime != null && responseTime != null) {
      return responseTime.difference(requestTime).abs();
    }
    return null;
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
