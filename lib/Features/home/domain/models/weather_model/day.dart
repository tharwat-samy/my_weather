import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'condition.dart';

class Day extends Equatable {
  final double? maxtempC;
  final int? maxtempF;
  final double? mintempC;
  final double? mintempF;
  final double? avgtempC;
  final double? avgtempF;
  final double? maxwindMph;
  final double? maxwindKph;
  final double? totalprecipMm;
  final double? totalprecipIn;
  final double? avgvisKm;
  final int? avgvisMiles;
  final int? avghumidity;
  final int? dailyWillItRain;
  final int? dailyChanceOfRain;
  final int? dailyWillItSnow;
  final int? dailyChanceOfSnow;
  final Condition? condition;
  final int? uv;

  const Day({
    this.maxtempC,
    this.maxtempF,
    this.mintempC,
    this.mintempF,
    this.avgtempC,
    this.avgtempF,
    this.maxwindMph,
    this.maxwindKph,
    this.totalprecipMm,
    this.totalprecipIn,
    this.avgvisKm,
    this.avgvisMiles,
    this.avghumidity,
    this.dailyWillItRain,
    this.dailyChanceOfRain,
    this.dailyWillItSnow,
    this.dailyChanceOfSnow,
    this.condition,
    this.uv,
  });

  factory Day.fromMap(Map<String, dynamic> data) => Day(
        maxtempC: (data['maxtemp_c'] as num?)?.toDouble(),
        maxtempF: data['maxtemp_f'] as int?,
        mintempC: (data['mintemp_c'] as num?)?.toDouble(),
        mintempF: (data['mintemp_f'] as num?)?.toDouble(),
        avgtempC: (data['avgtemp_c'] as num?)?.toDouble(),
        avgtempF: (data['avgtemp_f'] as num?)?.toDouble(),
        maxwindMph: (data['maxwind_mph'] as num?)?.toDouble(),
        maxwindKph: (data['maxwind_kph'] as num?)?.toDouble(),
        totalprecipMm: (data['totalprecip_mm'] as num?)?.toDouble(),
        totalprecipIn: (data['totalprecip_in'] as num?)?.toDouble(),
        avgvisKm: (data['avgvis_km'] as num?)?.toDouble(),
        avgvisMiles: data['avgvis_miles'] as int?,
        avghumidity: data['avghumidity'] as int?,
        dailyWillItRain: data['daily_will_it_rain'] as int?,
        dailyChanceOfRain: data['daily_chance_of_rain'] as int?,
        dailyWillItSnow: data['daily_will_it_snow'] as int?,
        dailyChanceOfSnow: data['daily_chance_of_snow'] as int?,
        condition: data['condition'] == null
            ? null
            : Condition.fromMap(data['condition'] as Map<String, dynamic>),
        uv: data['uv'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'maxtemp_c': maxtempC,
        'maxtemp_f': maxtempF,
        'mintemp_c': mintempC,
        'mintemp_f': mintempF,
        'avgtemp_c': avgtempC,
        'avgtemp_f': avgtempF,
        'maxwind_mph': maxwindMph,
        'maxwind_kph': maxwindKph,
        'totalprecip_mm': totalprecipMm,
        'totalprecip_in': totalprecipIn,
        'avgvis_km': avgvisKm,
        'avgvis_miles': avgvisMiles,
        'avghumidity': avghumidity,
        'daily_will_it_rain': dailyWillItRain,
        'daily_chance_of_rain': dailyChanceOfRain,
        'daily_will_it_snow': dailyWillItSnow,
        'daily_chance_of_snow': dailyChanceOfSnow,
        'condition': condition?.toMap(),
        'uv': uv,
      };

  
  factory Day.fromJson(String data) {
    return Day.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props {
    return [
      maxtempC,
      maxtempF,
      mintempC,
      mintempF,
      avgtempC,
      avgtempF,
      maxwindMph,
      maxwindKph,
      totalprecipMm,
      totalprecipIn,
      avgvisKm,
      avgvisMiles,
      avghumidity,
      dailyWillItRain,
      dailyChanceOfRain,
      dailyWillItSnow,
      dailyChanceOfSnow,
      condition,
      uv,
    ];
  }
}
