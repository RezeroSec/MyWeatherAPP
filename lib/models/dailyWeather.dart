// To parse this JSON data, do
//
//     final dailyWeather = dailyWeatherFromMap(jsonString);

import 'dart:convert';

DailyWeather dailyWeatherFromMap(String str) => DailyWeather.fromMap(json.decode(str));

String dailyWeatherToMap(DailyWeather data) => json.encode(data.toMap());

class DailyWeather {
    DailyWeather({
        this.day,
        this.date,
        this.weatherIcon,
        this.tempMin,
        this.tempMax,
        this.windSpeed,
    });

    String day;
    String date;
    String weatherIcon;
    String tempMin;
    double tempMax;
    String windSpeed;

    factory DailyWeather.fromMap(Map<String, dynamic> json) => DailyWeather(
        day: json["day"] == null ? null : json["day"],
        date: json["date"] == null ? null : json["date"],
        weatherIcon: json["weatherIcon"] == null ? null : json["weatherIcon"],
        tempMin: json["tempMin"] == null ? null : json["tempMin"],
        tempMax: json["tempMax"] == null ? null : json["tempMax"].toDouble(),
        windSpeed: json["windSpeed"] == null ? null : json["windSpeed"],
    );

    Map<String, dynamic> toMap() => {
        "day": day == null ? null : day,
        "date": date == null ? null : date,
        "weatherIcon": weatherIcon == null ? null : weatherIcon,
        "tempMin": tempMin == null ? null : tempMin,
        "tempMax": tempMax == null ? null : tempMax,
        "windSpeed": windSpeed == null ? null : windSpeed,
    };
}
