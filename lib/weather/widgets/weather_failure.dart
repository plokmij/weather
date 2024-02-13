import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_repository/weather_repository.dart';

import '../cubit/weather_cubit.dart';

class WeatherFailure extends StatelessWidget {
  const WeatherFailure({
    super.key,
    required this.city,
  });

  final City city;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: const Color(0xffFF9999),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Center(
            child: Text(
              'Unable to get weather. Lets try that again.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          TextButton.icon(
            onPressed: () {
              context.read<WeatherCubit>().getWeather(city);
            },
            icon: const Icon(
              Icons.refresh,
              color: Colors.white,
            ),
            label: const Text(
              'Try again',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
