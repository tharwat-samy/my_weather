import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:myweather/Features/home/domain/models/weather_model/location.dart';
import 'package:myweather/core/Error/failures.dart';

abstract class PickLocationRepo {
  Future<Either<Failure, String>> getLocation();
  Future<String> DecodeLocation({required Position position});
}
