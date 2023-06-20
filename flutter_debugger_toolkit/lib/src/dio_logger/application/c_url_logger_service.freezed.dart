// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'c_url_logger_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CurlLoggerItem {
  RequestOptions get request => throw _privateConstructorUsedError;
  Response<dynamic>? get response => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CurlLoggerItemCopyWith<CurlLoggerItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurlLoggerItemCopyWith<$Res> {
  factory $CurlLoggerItemCopyWith(
          CurlLoggerItem value, $Res Function(CurlLoggerItem) then) =
      _$CurlLoggerItemCopyWithImpl<$Res, CurlLoggerItem>;
  @useResult
  $Res call({RequestOptions request, Response<dynamic>? response});
}

/// @nodoc
class _$CurlLoggerItemCopyWithImpl<$Res, $Val extends CurlLoggerItem>
    implements $CurlLoggerItemCopyWith<$Res> {
  _$CurlLoggerItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
    Object? response = freezed,
  }) {
    return _then(_value.copyWith(
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as RequestOptions,
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as Response<dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CurlLoggerItemCopyWith<$Res>
    implements $CurlLoggerItemCopyWith<$Res> {
  factory _$$_CurlLoggerItemCopyWith(
          _$_CurlLoggerItem value, $Res Function(_$_CurlLoggerItem) then) =
      __$$_CurlLoggerItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({RequestOptions request, Response<dynamic>? response});
}

/// @nodoc
class __$$_CurlLoggerItemCopyWithImpl<$Res>
    extends _$CurlLoggerItemCopyWithImpl<$Res, _$_CurlLoggerItem>
    implements _$$_CurlLoggerItemCopyWith<$Res> {
  __$$_CurlLoggerItemCopyWithImpl(
      _$_CurlLoggerItem _value, $Res Function(_$_CurlLoggerItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
    Object? response = freezed,
  }) {
    return _then(_$_CurlLoggerItem(
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as RequestOptions,
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as Response<dynamic>?,
    ));
  }
}

/// @nodoc

class _$_CurlLoggerItem extends _CurlLoggerItem {
  const _$_CurlLoggerItem({required this.request, required this.response})
      : super._();

  @override
  final RequestOptions request;
  @override
  final Response<dynamic>? response;

  @override
  String toString() {
    return 'CurlLoggerItem(request: $request, response: $response)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CurlLoggerItem &&
            (identical(other.request, request) || other.request == request) &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request, response);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CurlLoggerItemCopyWith<_$_CurlLoggerItem> get copyWith =>
      __$$_CurlLoggerItemCopyWithImpl<_$_CurlLoggerItem>(this, _$identity);
}

abstract class _CurlLoggerItem extends CurlLoggerItem {
  const factory _CurlLoggerItem(
      {required final RequestOptions request,
      required final Response<dynamic>? response}) = _$_CurlLoggerItem;
  const _CurlLoggerItem._() : super._();

  @override
  RequestOptions get request;
  @override
  Response<dynamic>? get response;
  @override
  @JsonKey(ignore: true)
  _$$_CurlLoggerItemCopyWith<_$_CurlLoggerItem> get copyWith =>
      throw _privateConstructorUsedError;
}
