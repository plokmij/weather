import 'package:bloc/bloc.dart';
import 'package:weather_repository/weather_repository.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherCubit({required this.weatherRepository})
      : super(WeatherState.initial());

  Future<void> getWeather(City city) async {
    emit(
      state.copyWith(
        weatherStatus: WeatherStatus.loading,
      ),
    );

    try {
      final weather = await weatherRepository.fetchWeather(city);
      emit(
        state.copyWith(
          weather: weather,
          weatherStatus: WeatherStatus.success,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          weatherStatus: WeatherStatus.failure,
        ),
      );
    }
  }
}
