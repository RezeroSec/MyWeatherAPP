import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/utils/convertToWeatherIcons.dart';
import 'package:weather_app/utils/utilColors.dart';
import 'package:weather_icons/weather_icons.dart';

class TempWidgetIcon extends StatelessWidget {
  final String weatherIcon;
  final String temp;

  const TempWidgetIcon({
    Key key,
    this.weatherIcon = "01d",
    this.temp = "0",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.width * 0.2,
            width: MediaQuery.of(context).size.width * 0.2,
            alignment: Alignment.center,
            child: BoxedIcon(
              WeatherIcons.fromString(ConvertToWeatherIcons().conv(weatherIcon),
                  fallback: WeatherIcons.na),
              size: MediaQuery.of(context).size.width * 0.14,
              color: Colors.green,
            ),
          ),
          Expanded(
            child: Container(
              height: double.maxFinite,
              width: double.maxFinite,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AutoSizeText(
                    temp,
                    style: TextStyle(
                      color: UtilColors.secondColor,
                      fontWeight: FontWeight.w400,
                    ),
                    presetFontSizes: [62, 59, 57, 55],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                    AutoSizeText(
                      "o",
                      style: TextStyle(
                        color: UtilColors.secondColor,
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ]),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
