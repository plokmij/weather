import 'package:flutter/material.dart';
import 'package:weather_repository/weather_repository.dart';

class LocationDropDown extends StatelessWidget {
  const LocationDropDown({Key? key, required this.locations}) : super(key: key);

  final List<City> locations;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownMenu<City>(
        width: MediaQuery.of(context).size.width * .6 > 300
            ? 100
            : MediaQuery.of(context).size.width * .6,
        onSelected: (val) {},
        label: const Text('Select'),
        dropdownMenuEntries: [
          for (final city in locations)
            DropdownMenuEntry(
              value: city,
              label: city.name,
            ),
        ],
      ),
    );
  }
}
