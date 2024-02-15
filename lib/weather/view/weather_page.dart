import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_repository/weather_repository.dart';

import '../cubit/weather_cubit.dart';
import '../widgets/weather_failure.dart';
import '../widgets/weather_loading.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key, required this.city}) : super(key: key);

  final City city;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(
        weatherRepository: context.read<WeatherRepository>(),
      )..getWeather(city),
      child: WeatherView(
        city: city,
      ),
    );
  }
}

class WeatherView extends StatelessWidget {
  const WeatherView({Key? key, required this.city}) : super(key: key);

  final City city;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(city.name),
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          switch (state.weatherStatus) {
            case WeatherStatus.initial:
              return const SizedBox.shrink();
            case WeatherStatus.loading:
              return const WeatherLoading();
            case WeatherStatus.success:
              return Column(
                children: [
                  Text(
                    '${state.weather.temperature.toStringAsFixed(0)}°',
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(state.weather.weatherDescription.main),
                  Text('${state.weather.minTemperature.toStringAsFixed(0)}°'),
                  Text('${state.weather.maxTemperature.toStringAsFixed(0)}°'),
                  Text('${state.weather.humidity.toStringAsFixed(0)}%'),
                  Text('${state.weather.windSpeed.toStringAsFixed(0)}km/h'),
                ],
              );
            case WeatherStatus.failure:
              return WeatherFailure(
                city: city,
              );
            default:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
