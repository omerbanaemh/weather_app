import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_cubit.dart';
import 'package:weather_app/pages/search_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        final cubit = context.read<WeatherCubit>();

        return Scaffold(
          appBar: AppBar(
            // backgroundColor: cubit.weather?.getThemeColor(),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SearchPage();
                      },
                    ),
                  );
                },
                icon: Icon(Icons.search),
              ),
            ],
            title: Text('Weather App'),
          ),
          body: state is WeatherLoading
              ? Center(child: CircularProgressIndicator())
              : state is WeatherSucsuss
              ? Container(
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
                          Image.asset(
                           cubit.weather!.getImage(),
                          ),
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
                )
              : Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'there is no weather 😔 start',
                        style: TextStyle(fontSize: 30),
                      ),
                      Text('searching now 🔍', style: TextStyle(fontSize: 30)),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
