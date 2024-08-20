// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class WeatherModel {
  final double? currentTemp;
  final String? currentSky;
  final double? currentPressure;
  final double? currentWindSpeed;
  final double? currentHumidity;
  WeatherModel({
    this.currentTemp,
    this.currentSky,
    this.currentPressure,
    this.currentWindSpeed,
    this.currentHumidity,
  });

  WeatherModel copyWith({
    double? currentTemp,
    String? currentSky,
    double? currentPressure,
    double? currentWindSpeed,
    double? currentHumidity,
  }) {
    return WeatherModel(
      currentTemp: currentTemp ?? this.currentTemp,
      currentSky: currentSky ?? this.currentSky,
      currentPressure: currentPressure ?? this.currentPressure,
      currentWindSpeed: currentWindSpeed ?? this.currentWindSpeed,
      currentHumidity: currentHumidity ?? this.currentHumidity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'currentTemp': currentTemp,
      'currentSky': currentSky,
      'currentPressure': currentPressure,
      'currentWindSpeed': currentWindSpeed,
      'currentHumidity': currentHumidity,
    };
  }

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    final currentWeatherData = map['list'][0];
    return WeatherModel(
      currentTemp: currentWeatherData['main']['temp'] as double?,
      currentSky: currentWeatherData['weather'][0]['main'] as String?,
      currentPressure: currentWeatherData['main']['currentPressure'] as double?,
      currentWindSpeed: currentWeatherData['wind']['speed'] as double?,
      currentHumidity: currentWeatherData['main']['humidity'] as double?,
    );
  }

  String toJson() => json.encode(toMap());
  factory WeatherModel.fromJson(String source) => WeatherModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WeatherModel(currentTemp: $currentTemp, currentSky: $currentSky, currentPressure: $currentPressure, currentWindSpeed: $currentWindSpeed, currentHumidity: $currentHumidity)';
  }

  @override
  bool operator ==(covariant WeatherModel other) {
    if (identical(this, other)) return true;

    return other.currentTemp == currentTemp &&
        other.currentSky == currentSky &&
        other.currentPressure == currentPressure &&
        other.currentWindSpeed == currentWindSpeed &&
        other.currentHumidity == currentHumidity;
  }

  @override
  int get hashCode {
    return currentTemp.hashCode ^
        currentSky.hashCode ^
        currentPressure.hashCode ^
        currentWindSpeed.hashCode ^
        currentHumidity.hashCode;
  }
}



  //  final data = snapshot.data!;

  //       final currentWeatherData = data['list'][0];

  //       final currentTemp = currentWeatherData['main']['temp'];
  //       final currentSky = currentWeatherData['weather'][0]['main'];
  //       final currentPressure = currentWeatherData['main']['pressure'];
  //       final currentWindSpeed = currentWeatherData['wind']['speed'];
  //       final currentHumidity = currentWeatherData['main']['humidity'];



