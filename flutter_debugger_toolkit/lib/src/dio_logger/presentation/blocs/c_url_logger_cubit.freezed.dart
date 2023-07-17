// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'c_url_logger_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CUrlLoggerStateTearOff {
  const _$CUrlLoggerStateTearOff();

  _CUrlLoggerState call({required List<CurlLoggerItem> list}) {
    return _CUrlLoggerState(
      list: list,
    );
  }
}

/// @nodoc
const $CUrlLoggerState = _$CUrlLoggerStateTearOff();

/// @nodoc
mixin _$CUrlLoggerState {
  List<CurlLoggerItem> get list => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CUrlLoggerStateCopyWith<CUrlLoggerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CUrlLoggerStateCopyWith<$Res> {
  factory $CUrlLoggerStateCopyWith(
          CUrlLoggerState value, $Res Function(CUrlLoggerState) then) =
      _$CUrlLoggerStateCopyWithImpl<$Res>;
  $Res call({List<CurlLoggerItem> list});
}

/// @nodoc
class _$CUrlLoggerStateCopyWithImpl<$Res>
    implements $CUrlLoggerStateCopyWith<$Res> {
  _$CUrlLoggerStateCopyWithImpl(this._value, this._then);

  final CUrlLoggerState _value;
  // ignore: unused_field
  final $Res Function(CUrlLoggerState) _then;

  @override
  $Res call({
    Object? list = freezed,
  }) {
    return _then(_value.copyWith(
      list: list == freezed
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<CurlLoggerItem>,
    ));
  }
}

/// @nodoc
abstract class _$CUrlLoggerStateCopyWith<$Res>
    implements $CUrlLoggerStateCopyWith<$Res> {
  factory _$CUrlLoggerStateCopyWith(
          _CUrlLoggerState value, $Res Function(_CUrlLoggerState) then) =
      __$CUrlLoggerStateCopyWithImpl<$Res>;
  @override
  $Res call({List<CurlLoggerItem> list});
}

/// @nodoc
class __$CUrlLoggerStateCopyWithImpl<$Res>
    extends _$CUrlLoggerStateCopyWithImpl<$Res>
    implements _$CUrlLoggerStateCopyWith<$Res> {
  __$CUrlLoggerStateCopyWithImpl(
      _CUrlLoggerState _value, $Res Function(_CUrlLoggerState) _then)
      : super(_value, (v) => _then(v as _CUrlLoggerState));

  @override
  _CUrlLoggerState get _value => super._value as _CUrlLoggerState;

  @override
  $Res call({
    Object? list = freezed,
  }) {
    return _then(_CUrlLoggerState(
      list: list == freezed
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<CurlLoggerItem>,
    ));
  }
}

/// @nodoc

class _$_CUrlLoggerState extends _CUrlLoggerState {
  const _$_CUrlLoggerState({required this.list}) : super._();

  @override
  final List<CurlLoggerItem> list;

  @override
  String toString() {
    return 'CUrlLoggerState(list: $list)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CUrlLoggerState &&
            (identical(other.list, list) ||
                const DeepCollectionEquality().equals(other.list, list)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(list);

  @JsonKey(ignore: true)
  @override
  _$CUrlLoggerStateCopyWith<_CUrlLoggerState> get copyWith =>
      __$CUrlLoggerStateCopyWithImpl<_CUrlLoggerState>(this, _$identity);
}

abstract class _CUrlLoggerState extends CUrlLoggerState {
  const factory _CUrlLoggerState({required List<CurlLoggerItem> list}) =
      _$_CUrlLoggerState;
  const _CUrlLoggerState._() : super._();

  @override
  List<CurlLoggerItem> get list => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CUrlLoggerStateCopyWith<_CUrlLoggerState> get copyWith =>
      throw _privateConstructorUsedError;
}
