import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_cubit.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/pages/widgets/body_initial.dart';
import 'package:weather_app/pages/widgets/body_sucsuss.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit, WeatherState>(
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
              ? BodySucsuss(cubit: cubit,)
              : BodyInitial()
        );
      },
      listener: (BuildContext context, WeatherState state) {
        if (state is WeatherError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
    );
  }
}
