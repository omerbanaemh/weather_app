import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_cubit.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});
  @override
  Widget build(BuildContext context) {

    return Scaffold(
          appBar: AppBar(title: Text('Search a City')),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                onSubmitted: (data) async {
                  BlocProvider.of<WeatherCubit>(context).getWeather(cityName: data);
               
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
                      // WeatherService service = WeatherService();

                      // WeatherModel? weather = await service.getWeather(
                      //   cityName: cityName!,
                      // );

                      // Provider.of<WeatherProvider>(context,listen: false).weatherData = weather;
                      //              Provider.of<WeatherProvider>(context,listen: false).cityName = cityName;

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
