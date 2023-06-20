// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'c_url_logger_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
      _$CUrlLoggerStateCopyWithImpl<$Res, CUrlLoggerState>;
  @useResult
  $Res call({List<CurlLoggerItem> list});
}

/// @nodoc
class _$CUrlLoggerStateCopyWithImpl<$Res, $Val extends CUrlLoggerState>
    implements $CUrlLoggerStateCopyWith<$Res> {
  _$CUrlLoggerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
  }) {
    return _then(_value.copyWith(
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<CurlLoggerItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CUrlLoggerStateCopyWith<$Res>
    implements $CUrlLoggerStateCopyWith<$Res> {
  factory _$$_CUrlLoggerStateCopyWith(
          _$_CUrlLoggerState value, $Res Function(_$_CUrlLoggerState) then) =
      __$$_CUrlLoggerStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CurlLoggerItem> list});
}

/// @nodoc
class __$$_CUrlLoggerStateCopyWithImpl<$Res>
    extends _$CUrlLoggerStateCopyWithImpl<$Res, _$_CUrlLoggerState>
    implements _$$_CUrlLoggerStateCopyWith<$Res> {
  __$$_CUrlLoggerStateCopyWithImpl(
      _$_CUrlLoggerState _value, $Res Function(_$_CUrlLoggerState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
  }) {
    return _then(_$_CUrlLoggerState(
      list: null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<CurlLoggerItem>,
    ));
  }
}

/// @nodoc

class _$_CUrlLoggerState extends _CUrlLoggerState {
  const _$_CUrlLoggerState({required final List<CurlLoggerItem> list})
      : _list = list,
        super._();

  final List<CurlLoggerItem> _list;
  @override
  List<CurlLoggerItem> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  String toString() {
    return 'CUrlLoggerState(list: $list)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CUrlLoggerState &&
            const DeepCollectionEquality().equals(other._list, _list));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_list));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CUrlLoggerStateCopyWith<_$_CUrlLoggerState> get copyWith =>
      __$$_CUrlLoggerStateCopyWithImpl<_$_CUrlLoggerState>(this, _$identity);
}

abstract class _CUrlLoggerState extends CUrlLoggerState {
  const factory _CUrlLoggerState({required final List<CurlLoggerItem> list}) =
      _$_CUrlLoggerState;
  const _CUrlLoggerState._() : super._();

  @override
  List<CurlLoggerItem> get list;
  @override
  @JsonKey(ignore: true)
  _$$_CUrlLoggerStateCopyWith<_$_CUrlLoggerState> get copyWith =>
      throw _privateConstructorUsedError;
}
