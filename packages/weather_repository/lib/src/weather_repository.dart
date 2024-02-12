import 'package:open_weather_api/open_weather_api.dart' hide Weather;
import 'package:weather_repository/weather_repository.dart';

class WeatherRepository {
  WeatherRepository(
      {OpenWeatherApiClient? weatherApiClient, required this.apiKey,})
      : _weatherApiClient = weatherApiClient ?? OpenWeatherApiClient();

  final OpenWeatherApiClient _weatherApiClient;
  final String apiKey;

  Future<Weather> fetchWeather(City city, String apiKey) async {
    final weather = await _weatherApiClient.getWeather(
      latitude: city.latitude,
      longitude: city.longitude,
      apiKey: apiKey,
    );
    return Weather(
      city: city.name,
      temperature: weather.temperature,
      humidity: 0.0,
      windSpeed: 0.0,
      minTemperature: 0.0,
      maxTemperature: 0.0,
    );
  }
}
