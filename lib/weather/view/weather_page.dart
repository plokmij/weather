import 'package:cached_network_image/cached_network_image.dart';
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
              return Padding(
                padding:
                    MediaQuery.of(context).orientation == Orientation.landscape
                        ? EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width * 0.2)
                        : const EdgeInsets.all(0),
                child: Container(
                  width: double.infinity,
                  color: const Color(0xffBEC9CD),
                  child: Padding(
                    padding: MediaQuery.of(context).orientation ==
                            Orientation.landscape
                        ? const EdgeInsets.all(8.0)
                        : const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '${state.weather.temperature.toStringAsFixed(0)}°',
                              style: const TextStyle(
                                fontSize: 60,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            CachedNetworkImage(
                                imageUrl:
                                    'https://openweathermap.org/img/wn/${state.weather.weatherDescription.icon}.png'),
                            const Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  state.weather.weatherDescription.main,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  'Humidity: ${state.weather.humidity.toStringAsFixed(0)}%',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                Text(
                                  'Wind: ${state.weather.windSpeed.toStringAsFixed(0)}km/h',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Text(
                          'High: ${state.weather.minTemperature.toStringAsFixed(0)}° '
                          'Low: ${state.weather.maxTemperature.toStringAsFixed(0)}°',
                          style: const TextStyle(
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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
