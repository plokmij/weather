import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather/app.dart';
import 'package:weather_repository/weather_repository.dart';

void main() async {
  await dotenv.load(fileName: "assets/.env");
  runApp(
    WeatherApp(
      weatherRepository: WeatherRepository(apiKey: dotenv.env['API_KEY'] ?? ''),
    ),
  );
}
