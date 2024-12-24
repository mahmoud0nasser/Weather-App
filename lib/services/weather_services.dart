import 'dart:developer';

import 'package:dio/dio.dart';

import '../models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '17d517c894eb42dd83442955231109';

  WeatherService(
    this.dio,
  );
  Future<WeatherModel> getCurrentWeather({
    required String cityName,
  }) async {
    try {
      Response response = await dio.get(
        '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1',
        // 'https://api.weatherapi.com/v1/forecast.json?key=17d517c894eb42dd83442955231109&q=${cityName}&days=1',
      );

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);

      return weatherModel;
    } on DioException catch (e) {
      final errorMessage = e.response?.data['error']['message'] ??
          'OOPs: There was an error, try later';
      throw Exception(errorMessage);
      // return null;
    } catch (e) {
      log(e.toString());
      throw Exception(
        'OOPs: There was an error, try later',
      );
    }

    /* Response response = await dio.get(
      '$baseUrl/forecast.json?key=17d517c894eb42dd83442955231109&q=$cityName&days=1',
      // 'https://api.weatherapi.com/v1/forecast.json?key=17d517c894eb42dd83442955231109&q=${cityName}&days=1',
    );
    if (response.statusCode == 200) {
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
    } else {
      final String errorMessage = response.data['error']['message'];
      throw Exception(errorMessage);
    } */

    /* try {
      Response response = await dio.get(
        '$baseUrl/forecast.json?key=17d517c894eb42dd83442955231109&q=$cityName&days=1',
        // 'https://api.weatherapi.com/v1/forecast.json?key=17d517c894eb42dd83442955231109&q=${cityName}&days=1',
      );
      if (response.statusCode == 200) {
        WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      } else {
        final String errorMessage = response.data['error']['message'];
        throw Exception(errorMessage);
      }

      return weatherModel;
    } 
    catch (e) {
      return null;
    } */
  }

// oops there was an error, try later

  /* Future<WeatherModel> getForcast({
    required String cityName,
  }) async {
    Response response = await dio.get(
      '$baseUrl/forecast.json?key=17d517c894eb42dd83442955231109&q=$cityName&days=1',
    );
    WeatherModel weatherModel = WeatherModel.fromJson(response.data);
    return weatherModel;
  } */
}
