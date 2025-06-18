import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_cubit.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});
  @override
  Widget build(BuildContext context) {
    String? cityName;
    final cubit = context.read<WeatherCubit>();
    return Scaffold(
      appBar: AppBar(title: Text('Search a City')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onSubmitted: (data) async {
              cityName = data;
              if (cityName != null) {
                cubit.getWeather(cityName: cityName!);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('place insert city name')),
                );
              }
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 32,
                horizontal: 24,
              ),
              label: Text('search'),
              suffixIcon: GestureDetector(
                onTap: () async {
                  if (cityName != null) {
                    cubit.getWeather(cityName: cityName!);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('place insert city name')),
                    );
                  }
                  Navigator.pop(context);
                },
                child: Icon(Icons.search),
              ),
              border: OutlineInputBorder(),
              hintText: 'Enter a city',
            ),
          ),
        ),
      ),
    );
  }
}
