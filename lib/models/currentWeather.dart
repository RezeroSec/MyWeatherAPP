// To parse this JSON data, do
//
//     final currentWeather = currentWeatherFromMap(jsonString);

import 'dart:convert';

CurrentWeather currentWeatherFromMap(String str) => CurrentWeather.fromMap(json.decode(str));

String currentWeatherToMap(CurrentWeather data) => json.encode(data.toMap());

class CurrentWeather {
    CurrentWeather({
        this.dt,
        this.sunrise,
        this.sunset,
        this.temp,
        this.feelsLike,
        this.pressure,
        this.humidity,
        this.dewPoint,
        this.uvi,
        this.clouds,
        this.visibility,
        this.windSpeed,
        this.windDeg,
        this.windGust,
        this.weather,
    });

    int dt;
    int sunrise;
    int sunset;
    double temp;
    double feelsLike;
    int pressure;
    int humidity;
    double dewPoint;
    double uvi;
    int clouds;
    int visibility;
    double windSpeed;
    int windDeg;
    double windGust;
    List<Weather> weather;

    factory CurrentWeather.fromMap(Map<String, dynamic> json) => CurrentWeather(
        dt: json["dt"] == null ? null : json["dt"],
        sunrise: json["sunrise"] == null ? null : json["sunrise"],
        sunset: json["sunset"] == null ? null : json["sunset"],
        temp: json["temp"] == null ? null : json["temp"].toDouble(),
        feelsLike: json["feels_like"] == null ? null : json["feels_like"].toDouble(),
        pressure: json["pressure"] == null ? null : json["pressure"],
        humidity: json["humidity"] == null ? null : json["humidity"],
        dewPoint: json["dew_point"] == null ? null : json["dew_point"].toDouble(),
        uvi: json["uvi"] == null ? null : json["uvi"].toDouble(),
        clouds: json["clouds"] == null ? null : json["clouds"],
        visibility: json["visibility"] == null ? null : json["visibility"],
        windSpeed: json["wind_speed"] == null ? null : json["wind_speed"].toDouble(),
        windDeg: json["wind_deg"] == null ? null : json["wind_deg"],
        windGust: json["wind_gust"] == null ? null : json["wind_gust"].toDouble(),
        weather: json["weather"] == null ? null : List<Weather>.from(json["weather"].map((x) => Weather.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "dt": dt == null ? null : dt,
        "sunrise": sunrise == null ? null : sunrise,
        "sunset": sunset == null ? null : sunset,
        "temp": temp == null ? null : temp,
        "feels_like": feelsLike == null ? null : feelsLike,
        "pressure": pressure == null ? null : pressure,
        "humidity": humidity == null ? null : humidity,
        "dew_point": dewPoint == null ? null : dewPoint,
        "uvi": uvi == null ? null : uvi,
        "clouds": clouds == null ? null : clouds,
        "visibility": visibility == null ? null : visibility,
        "wind_speed": windSpeed == null ? null : windSpeed,
        "wind_deg": windDeg == null ? null : windDeg,
        "wind_gust": windGust == null ? null : windGust,
        "weather": weather == null ? null : List<dynamic>.from(weather.map((x) => x.toMap())),
    };
}

class Weather {
    Weather({
        this.id,
        this.main,
        this.description,
        this.icon,
    });

    int id;
    String main;
    String description;
    String icon;

    factory Weather.fromMap(Map<String, dynamic> json) => Weather(
        id: json["id"] == null ? null : json["id"],
        main: json["main"] == null ? null : json["main"],
        description: json["description"] == null ? null : json["description"],
        icon: json["icon"] == null ? null : json["icon"],
    );

    Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "main": main == null ? null : main,
        "description": description == null ? null : description,
        "icon": icon == null ? null : icon,
    };
}
