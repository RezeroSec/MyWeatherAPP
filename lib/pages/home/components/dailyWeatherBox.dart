import 'package:flutter/material.dart';
import 'package:weather_app/utils/convertToWeatherIcons.dart';
import 'package:weather_icons/weather_icons.dart';

class DailyWeatherBox extends StatelessWidget {
  final String day;
  final String date;
  final double windSpeed;
  final String weatherIcon;
  final double tempMax;
  final double tempMin;

  const DailyWeatherBox({
    Key key,
    this.day = "",
    this.date = "",
    this.windSpeed,
    this.weatherIcon = "",
    this.tempMax,
    this.tempMin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    // double w = MediaQuery.of(context).size.width;
    return Container(
      height: double.maxFinite,
      width: 80,
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: double.maxFinite,
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(width: 0.1, color: Color(0xff5E6B7F)),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    day,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: h * 0.005),
                  Text(
                    date,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[400],
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              flex: 4,
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 0.1, color: Color(0xff5E6B7F)),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BoxedIcon(
                      WeatherIcons.fromString(
                          ConvertToWeatherIcons().conv(weatherIcon),
                          fallback: WeatherIcons.na),
                      size: MediaQuery.of(context).size.width * 0.046,
                      color: Colors.green,
                    ),
                    Text(
                      "$tempMax",
                      style: TextStyle(
                        fontSize: 10,
                        // color: Colors.grey[400],
                      ),
                    ),
                    Container(
                      height: h * 0.06,
                      width: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.red,
                            Colors.blue,
                          ],
                        ),
                      ),
                    ),
                    Text(
                      "$tempMin",
                      style: TextStyle(
                        fontSize: 10,
                        // color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              )),
          Expanded(
            flex: 2,
            child: Container(
              width: double.maxFinite,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Wind Speed",
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  SizedBox(height: h * 0.005),
                  Text(
                    "$windSpeed m/s",
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey[400],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
