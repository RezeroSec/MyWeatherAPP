import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/utils/convertToWeatherIcons.dart';
import 'package:weather_app/utils/utilColors.dart';
import 'package:weather_app/utils/utilString.dart';
import 'package:weather_icons/weather_icons.dart';

class ListTileManageCity extends StatelessWidget {
  final String title;
  final String subTitle;
  final String humidity;
  final String windSpeed;
  final String temp;
  final String weatherIcon;
  final bool isLocated;

  const ListTileManageCity({
    Key key,
    this.title = "",
    this.subTitle = "",
    this.humidity = "",
    this.windSpeed = "",
    this.temp = "",
    this.weatherIcon = "01d",
    this.isLocated = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: UtilColors.secondColor, width: 0.05)),
      child: GestureDetector(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 6,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            AutoSizeText(
                              title,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: UtilColors.colorTitleCity,
                              ),
                              presetFontSizes: [
                                UtilString.fontSizeTitleManageCity,
                                16,
                                14,
                                12,
                                10,
                                8
                              ],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            (isLocated)
                                ? Icon(
                                    Icons.location_on,
                                    color: Colors.blue,
                                  )
                                : Container(),
                          ],
                        ),
                        SizedBox(height: 5),
                        Container(
                          width: double.maxFinite,
                          child: AutoSizeText(
                            subTitle,
                            style: TextStyle(
                              color: UtilColors.colorSubTitleCity,
                              fontWeight: FontWeight.w300,
                            ),
                            presetFontSizes: [
                              UtilString.fontSizeSubTitleManageCity,
                              14,
                              12,
                              10,
                              8
                            ],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      BoxedIcon(
                        WeatherIcons.fromString(
                            ConvertToWeatherIcons().conv(weatherIcon),
                            fallback: WeatherIcons.na),
                        color: Colors.green,
                        size: MediaQuery.of(context).size.height * 0.03,
                      ),
                      SizedBox(width: 10),
                      AutoSizeText(
                        temp,
                        style: TextStyle(
                          color: UtilColors.colorTempCity,
                          fontSize: 20,
                        ),
                        // presetFontSizes: [
                        //   Utils.fontSizeTempManageCity,
                        //   46,
                        //   44,
                        //   40,
                        //   36
                        // ],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Column(
                        children: [
                          Text(
                            "o",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              color: UtilColors.colorTempCity,
                            ),
                          ),
                          Text(""),
                          Text(""),
                        ],
                      ),
                      AutoSizeText(
                        "C",
                        style: TextStyle(color: UtilColors.colorTempCity),
                        presetFontSizes: [
                          UtilString.fontSizeTempManageCity,
                          46,
                          44,
                          40,
                          36
                        ],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(
              thickness: 0.05,
              color: UtilColors.secondColor,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 5,
                    child: AutoSizeText(
                      "Humidity $humidity% | Wind Speed $windSpeed m/s ",
                      style: TextStyle(
                        color: UtilColors.colorSubTitleCity,
                        fontWeight: FontWeight.w300,
                      ),
                      presetFontSizes: [
                        UtilString.fontSizeDetailManageCity,
                        14,
                        12,
                        10,
                        8
                      ],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // AutoSizeText(
                          //   "28 / 19 ",
                          //   style: TextStyle(
                          //     color: Utils.colorSubTitleCity,
                          //     fontWeight: FontWeight.w300,
                          //   ),
                          //   presetFontSizes: [14, 12, 10, 8],
                          //   maxLines: 1,
                          //   overflow: TextOverflow.ellipsis,
                          // ),
                          // Column(
                          //   children: [
                          //     Text(
                          //       "o",
                          //       style: TextStyle(
                          //         fontWeight: FontWeight.w300,
                          //         fontSize: 10,
                          //         color: Utils.colorSubTitleCity,
                          //       ),
                          //     ),
                          //     Text(
                          //       "",
                          //       style: TextStyle(
                          //         fontWeight: FontWeight.w300,
                          //         fontSize: 10,
                          //         color: Utils.colorSubTitleCity,
                          //       ),
                          //     ),
                          //     // Text(""),
                          //   ],
                          // ),
                          // AutoSizeText(
                          //   "C",
                          //   style: TextStyle(
                          //     color: Utils.colorSubTitleCity,
                          //     fontWeight: FontWeight.w300,
                          //   ),
                          //   presetFontSizes: [
                          //     Utils.fontSizeDetailTempManageCity,
                          //     14,
                          //     12,
                          //     10,
                          //     8
                          //   ],
                          //   maxLines: 1,
                          //   overflow: TextOverflow.ellipsis,
                          // ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        onTap: () {
          print("ditekan");
        },
      ),
    );
  }
}
