import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_th/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app_th/cubits/get_weather_cubit/get_weather_states.dart';

// WeatherModel? weatherModel;

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search City',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: Center(
          child: BlocBuilder<GetWeatherCubit, WeatherState>(
              builder: (context, state) {
            return TextField(
              /* onChanged: (value) {
                  print(value);
                }, */
              onSubmitted: (value) async {
                /* weatherModel =
                      await WeatherService(Dio()).getCurrentWeather(
                    cityName: value,
                  ); */
                BlocProvider.of<GetWeatherCubit>(context).getWeather(
                  cityName: value,
                );
                Navigator.pop(context);
                // log(weatherModel.cityName);
              },
              // enabled: false,
              decoration: InputDecoration(
                hintText: 'Enter City Name',
                labelText: 'Search',
                suffixIcon: Icon(
                  Icons.search,
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 24.0,
                ),
                border: OutlineInputBorder(
                  // borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide(
                    color: Colors.green,
                  ),
                ),
                /* enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.amber,
                    ),
                  ), */
              ),
            );
          }),
        ),
      ),
    );
  }
}
