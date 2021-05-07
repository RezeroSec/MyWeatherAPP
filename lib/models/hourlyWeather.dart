// To parse this JSON data, do
//
//     final hourlyWeather = hourlyWeatherFromMap(jsonString);

import 'dart:convert';

HourlyWeather hourlyWeatherFromMap(String str) =>
    HourlyWeather.fromMap(json.decode(str));

String hourlyWeatherToMap(HourlyWeather data) => json.encode(data.toMap());

class HourlyWeather {
  HourlyWeather({
    this.main,
    this.icon,
    this.temp,
    this.time,
  });

  String main;
  String icon;
  double temp;
  String time;

  factory HourlyWeather.fromMap(Map<String, dynamic> json) => HourlyWeather(
        main: json["main"] == null ? null : json["main"],
        icon: json["icon"] == null ? null : json["icon"],
        temp: json["temp"] == null ? null : json["temp"].toDouble(),
        time: json["time"] == null ? null : json["time"],
      );

  Map<String, dynamic> toMap() => {
        "main": main == null ? null : main,
        "icon": icon == null ? null : icon,
        "temp": temp == null ? null : temp,
        "time": time == null ? null : time,
      };
}
