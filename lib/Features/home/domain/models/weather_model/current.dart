import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'condition.dart';

class Current extends Equatable {
  final int? lastUpdatedEpoch;
  final String? lastUpdated;
  final int? tempC;
  final double? tempF;
  final int? isDay;
  final Condition? condition;
  final double? windMph;
  final int? windKph;
  final int? windDegree;
  final String? windDir;
  final int? pressureMb;
  final double? pressureIn;
  final double? precipMm;
  final double? precipIn;
  final int? humidity;
  final int? cloud;
  final int? feelslikeC;
  final double? feelslikeF;
  final int? visKm;
  final int? visMiles;
  final int? uv;
  final double? gustMph;
  final double? gustKph;

  const Current({
    this.lastUpdatedEpoch,
    this.lastUpdated,
    this.tempC,
    this.tempF,
    this.isDay,
    this.condition,
    this.windMph,
    this.windKph,
    this.windDegree,
    this.windDir,
    this.pressureMb,
    this.pressureIn,
    this.precipMm,
    this.precipIn,
    this.humidity,
    this.cloud,
    this.feelslikeC,
    this.feelslikeF,
    this.visKm,
    this.visMiles,
    this.uv,
    this.gustMph,
    this.gustKph,
  });

  factory Current.fromMap(Map<String, dynamic> data) => Current(
        lastUpdatedEpoch: data['last_updated_epoch'] as int?,
        lastUpdated: data['last_updated'] as String?,
        tempC: data['temp_c'] as int?,
        tempF: (data['temp_f'] as num?)?.toDouble(),
        isDay: data['is_day'] as int?,
        condition: data['condition'] == null
            ? null
            : Condition.fromMap(data['condition'] as Map<String, dynamic>),
        windMph: (data['wind_mph'] as num?)?.toDouble(),
        windKph: data['wind_kph'] as int?,
        windDegree: data['wind_degree'] as int?,
        windDir: data['wind_dir'] as String?,
        pressureMb: data['pressure_mb'] as int?,
        pressureIn: (data['pressure_in'] as num?)?.toDouble(),
        precipMm: (data['precip_mm'] as num?)?.toDouble(),
        precipIn: (data['precip_in'] as num?)?.toDouble(),
        humidity: data['humidity'] as int?,
        cloud: data['cloud'] as int?,
        feelslikeC: data['feelslike_c'] as int?,
        feelslikeF: (data['feelslike_f'] as num?)?.toDouble(),
        visKm: data['vis_km'] as int?,
        visMiles: data['vis_miles'] as int?,
        uv: data['uv'] as int?,
        gustMph: (data['gust_mph'] as num?)?.toDouble(),
        gustKph: (data['gust_kph'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        'last_updated_epoch': lastUpdatedEpoch,
        'last_updated': lastUpdated,
        'temp_c': tempC,
        'temp_f': tempF,
        'is_day': isDay,
        'condition': condition?.toMap(),
        'wind_mph': windMph,
        'wind_kph': windKph,
        'wind_degree': windDegree,
        'wind_dir': windDir,
        'pressure_mb': pressureMb,
        'pressure_in': pressureIn,
        'precip_mm': precipMm,
        'precip_in': precipIn,
        'humidity': humidity,
        'cloud': cloud,
        'feelslike_c': feelslikeC,
        'feelslike_f': feelslikeF,
        'vis_km': visKm,
        'vis_miles': visMiles,
        'uv': uv,
        'gust_mph': gustMph,
        'gust_kph': gustKph,
      };

  factory Current.fromJson(String data) {
    return Current.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props {
    return [
      lastUpdatedEpoch,
      lastUpdated,
      tempC,
      tempF,
      isDay,
      condition,
      windMph,
      windKph,
      windDegree,
      windDir,
      pressureMb,
      pressureIn,
      precipMm,
      precipIn,
      humidity,
      cloud,
      feelslikeC,
      feelslikeF,
      visKm,
      visMiles,
      uv,
      gustMph,
      gustKph,
    ];
  }
}
