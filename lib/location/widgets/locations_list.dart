import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/location/cubit/location_cubit.dart';
import 'package:weather_repository/weather_repository.dart';

class LocationList extends StatelessWidget {
  const LocationList({
    Key? key,
    required this.locations,
  }) : super(key: key);

  final List<City> locations;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: locations.length,
      itemBuilder: (context, index) {
        final location = locations[index];
        return ListTile(
          onTap: () {
            context.read<LocationCubit>().selectLocation(location);
          },
          title: Text(location.name),
          trailing: const Icon(Icons.arrow_forward_ios),
        );
      },
    );
  }
}
