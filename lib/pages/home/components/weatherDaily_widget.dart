import 'package:flutter/material.dart';

import 'detailWeatherDaily_widget.dart';

class WeatherDaily extends StatelessWidget {
  final int itemCount;
  final String day;
  final String weatherIcon;
  final String temp;
  final List<String> dataLoad;

  const WeatherDaily({
    Key key,
    this.itemCount,
    this.day,
    this.weatherIcon,
    this.temp,
    this.dataLoad,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.green,
      padding: EdgeInsets.all(5),
      // child: SingleChildScrollView(
      //   scrollDirection: Axis.horizontal,
      //   child: Row(
      //     children: [
      //       DetailWeatherDaily(),
      //       DetailWeatherDaily(),
      //       DetailWeatherDaily(),
      //       DetailWeatherDaily(),
      //       DetailWeatherDaily(),
      //       DetailWeatherDaily(),
      //       DetailWeatherDaily(),
      //       DetailWeatherDaily(),
      //       DetailWeatherDaily(),
      //     ],
      //   ),
      // ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return DetailWeatherDaily(
            weather: day,
            temp: temp,
            weatherIcon: weatherIcon,
          );
        },
      ),
    );
  }
}
