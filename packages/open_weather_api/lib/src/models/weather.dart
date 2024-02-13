class Weather {
  final double lat;
  final double lon;
  final String timezone;
  final int timezoneOffset;
  final CurrentWeather current;
  final List<HourlyWeather> hourly;
  final List<DailyWeather> daily;
  final List<WeatherAlert> alerts;

  Weather({
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.timezoneOffset,
    required this.current,
    required this.hourly,
    required this.daily,
    required this.alerts,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      lat: json['lat'],
      lon: json['lon'],
      timezone: json['timezone'],
      timezoneOffset: json['timezone_offset'],
      current: CurrentWeather.fromJson(json['current']),
      hourly: (json['hourly'] as List)
          .map((item) => HourlyWeather.fromJson(item))
          .toList(),
      daily: (json['daily'] as List)
          .map((item) => DailyWeather.fromJson(item))
          .toList(),
      alerts: ((json['alerts'] ?? []) as List)
          .map((item) => WeatherAlert.fromJson(item))
          .toList(),
    );
  }
}

class CurrentWeather {
  final int dt;
  final int sunrise;
  final int sunset;
  final double temp;
  final double feelsLike;
  final int pressure;
  final int humidity;
  final double dewPoint;
  final double uvi;
  final int clouds;
  final int visibility;
  final double windSpeed;
  final int windDeg;
  final double windGust;
  final List<WeatherDescription> weather;

  CurrentWeather({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.uvi,
    required this.clouds,
    required this.visibility,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.weather,
  });

  factory CurrentWeather.fromJson(Map<String, dynamic> json) {
    return CurrentWeather(
      dt: json['dt'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
      temp: json['temp'],
      feelsLike: json['feels_like'],
      pressure: json['pressure'],
      humidity: json['humidity'],
      dewPoint: toDouble(json['dew_point']),
      uvi: toDouble(json['uvi']),
      clouds: json['clouds'],
      visibility: json['visibility'],
      windSpeed: json['wind_speed'],
      windDeg: json['wind_deg'],
      windGust: json['wind_gust'],
      weather: (json['weather'] as List)
          .map((item) => WeatherDescription.fromJson(item))
          .toList(),
    );
  }
}

class HourlyWeather {
  final int dt;
  final double temp;
  final double feelsLike;
  final int pressure;
  final int humidity;
  final double dewPoint;
  final double uvi;
  final int clouds;
  final int visibility;
  final double windSpeed;
  final int windDeg;
  final double windGust;
  final double pop;
  final List<WeatherDescription> weather;

  HourlyWeather({
    required this.dt,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.uvi,
    required this.clouds,
    required this.visibility,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.pop,
    required this.weather,
  });

  factory HourlyWeather.fromJson(Map<String, dynamic> json) {
    return HourlyWeather(
      dt: json['dt'],
      temp: toDouble(json['temp']),
      feelsLike: json['feels_like'],
      pressure: json['pressure'],
      humidity: json['humidity'],
      dewPoint: json['dew_point'],
      uvi: toDouble(json['uvi']),
      clouds: json['clouds'],
      visibility: json['visibility'],
      windSpeed: toDouble(json['wind_speed']),
      windDeg: json['wind_deg'],
      windGust: json['wind_gust'],
      pop: (json['pop'] as int).toDouble(),
      weather: (json['weather'] as List)
          .map((item) => WeatherDescription.fromJson(item))
          .toList(),
    );
  }
}

class DailyWeather {
  final int dt;
  final int sunrise;
  final int sunset;
  final int moonrise;
  final int moonset;
  final double moonPhase;
  final String summary;
  final WeatherTemperature temp;
  final WeatherTemperature feelsLike;
  final int pressure;
  final int humidity;
  final double dewPoint;
  final double windSpeed;
  final int windDeg;
  final double windGust;
  final List<WeatherDescription> weather;
  final int clouds;
  final double pop;
  final double rain;
  final double uvi;

  DailyWeather({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.summary,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.weather,
    required this.clouds,
    required this.pop,
    required this.rain,
    required this.uvi,
  });

  factory DailyWeather.fromJson(Map<String, dynamic> json) {
    return DailyWeather(
      dt: json['dt'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
      moonrise: json['moonrise'],
      moonset: json['moonset'],
      moonPhase: json['moon_phase'],
      summary: json['summary'],
      temp: WeatherTemperature.fromJson(json['temp']),
      feelsLike: WeatherTemperature.fromJson(json['feels_like']),
      pressure: json['pressure'],
      humidity: json['humidity'],
      dewPoint: json['dew_point'],
      windSpeed: json['wind_speed'],
      windDeg: json['wind_deg'],
      windGust: json['wind_gust'],
      weather: (json['weather'] as List)
          .map((item) => WeatherDescription.fromJson(item))
          .toList(),
      clouds: json['clouds'],
      pop: toDouble(json['pop']),
      rain: json['rain'] ?? 0.0,
      uvi: toDouble(json['uvi'] ?? 0.0),
    );
  }
}

class WeatherTemperature {
  final double day;
  final double min;
  final double max;
  final double night;
  final double eve;
  final double morn;

  WeatherTemperature({
    required this.day,
    required this.min,
    required this.max,
    required this.night,
    required this.eve,
    required this.morn,
  });

  factory WeatherTemperature.fromJson(Map<String, dynamic> json) {
    return WeatherTemperature(
      day: json['day'],
      min: toDouble(json['min'] ?? 0),
      max: toDouble(json['max'] ?? 0),
      night: json['night'],
      eve: json['eve'],
      morn: toDouble(json['morn'] ?? 0),
    );
  }
}

class WeatherDescription {
  final int id;
  final String main;
  final String description;
  final String icon;

  WeatherDescription({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory WeatherDescription.fromJson(Map<String, dynamic> json) {
    return WeatherDescription(
      id: json['id'],
      main: json['main'],
      description: json['description'],
      icon: json['icon'],
    );
  }
}

class WeatherAlert {
  final String senderName;
  final String event;
  final int start;
  final int end;
  final String description;

  WeatherAlert({
    required this.senderName,
    required this.event,
    required this.start,
    required this.end,
    required this.description,
  });

  factory WeatherAlert.fromJson(Map<String, dynamic> json) {
    return WeatherAlert(
      senderName: json['sender_name'],
      event: json['event'],
      start: json['start'],
      end: json['end'],
      description: json['description'],
    );
  }
}

double toDouble(num input) {
  return input.toDouble();
}
