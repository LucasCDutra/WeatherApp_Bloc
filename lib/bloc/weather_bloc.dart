import 'package:bloc/bloc.dart';
import 'package:bloc_weatherapp/data/repository/weather_repository.dart';
import 'package:bloc_weatherapp/models/weather_model.dart';
import 'package:meta/meta.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc(this.weatherRepository) : super(WeatherInitial()) {
    on<WeatherFetched>(_getCurrentWeather);
  }

  void _getCurrentWeather(WeatherFetched event, Emitter<WeatherState> emit) async {
    emit(WeatherLoading());
    try {
      final weather = await weatherRepository.getCurrentWeather();
      emit(WeatherSuccess(weather: weather));
    } catch (e) {
      emit(WeatherFailure(e.toString()));
    }
  }
}
