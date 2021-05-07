import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/utils/convertToWeatherIcons.dart';
import 'package:weather_app/utils/utilColors.dart';
import 'package:weather_icons/weather_icons.dart';

class ItemBarChart extends StatelessWidget {
  final String weatherIcon;
  final String time;
  final double bar;
  final double temp;

  const ItemBarChart({
    Key key,
    this.weatherIcon = "",
    this.time = "",
    this.bar = 0,
    this.temp = 0,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double barValue = 0;
    if (bar >= 50) {
      barValue = 50;
    } else {
      barValue = bar;
    }
    return Container(
      height: double.maxFinite,
      width: 65,
      padding: EdgeInsets.all(5),
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          BoxedIcon(
            WeatherIcons.fromString(ConvertToWeatherIcons().conv(weatherIcon),
                fallback: WeatherIcons.na),
            size: MediaQuery.of(context).size.width * 0.06,
            color: Colors.green,
          ),
          Container(
            margin: EdgeInsets.only(bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AutoSizeText(
                  "$temp",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Column(
                  children: [
                    AutoSizeText(
                      "o",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                        fontWeight: FontWeight.w400,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    AutoSizeText(
                      "",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 5,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                AutoSizeText(
                  "C",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Container(
            height: barValue,
            width: 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: Colors.green,
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 5),
              child: Text(
                time,
                style: TextStyle(color: Colors.white),
              )),
        ],
      ),
    );
  }
}
