import 'package:dio/dio.dart';
import 'package:weather_app/api/api_keys.dart';

class Api {
  static const baseUrl = 'http://api.openweathermap.org';
  static String get7DaysWeather(double lat, double lon) {
    return "$baseUrl/data/2.5/onecall?lat=$lat&lon=$lon&exclude=minutely,alerts&appid=${ApiKey.OPEN_WEATHER_MAP}&units=metric";
  }
}
