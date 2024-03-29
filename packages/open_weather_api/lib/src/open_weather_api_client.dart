import 'dart:convert';

import 'package:http/http.dart' as http;

import '../open_weather_api.dart';

class OpenWeatherApiClient {
  static const _baseUrl = 'api.openweathermap.org';

  final http.Client _httpClient;

  OpenWeatherApiClient({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  Future<Weather> getWeather({
    required double latitude,
    required double longitude,
    required String apiKey,
  }) async {
    final request = Uri.https(
      _baseUrl,
      '/data/3.0/onecall',
      {
        'lat': latitude.toString(),
        'lon': longitude.toString(),
        'appid': apiKey,
      },
    );

    final response = await _httpClient.get(request);

    if (response.statusCode != 200) {
      print(response.statusCode);
      print(response.body);
      throw Exception('Unable to fetch weather');
    }

    final json = jsonDecode(response.body) as Map<String,dynamic>;

    return Weather.fromJson(json);
  }
}
