import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  WeatherService({required this.dio});

  static const String baseUrl = 'http://api.weatherapi.com/v1';
  static const String apiKey = '3677bed892474b30b7a122242220806';

  Future<WeatherModel> getWeather({required String cityName}) async {
    final url = '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7';
    try {
      final response = await dio.get(url);

      if (response.statusCode == 200) {
        return WeatherModel.fromJson(response.data);
      } else {
        final errorMessage =
            response.data['error']?['message'] ?? 'opps there was an error, try later';
        throw Exception('Error: $errorMessage');
      }
    } on DioException catch (e) {
      final String errMessage =
          e.response?.data['error']['message'] ??
          "opps there was an error, try later";
      throw Exception(errMessage);
    } catch (e) {
      log(e.toString());
      throw Exception("opps there was an error, try later");
    }
  }
}
