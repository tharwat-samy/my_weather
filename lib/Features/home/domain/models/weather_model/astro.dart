import 'dart:convert';

import 'package:equatable/equatable.dart';

class Astro extends Equatable {
  final String? sunrise;
  final String? sunset;
  final String? moonrise;
  final String? moonset;
  final String? moonPhase;
  final String? moonIllumination;

  const Astro({
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.moonPhase,
    this.moonIllumination,
  });

  factory Astro.fromMap(Map<String, dynamic> data) => Astro(
        sunrise: data['sunrise'] as String?,
        sunset: data['sunset'] as String?,
        moonrise: data['moonrise'] as String?,
        moonset: data['moonset'] as String?,
        moonPhase: data['moon_phase'] as String?,
        moonIllumination: data['moon_illumination'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'sunrise': sunrise,
        'sunset': sunset,
        'moonrise': moonrise,
        'moonset': moonset,
        'moon_phase': moonPhase,
        'moon_illumination': moonIllumination,
      };

  factory Astro.fromJson(String data) {
    return Astro.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props {
    return [
      sunrise,
      sunset,
      moonrise,
      moonset,
      moonPhase,
      moonIllumination,
    ];
  }
}
