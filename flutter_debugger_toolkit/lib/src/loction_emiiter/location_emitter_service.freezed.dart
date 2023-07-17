// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'location_emitter_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PointTearOff {
  const _$PointTearOff();

  _Point call({required double latitude, required double longitude}) {
    return _Point(
      latitude: latitude,
      longitude: longitude,
    );
  }
}

/// @nodoc
const $Point = _$PointTearOff();

/// @nodoc
mixin _$Point {
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PointCopyWith<Point> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PointCopyWith<$Res> {
  factory $PointCopyWith(Point value, $Res Function(Point) then) =
      _$PointCopyWithImpl<$Res>;
  $Res call({double latitude, double longitude});
}

/// @nodoc
class _$PointCopyWithImpl<$Res> implements $PointCopyWith<$Res> {
  _$PointCopyWithImpl(this._value, this._then);

  final Point _value;
  // ignore: unused_field
  final $Res Function(Point) _then;

  @override
  $Res call({
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_value.copyWith(
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$PointCopyWith<$Res> implements $PointCopyWith<$Res> {
  factory _$PointCopyWith(_Point value, $Res Function(_Point) then) =
      __$PointCopyWithImpl<$Res>;
  @override
  $Res call({double latitude, double longitude});
}

/// @nodoc
class __$PointCopyWithImpl<$Res> extends _$PointCopyWithImpl<$Res>
    implements _$PointCopyWith<$Res> {
  __$PointCopyWithImpl(_Point _value, $Res Function(_Point) _then)
      : super(_value, (v) => _then(v as _Point));

  @override
  _Point get _value => super._value as _Point;

  @override
  $Res call({
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_Point(
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_Point extends _Point {
  const _$_Point({required this.latitude, required this.longitude}) : super._();

  @override
  final double latitude;
  @override
  final double longitude;

  @override
  String toString() {
    return 'Point(latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Point &&
            (identical(other.latitude, latitude) ||
                const DeepCollectionEquality()
                    .equals(other.latitude, latitude)) &&
            (identical(other.longitude, longitude) ||
                const DeepCollectionEquality()
                    .equals(other.longitude, longitude)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(latitude) ^
      const DeepCollectionEquality().hash(longitude);

  @JsonKey(ignore: true)
  @override
  _$PointCopyWith<_Point> get copyWith =>
      __$PointCopyWithImpl<_Point>(this, _$identity);
}

abstract class _Point extends Point {
  const factory _Point({required double latitude, required double longitude}) =
      _$_Point;
  const _Point._() : super._();

  @override
  double get latitude => throw _privateConstructorUsedError;
  @override
  double get longitude => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PointCopyWith<_Point> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
class _$PointLocationDataTearOff {
  const _$PointLocationDataTearOff();

  _PointLocationData call(
      {required Point point,
      required double heading,
      required double speed,
      required DateTime time}) {
    return _PointLocationData(
      point: point,
      heading: heading,
      speed: speed,
      time: time,
    );
  }
}

/// @nodoc
const $PointLocationData = _$PointLocationDataTearOff();

/// @nodoc
mixin _$PointLocationData {
  Point get point => throw _privateConstructorUsedError;
  double get heading => throw _privateConstructorUsedError;
  double get speed => throw _privateConstructorUsedError;
  DateTime get time => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PointLocationDataCopyWith<PointLocationData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PointLocationDataCopyWith<$Res> {
  factory $PointLocationDataCopyWith(
          PointLocationData value, $Res Function(PointLocationData) then) =
      _$PointLocationDataCopyWithImpl<$Res>;
  $Res call({Point point, double heading, double speed, DateTime time});

  $PointCopyWith<$Res> get point;
}

/// @nodoc
class _$PointLocationDataCopyWithImpl<$Res>
    implements $PointLocationDataCopyWith<$Res> {
  _$PointLocationDataCopyWithImpl(this._value, this._then);

  final PointLocationData _value;
  // ignore: unused_field
  final $Res Function(PointLocationData) _then;

  @override
  $Res call({
    Object? point = freezed,
    Object? heading = freezed,
    Object? speed = freezed,
    Object? time = freezed,
  }) {
    return _then(_value.copyWith(
      point: point == freezed
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as Point,
      heading: heading == freezed
          ? _value.heading
          : heading // ignore: cast_nullable_to_non_nullable
              as double,
      speed: speed == freezed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as double,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  @override
  $PointCopyWith<$Res> get point {
    return $PointCopyWith<$Res>(_value.point, (value) {
      return _then(_value.copyWith(point: value));
    });
  }
}

/// @nodoc
abstract class _$PointLocationDataCopyWith<$Res>
    implements $PointLocationDataCopyWith<$Res> {
  factory _$PointLocationDataCopyWith(
          _PointLocationData value, $Res Function(_PointLocationData) then) =
      __$PointLocationDataCopyWithImpl<$Res>;
  @override
  $Res call({Point point, double heading, double speed, DateTime time});

  @override
  $PointCopyWith<$Res> get point;
}

/// @nodoc
class __$PointLocationDataCopyWithImpl<$Res>
    extends _$PointLocationDataCopyWithImpl<$Res>
    implements _$PointLocationDataCopyWith<$Res> {
  __$PointLocationDataCopyWithImpl(
      _PointLocationData _value, $Res Function(_PointLocationData) _then)
      : super(_value, (v) => _then(v as _PointLocationData));

  @override
  _PointLocationData get _value => super._value as _PointLocationData;

  @override
  $Res call({
    Object? point = freezed,
    Object? heading = freezed,
    Object? speed = freezed,
    Object? time = freezed,
  }) {
    return _then(_PointLocationData(
      point: point == freezed
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as Point,
      heading: heading == freezed
          ? _value.heading
          : heading // ignore: cast_nullable_to_non_nullable
              as double,
      speed: speed == freezed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as double,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_PointLocationData extends _PointLocationData {
  const _$_PointLocationData(
      {required this.point,
      required this.heading,
      required this.speed,
      required this.time})
      : super._();

  @override
  final Point point;
  @override
  final double heading;
  @override
  final double speed;
  @override
  final DateTime time;

  @override
  String toString() {
    return 'PointLocationData(point: $point, heading: $heading, speed: $speed, time: $time)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PointLocationData &&
            (identical(other.point, point) ||
                const DeepCollectionEquality().equals(other.point, point)) &&
            (identical(other.heading, heading) ||
                const DeepCollectionEquality()
                    .equals(other.heading, heading)) &&
            (identical(other.speed, speed) ||
                const DeepCollectionEquality().equals(other.speed, speed)) &&
            (identical(other.time, time) ||
                const DeepCollectionEquality().equals(other.time, time)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(point) ^
      const DeepCollectionEquality().hash(heading) ^
      const DeepCollectionEquality().hash(speed) ^
      const DeepCollectionEquality().hash(time);

  @JsonKey(ignore: true)
  @override
  _$PointLocationDataCopyWith<_PointLocationData> get copyWith =>
      __$PointLocationDataCopyWithImpl<_PointLocationData>(this, _$identity);
}

abstract class _PointLocationData extends PointLocationData {
  const factory _PointLocationData(
      {required Point point,
      required double heading,
      required double speed,
      required DateTime time}) = _$_PointLocationData;
  const _PointLocationData._() : super._();

  @override
  Point get point => throw _privateConstructorUsedError;
  @override
  double get heading => throw _privateConstructorUsedError;
  @override
  double get speed => throw _privateConstructorUsedError;
  @override
  DateTime get time => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PointLocationDataCopyWith<_PointLocationData> get copyWith =>
      throw _privateConstructorUsedError;
}
