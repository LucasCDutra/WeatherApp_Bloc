import 'package:bloc_weatherapp/application/controller/bloc/weather/weather_bloc.dart';
import 'package:bloc_weatherapp/application/gateway/weather.gateway.dart';
import 'package:bloc_weatherapp/domain/service/weather.service.dart';
import 'package:bloc_weatherapp/infrastructure/openweather/service/weather.service.external.dart';
import 'package:bloc_weatherapp/pages/weather_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => WeatherService(WeatherGateway(WeatherDataProvider())),
      child: BlocProvider(
        create: (context) => WeatherBloc(context.read<WeatherService>()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark(useMaterial3: true),
          home: const WeatherScreen(),
        ),
      ),
    );
  }
}
