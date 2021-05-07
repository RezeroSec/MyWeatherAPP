import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/utils/convertToWeatherIcons.dart';
import 'package:weather_app/utils/utilColors.dart';
import 'package:weather_icons/weather_icons.dart';

class DetailWeatherDaily extends StatelessWidget {
  final String weather;
  final String weatherIcon;
  final String temp;
  final String time;

  const DetailWeatherDaily({
    Key key,
    this.weather = "",
    this.weatherIcon = "",
    this.temp = "",
    this.time = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AutoSizeText(
            weather,
            style: TextStyle(
              color: UtilColors.secondColor,
              // fontSize: MediaQuery.of(context).size.height * 0.01,
              // fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          BoxedIcon(
            WeatherIcons.fromString(ConvertToWeatherIcons().conv(weatherIcon),
                fallback: WeatherIcons.na),
            color: Colors.green,
            size: MediaQuery.of(context).size.width * 0.06,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AutoSizeText(
                temp,
                style: TextStyle(
                  color: UtilColors.secondColor,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Column(
                children: [
                  AutoSizeText(
                    "o",
                    style: TextStyle(
                      color: UtilColors.secondColor,
                      fontSize: 8,
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  AutoSizeText(
                    "",
                    style: TextStyle(
                      color: UtilColors.secondColor,
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
                  color: UtilColors.secondColor,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          Container(
            height: 20,
            width: double.maxFinite,
            alignment: Alignment.center,
            child: Text(
              time,
              style: TextStyle(
                color: UtilColors.secondColor,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
