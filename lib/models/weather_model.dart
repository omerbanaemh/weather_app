
import 'package:flutter/material.dart';

class WeatherModel {
  final String cityName;
  final DateTime date;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String weatherStateName;
  final String? image;

  WeatherModel(
      {
    required this.cityName,
    required this.date,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherStateName,
    this.image,
  });

  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];

    return WeatherModel(
      cityName: data['location']['name'],
      date: DateTime.parse(data['current']['last_updated']),
      temp: jsonData['avgtemp_c'],
      maxTemp: jsonData['maxtemp_c'],
      minTemp: jsonData['mintemp_c'],
      weatherStateName: jsonData['condition']['text'],
    );
  }

  @override
  String toString() {
    return 'temp = $temp, minTemp = $minTemp, date = $date';
  }

  String _cleanString() => weatherStateName.toLowerCase().trim();

  static const clearStates = {'sunny', 'clear', 'partly cloudy'};
  static const snowStates = {
    'blizzard',
    'patchy snow possible',
    'patchy sleet possible',
    'patchy freezing drizzle possible',
    'blowing snow',
  };
  static const cloudyStates = {'freezing fog', 'fog', 'heavy cloud', 'mist'};
  static const rainStates = {'patchy rain possible', 'heavy rain', 'showers'};
  static const thunderStates = {
    'thundery outbreaks possible',
    'moderate or heavy snow with thunder',
    'patchy light snow with thunder',
    'moderate or heavy rain with thunder',
    'patchy light rain with thunder',
  };

  String getImage() {
    final state = _cleanString();

    if (clearStates.contains(state)) {
      return 'assets/images/clear.png';
    } else if (snowStates.contains(state)) {
      return 'assets/images/snow.png';
    } else if (cloudyStates.contains(state)) {
      return 'assets/images/cloudy.png';
    } else if (rainStates.contains(state)) {
      return 'assets/images/rainy.png';
    } else if (thunderStates.contains(state)) {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

  MaterialColor getThemeColor() {
    final state = _cleanString();
    if (clearStates.contains(state)) {
      return Colors.orange;
    } else if (snowStates.contains(state)) {
      return Colors.blue;
    } else if (cloudyStates.contains(state)) {
      return Colors.blueGrey;
    } else if (rainStates.contains(state)) {
      return Colors.blue;
    } else if (thunderStates.contains(state)) {
      return Colors.deepPurple;
    } else {
      return Colors.orange;
    }
  }
}
