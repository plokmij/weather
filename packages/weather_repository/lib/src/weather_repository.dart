import 'package:open_weather_api/open_weather_api.dart' hide Weather;
import 'package:weather_repository/weather_repository.dart';

class WeatherRepository {
  WeatherRepository({
    OpenWeatherApiClient? weatherApiClient,
    required String apiKey,
  })  : _weatherApiClient = weatherApiClient ?? OpenWeatherApiClient(),
        _apiKey = apiKey;

  final OpenWeatherApiClient _weatherApiClient;
  final String _apiKey;

  Future<Weather> fetchWeather(City city) async {
    final weather = await _weatherApiClient.getWeather(
      latitude: city.latitude,
      longitude: city.longitude,
      apiKey: _apiKey,
    );
    return Weather(
      city: city.name,
      temperature: weather.current.temp.toCelsius,
      humidity: weather.current.humidity.toDouble(),
      windSpeed: weather.current.windSpeed.toDouble(),
      minTemperature: weather.daily.first.temp.min.toCelsius,
      maxTemperature: weather.daily.first.temp.max.toCelsius,
      weatherDescription: weather.current.weather.first,
    );
  }
}
