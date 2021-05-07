import 'package:flutter/material.dart';

import 'detail_widget.dart';


class WeatherDetails extends StatelessWidget {
  final String windSpeed;
  final String realFeel;
  final String pressure;
  final String humidity;

  const WeatherDetails({
    Key key,
    this.windSpeed = "0",
    this.realFeel = "0",
    this.pressure = "0",
    this.humidity = "0",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Detail(
              title: "Wind speed",
              value: windSpeed,
              txtStdr: "m/s",
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: VerticalDivider(
              thickness: 0.1,
              color: Colors.black,
            ),
          ),
          Expanded(
            flex: 2,
            child: Detail(
              title: "Real feel",
              value: realFeel,
              deg: "o",
              txtStdr: "C",
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: VerticalDivider(
              thickness: 0.1,
              color: Colors.black,
            ),
          ),
          Expanded(
            flex: 2,
            child: Detail(
              title: "Pressure",
              value: pressure,
              txtStdr: "hPa",
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: VerticalDivider(
              thickness: 0.1,
              color: Colors.black,
            ),
          ),
          Expanded(
            flex: 2,
            child: Detail(
              title: "Humidity",
              value: humidity,
              txtStdr: "%",
            ),
          ),
        ],
      ),
    );
  }
}
