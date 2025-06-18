import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';
part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherService) : super(WeatherInitial());
  WeatherModel? weather;
  String? cityName;
  WeatherService weatherService;
  void getWeather({required String cityName}) async {
    emit(WeatherLoading());
    try {
      weather = await weatherService.getWeather(cityName: cityName);
      this.cityName = cityName;
      emit(WeatherSucsuss());
    } on Exception catch (e) {
      emit(WeatherError(e.toString()));
    }
  }
}
