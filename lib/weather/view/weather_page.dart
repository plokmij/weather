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
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          switch (state.weatherStatus) {
            case WeatherStatus.initial:
              return const SizedBox.shrink();
            case WeatherStatus.loading:
              return const WeatherLoading();
            case WeatherStatus.success:
              return const ColoredBox(
                color: Colors.black,
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
