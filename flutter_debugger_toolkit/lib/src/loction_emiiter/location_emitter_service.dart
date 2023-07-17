import 'package:flutter_debugger_toolkit/src/loction_emiiter/geodesy.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gpx/gpx.dart';
import 'package:latlong2/latlong.dart';

part 'location_emitter_service.freezed.dart';

final geodesy = Geodesy();

class PointLocationReplayer {
  final List<Point> points;
  PointLocationReplayer({
    required this.points,
  });

  factory PointLocationReplayer.geometry({
    required String gemetry,
    int precision = 6,
  }) {
    final pointsRaw = GeometriesHelper.decode(gemetry, precision: precision);
    final points = pointsRaw
        .where((element) => element.length == 2)
        .map((e) =>
            Point(latitude: e.first.toDouble(), longitude: e.last.toDouble()))
        .toList();
    return PointLocationReplayer(points: points);
  }

  factory PointLocationReplayer.gpx({
    required String gpxString,
  }) {
    final gpx = GpxReader().fromString(gpxString);
    final wpts = gpx.wpts;
    final points = wpts
        .where((element) => element.lat != null && element.lon != null)
        .map((e) => Point(latitude: e.lat!, longitude: e.lon!))
        .toList();
    return PointLocationReplayer(points: points);
  }

  Stream<PointLocationData> start({
    Duration duration = const Duration(seconds: 1),
  }) async* {
    PointLocationData? lastEmitted;
    for (final point in points) {
      if (lastEmitted == null) {
        lastEmitted = PointLocationData(
          point: point,
          heading: 0,
          speed: 0,
          time: DateTime.now(),
        );
      } else {
        final from = LatLng(
          lastEmitted.point.latitude,
          lastEmitted.point.longitude,
        );
        final to = LatLng(
          point.latitude,
          point.longitude,
        );
        final time = DateTime.now();

        final heading = geodesy.bearingBetweenTwoGeoPoints(from, to).toDouble();

        print('heading: $heading');
        final speed = geodesy.distanceBetweenTwoGeoPoints(from, to) /
            lastEmitted.time.difference(time).abs().inSeconds;
        lastEmitted = PointLocationData(
          point: point,
          heading: heading,
          speed: speed,
          time: time,
        );
      }
      await Future.delayed(duration);
      yield lastEmitted;
    }
  }
}

@freezed

///[Point]
class Point with _$Point {
  ///[Point]
  const factory Point({
    required double latitude,
    required double longitude,
  }) = _Point;
  const Point._();
}

@freezed

///[PointLocationData]
class PointLocationData with _$PointLocationData {
  ///[PointLocationData]
  const factory PointLocationData({
    required Point point,
    required double heading,
    required double speed,
    required DateTime time,
  }) = _PointLocationData;
  const PointLocationData._();
}
