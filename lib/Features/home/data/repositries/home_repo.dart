import 'package:myweather/Features/home/domain/models/weather_model/weather_model.dart';
import 'package:dartz/dartz.dart';
import 'package:myweather/Features/home/domain/repositries/home_repo.dart';
import 'package:myweather/core/Error/failures.dart';
import 'package:myweather/core/utils/api.dart';

class HomeRepoIml implements HomeRepo {
  final Api api;

  HomeRepoIml(this.api);
  @override
  Future<Either<Failure, WeatherModel>> getWeatehr(
      {required String cityName}) async {
    try {
      var response = await api.get(
          endPoint:
              'forecast.json?key=3677bed892474b30b7a122242220806&q=$cityName&days=7');
      return right(
        WeatherModel.fromJson(
          WeatherModel.fromJson(response.data),
        ),
      );
    } catch (e) {
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
