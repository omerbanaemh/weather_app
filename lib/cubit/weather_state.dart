part of 'weather_cubit.dart';

sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class WeatherLoading extends WeatherState {}
final class WeatherSucsuss extends WeatherState {}
class WeatherError extends WeatherState {
  final String message;
  WeatherError(this.message);
}

