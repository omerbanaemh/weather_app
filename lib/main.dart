import 'package:flutter/material.dart';
import 'package:weather_app/cubit/weather_cubit.dart';
import 'package:weather_app/obServer/bloc_observer.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/services/weather_service.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(
    BlocProvider(
      create: (context) => WeatherCubit(WeatherService()),
      child: WeatherApp(),
    ),
  );
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch:
                BlocProvider.of<WeatherCubit>(context).weather == null
                ? Colors.blue
                : BlocProvider.of<WeatherCubit>(
                    context,
                  ).weather!.getThemeColor(),
          ),
          home: HomePage(),
        );
      },
    );
  }
}
