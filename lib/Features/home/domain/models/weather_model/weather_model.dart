import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'current.dart';
import 'forecast.dart';
import 'location.dart';

class WeatherModel extends Equatable {
  final Location? location;
  final Current? current;
  final Forecast? forecast;

  const WeatherModel({this.location, this.current, this.forecast});

  factory WeatherModel.fromMap(Map<String, dynamic> data) => WeatherModel(
        location: data['location'] == null
            ? null
            : Location.fromMap(data['location'] as Map<String, dynamic>),
        current: data['current'] == null
            ? null
            : Current.fromMap(data['current'] as Map<String, dynamic>),
        forecast: data['forecast'] == null
            ? null
            : Forecast.fromMap(data['forecast'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'location': location?.toMap(),
        'current': current?.toMap(),
        'forecast': forecast?.toMap(),
      };

  factory WeatherModel.fromJson( data) {
    return WeatherModel.fromMap(data);
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [location, current, forecast];
}
