import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'day.dart';

class Forecastday extends Equatable {
  final String? date;
  final Day? day;

  const Forecastday({
    this.date,
    this.day,
  });

  factory Forecastday.fromMap(Map<String, dynamic> data) => Forecastday(
        date: data['date'] as String?,
        day: data['day'] == null
            ? null
            : Day.fromMap(data['day'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'date': date,
        'day': day?.toMap(),
      };

  factory Forecastday.fromJson(String data) {
    return Forecastday.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [
        date,
        day,
      ];
}
