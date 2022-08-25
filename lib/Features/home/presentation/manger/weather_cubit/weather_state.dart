part of 'weather_cubit.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherFailure extends WeatherState {
  final String errMessage;

  const WeatherFailure( this.errMessage);
}

class WeatherSuccess extends WeatherState {
  final WeatherModel weatherModel;

  const WeatherSuccess({required this.weatherModel});
}
