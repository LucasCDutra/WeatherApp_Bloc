import 'dart:convert';

import 'package:bloc_weatherapp/application/gateway/weather.gateway.dart';
import 'package:bloc_weatherapp/domain/models/weather_model.dart';

class WeatherService {
  final WeatherGateway weatherGateway;
  WeatherService(this.weatherGateway);

  Future<WeatherModel> getCurrentWeather() async {
    try {
      const cityName = 'São Paulo';
      final data = await weatherGateway.getCurrentWeather(cityName);
      return data;
    } catch (e) {
      throw e.toString();
    }
  }
}
