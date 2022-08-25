import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'condition.dart';

class Current extends Equatable {
  final double? tempC;
  final Condition? condition;

  const Current({
    this.tempC,
    this.condition,
  });

  factory Current.fromMap(Map<String, dynamic> data) => Current(
        tempC: data['temp_c'] as double?,
        condition: data['condition'] == null
            ? null
            : Condition.fromMap(data['condition'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'temp_c': tempC,
        'condition': condition?.toMap(),
      };

  factory Current.fromJson(String data) {
    return Current.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props {
    return [
      tempC,
      condition,
    ];
  }
}
