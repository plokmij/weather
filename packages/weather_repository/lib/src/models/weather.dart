class Weather {
  final String city;
  final double temperature;
  final double humidity;
  final double windSpeed;
  final double minTemperature;
  final double maxTemperature;

  Weather({
    required this.city,
    required this.temperature,
    required this.humidity,
    required this.windSpeed,
    required this.minTemperature,
    required this.maxTemperature,
  });
}

enum WeatherCondition {
  thunderstorm,
  drizzle,
  rain,
  snow,
  atmosphere,
  clear,
  clouds,
}

extension UnitConversion on double {
  double get toCelsius => this - 273.15;
}
