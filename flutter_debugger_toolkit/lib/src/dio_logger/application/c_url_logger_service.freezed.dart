// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'c_url_logger_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CurlLoggerItemTearOff {
  const _$CurlLoggerItemTearOff();

  _CurlLoggerItem call(
      {required RequestOptions request, required Response<dynamic>? response}) {
    return _CurlLoggerItem(
      request: request,
      response: response,
    );
  }
}

/// @nodoc
const $CurlLoggerItem = _$CurlLoggerItemTearOff();

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
      _$CurlLoggerItemCopyWithImpl<$Res>;
  $Res call({RequestOptions request, Response<dynamic>? response});
}

/// @nodoc
class _$CurlLoggerItemCopyWithImpl<$Res>
    implements $CurlLoggerItemCopyWith<$Res> {
  _$CurlLoggerItemCopyWithImpl(this._value, this._then);

  final CurlLoggerItem _value;
  // ignore: unused_field
  final $Res Function(CurlLoggerItem) _then;

  @override
  $Res call({
    Object? request = freezed,
    Object? response = freezed,
  }) {
    return _then(_value.copyWith(
      request: request == freezed
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as RequestOptions,
      response: response == freezed
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as Response<dynamic>?,
    ));
  }
}

/// @nodoc
abstract class _$CurlLoggerItemCopyWith<$Res>
    implements $CurlLoggerItemCopyWith<$Res> {
  factory _$CurlLoggerItemCopyWith(
          _CurlLoggerItem value, $Res Function(_CurlLoggerItem) then) =
      __$CurlLoggerItemCopyWithImpl<$Res>;
  @override
  $Res call({RequestOptions request, Response<dynamic>? response});
}

/// @nodoc
class __$CurlLoggerItemCopyWithImpl<$Res>
    extends _$CurlLoggerItemCopyWithImpl<$Res>
    implements _$CurlLoggerItemCopyWith<$Res> {
  __$CurlLoggerItemCopyWithImpl(
      _CurlLoggerItem _value, $Res Function(_CurlLoggerItem) _then)
      : super(_value, (v) => _then(v as _CurlLoggerItem));

  @override
  _CurlLoggerItem get _value => super._value as _CurlLoggerItem;

  @override
  $Res call({
    Object? request = freezed,
    Object? response = freezed,
  }) {
    return _then(_CurlLoggerItem(
      request: request == freezed
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as RequestOptions,
      response: response == freezed
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
        (other is _CurlLoggerItem &&
            (identical(other.request, request) ||
                const DeepCollectionEquality()
                    .equals(other.request, request)) &&
            (identical(other.response, response) ||
                const DeepCollectionEquality()
                    .equals(other.response, response)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(request) ^
      const DeepCollectionEquality().hash(response);

  @JsonKey(ignore: true)
  @override
  _$CurlLoggerItemCopyWith<_CurlLoggerItem> get copyWith =>
      __$CurlLoggerItemCopyWithImpl<_CurlLoggerItem>(this, _$identity);
}

abstract class _CurlLoggerItem extends CurlLoggerItem {
  const factory _CurlLoggerItem(
      {required RequestOptions request,
      required Response<dynamic>? response}) = _$_CurlLoggerItem;
  const _CurlLoggerItem._() : super._();

  @override
  RequestOptions get request => throw _privateConstructorUsedError;
  @override
  Response<dynamic>? get response => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CurlLoggerItemCopyWith<_CurlLoggerItem> get copyWith =>
      throw _privateConstructorUsedError;
}
