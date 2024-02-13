import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/weather/view/weather_page.dart';
import 'package:weather_repository/weather_repository.dart';

import '../cubit/location_cubit.dart';
import '../widgets/locations_list.dart';

List<City> cities = const [
  City(name: 'Mumbai', latitude: 19.0760, longitude: 72.8777),
  City(name: 'Delhi', latitude: 28.7041, longitude: 77.1025),
  City(name: 'Bangalore', latitude: 12.9716, longitude: 77.5946),
  City(name: 'Kolkata', latitude: 22.5726, longitude: 88.3639),
  City(name: 'Chennai', latitude: 13.0827, longitude: 80.2707),
  City(name: 'Hyderabad', latitude: 17.3850, longitude: 78.4867),
  City(name: 'Ahmedabad', latitude: 23.0225, longitude: 72.5714),
  City(name: 'Pune', latitude: 18.5204, longitude: 73.8567),
  City(name: 'Jaipur', latitude: 26.9124, longitude: 75.7873),
  City(name: 'Lucknow', latitude: 26.8467, longitude: 80.9462),
  City(name: 'Mangalore', latitude: 12.9141, longitude: 74.8560),
  City(name: 'Patna', latitude: 25.5941, longitude: 85.1376),
  City(name: 'Bhubaneswar', latitude: 20.2961, longitude: 85.8245),
  City(name: 'Thiruvananthapuram', latitude: 8.5241, longitude: 76.9366),
  City(name: 'Dispur', latitude: 26.1406, longitude: 91.7900),
  City(name: 'Gandhinagar', latitude: 23.2156, longitude: 72.6369),
  City(name: 'Coimbatore', latitude: 11.0168, longitude: 76.9558),
  City(name: 'Visakhapatnam', latitude: 17.6868, longitude: 83.2185),
  City(name: 'Nagpur', latitude: 21.1458, longitude: 79.0882),
  City(name: 'Kanpur', latitude: 26.4499, longitude: 80.3319),
  City(name: 'Madurai', latitude: 9.9252, longitude: 78.1198),
  City(name: 'Wandoor', latitude: 11.1667, longitude: 76.2333),
];

class LocationSelectionView extends StatelessWidget {
  const LocationSelectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocationCubit(),
      child: const LocationSelectionPage(),
    );
  }
}

class LocationSelectionPage extends StatelessWidget {
  const LocationSelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LocationCubit, City?>(
      listener: (context, state) {
        //If a city is selected then navigate to weather display screen
        if (state != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WeatherPage(
                city: state,
              ),
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Select Location'),
        ),
        body: LocationList(locations: cities),
      ),
    );
  }
}
