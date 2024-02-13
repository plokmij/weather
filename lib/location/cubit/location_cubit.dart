import 'package:bloc/bloc.dart';
import 'package:weather_repository/weather_repository.dart';

//City? is selected as State of Cubit
// if state is null it means location has not been selected
class LocationCubit extends Cubit<City?> {
  LocationCubit() : super(null);

  void selectLocation(City city) => emit(city);
}
