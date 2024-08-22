import 'dart:convert';

import 'package:bloc_weatherapp/domain/models/weather_model.dart';
import 'package:bloc_weatherapp/infrastructure/openweather/service/weather.service.external.dart';

class WeatherGateway {
  final WeatherDataProvider weatherDataProvider;
  WeatherGateway(this.weatherDataProvider);

  Future<WeatherModel> getCurrentWeather(cityName) async {
    try {
      final weatherData = await weatherDataProvider.getCurrentWeather(cityName);
      final data = jsonDecode(weatherData);

      if (data['cod'] != '200') {
        throw 'An unexpected error occurred';
      }

      return WeatherModel.fromMap(data);
    } catch (e) {
      throw e.toString();
    }
  }
}
