import 'package:flutter/material.dart';
import 'package:weather_repository/weather_repository.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({
    Key? key,
    required this.weatherRepository,
  }) : super(key: key);

  final WeatherRepository weatherRepository;

  @override
  Widget build(BuildContext context) {
    weatherRepository.fetchWeather(
      City(
        name: 'Wandoor',
        latitude: 11.1897372,
        longitude: 76.2343544,
      ),
    )..then((value) {
        print(value);
      });
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hello World'),
        ),
        body: FutureBuilder(
          future: weatherRepository.fetchWeather(
            City(
              name: 'Wandoor',
              latitude: 11.1897372,
              longitude: 76.2343544,
            ),
          ),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text((snapshot.data?.city ?? '')+'\n'+ (snapshot.data?.temperature.toString()??''));
            } else {
              return const Text('Hola Mundo');
            }
          },
        ),
      ),
    );
  }
}
