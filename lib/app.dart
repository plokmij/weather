import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_repository/weather_repository.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({
    Key? key,
    required this.weatherRepository,
  }) : super(key: key);

  final WeatherRepository weatherRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => weatherRepository,
      child: const WeatherAppView(),
    );
  }
}

class WeatherAppView extends StatelessWidget {
  const WeatherAppView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(),
      // home: Scaffold(
      //   appBar: AppBar(
      //     title: const Text('Hello World'),
      //   ),
      //   body: FutureBuilder(
      //     future: weatherRepository.fetchWeather(
      //       City(
      //         name: 'Wandoor',
      //         latitude: 11.1897372,
      //         longitude: 76.2343544,
      //       ),
      //     ),
      //     builder: (context, snapshot) {
      //       if (snapshot.hasData) {
      //         final weather = snapshot.data!;
      //         return Column(
      //           children: [
      //             Text(weather.city),
      //             Text(weather.temperature.toStringAsFixed(2)),
      //             Text(weather.minTemperature.toStringAsFixed(2)),
      //             Text(weather.maxTemperature.toStringAsFixed(2)),
      //             Text(weather.humidity.toStringAsFixed(2)),
      //             Text(weather.windSpeed.toStringAsFixed(2)),
      //           ],
      //         );
      //       } else {
      //         return const Text('Hola Mundo');
      //       }
      //     },
      //   ),
      // ),
    );
  }
}
