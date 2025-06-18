import 'package:flutter/material.dart';
import 'package:weather_app/cubit/weather_cubit.dart';

class BodySucsuss extends StatelessWidget {
   final WeatherCubit cubit;
  const BodySucsuss({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        cubit.weather!.getThemeColor(),
                        cubit.weather!.getThemeColor()[300]!,
                        cubit.weather!.getThemeColor()[100]!,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(flex: 3),
                      Text(
                        cubit.weather!.cityName,
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'updated at : ${cubit.weather!.date.hour.toString()}:${cubit.weather!.date.minute.toString()}',
                        style: TextStyle(fontSize: 22),
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(cubit.weather!.getImage()),
                          Text(
                            cubit.weather!.temp.toInt().toString(),
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                'maxTemp :${cubit.weather!.maxTemp.toInt()}',
                              ),
                              Text(
                                'minTemp : ${cubit.weather!.minTemp.toInt()}',
                              ),
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                      Text(
                        cubit.weather!.weatherStateName,
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(flex: 5),
                    ],
                  ),
                );
  }
}