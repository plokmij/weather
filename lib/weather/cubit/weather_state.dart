// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'weather_cubit.dart';

enum WeatherStatus {
  initial,
  loading,
  success,
  failure;

  bool get isInitial => this == WeatherStatus.initial;
  bool get isLoading => this == WeatherStatus.loading;
  bool get isSuccess => this == WeatherStatus.success;
  bool get isFailure => this == WeatherStatus.failure;
}

class WeatherState {
  final WeatherStatus weatherStatus;
  final Weather weather;

  const WeatherState({
    required this.weather,
    required this.weatherStatus,
  });

  WeatherState copyWith({
    WeatherStatus? weatherStatus,
    Weather? weather,
  }) {
    return WeatherState(
      weatherStatus: weatherStatus ?? this.weatherStatus,
      weather: weather ?? this.weather,
    );
  }

  factory WeatherState.initial() {
    return WeatherState(
      weather: Weather(
        city: '',
        temperature: 0.0,
        humidity: 0.0,
        windSpeed: 0.0,
        minTemperature: 0.0,
        maxTemperature: 0.0,
      ),
      weatherStatus: WeatherStatus.initial,
    );
  }
}
