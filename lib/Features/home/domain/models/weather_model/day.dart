import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'condition.dart';

class Day extends Equatable {
  final double? maxtempC;
  final double? mintempC;
  final double? avgtempC;
  final Condition? condition;

  const Day({
    this.maxtempC,
    this.mintempC,
    this.avgtempC,
    this.condition,
  });

  factory Day.fromMap(Map<String, dynamic> data) => Day(
        maxtempC: (data['maxtemp_c'] as num?)?.toDouble(),
        mintempC: (data['mintemp_c'] as num?)?.toDouble(),
        avgtempC: (data['avgtemp_c'] as num?)?.toDouble(),
       
        condition: data['condition'] == null
            ? null
            : Condition.fromMap(data['condition'] as Map<String, dynamic>),
       
      );

  Map<String, dynamic> toMap() => {
        'maxtemp_c': maxtempC,
        'mintemp_c': mintempC,
        'avgtemp_c': avgtempC,
      };

  
  factory Day.fromJson(String data) {
    return Day.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props {
    return [
      maxtempC,
      mintempC,
      avgtempC,
      condition,
    ];
  }
}
