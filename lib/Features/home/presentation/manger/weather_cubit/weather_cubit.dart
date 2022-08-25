import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:myweather/Features/home/domain/models/weather_model/weather_model.dart';
import 'package:myweather/Features/home/domain/repositries/home_repo.dart';
import 'package:myweather/constants.dart';
import 'package:myweather/core/singleton/shared_prefrence_singleton.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.homeRepo) : super(WeatherInitial());

  final HomeRepo homeRepo;

  void loginUser({required String email, required String password}) async {
    emit(WeatherLoading());

    var result = await homeRepo.getWeatehr(
        cityName: Prefs.prefs.getString(kCityName) ?? 'Alexandria');
    result.fold((l) {
      emit(WeatherFailure(l.errMessage));
    }, (r) {
      emit(WeatherSuccess(
        weatherModel: r,
      ));
    });
  }
}
