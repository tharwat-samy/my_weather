import 'package:dartz/dartz.dart';
import 'package:myweather/Features/home/domain/models/weather_model/weather_model.dart';

import '../../../../core/Error/failures.dart';

abstract class HomeRepo {
  Future<Either<Failure, WeatherModel>> getWeatehr({required String cityName});
}
