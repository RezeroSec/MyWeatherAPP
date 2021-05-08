import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/components/CustomButton.dart';
import 'package:weather_app/utils/utilColors.dart';
import 'package:weather_app/utils/utilString.dart';

import 'dailyWeatherView.dart';
import 'tempWidgetIcon_widget.dart';

class CurrentTemp extends StatefulWidget {
  final String location;
  final String weatherDesc;
  final String weatherIcon;
  final String temp;
  final String slideName;

  const CurrentTemp({
    Key key,
    this.location = "none",
    this.weatherDesc = "none",
    this.weatherIcon,
    this.temp = "0",
    this.slideName = "",
  }) : super(key: key);

  @override
  _CurrentTempState createState() => _CurrentTempState();
}

class _CurrentTempState extends State<CurrentTemp> {
  final PageController _pageController = PageController(initialPage: 0);
  List<bool> isBottomIconTap = [false, false];

  void _onItemTapped(int index) {
    setState(() {
      isBottomIconTap = [false, false];
      isBottomIconTap[index] = true;
      _pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.easeOut);
    });
  }

  @override
  void initState() {
    super.initState();
    isBottomIconTap[0] = true;
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> ViewWidget = [
      TempWidgetIcon(
        weatherIcon: widget.weatherIcon,
        temp: widget.temp,
      ),
      DailyWeatherView(),
    ];
    return Column(
      children: [
        Container(
          height: 40,
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 10),
          alignment: Alignment.center,
          child: AutoSizeText(
            widget.location,
            style: TextStyle(
              color: UtilColors.secondColor,
              fontWeight: FontWeight.bold,
            ),
            presetFontSizes: [
              UtilString.fontSizeLocation,
              25,
              24,
              23,
              22,
              21,
              20,
              19,
              18,
              17,
              16,
              15
            ],
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Container(
          height: 20,
          child: AutoSizeText(
            widget.weatherDesc,
            style: TextStyle(
              color: UtilColors.secondColor,
            ),
            presetFontSizes: [
              UtilString.fontSizeWeatherDesc,
              18,
              16,
              14,
              12,
              10
            ],
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Expanded(
          child: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: _pageController,
            children: ViewWidget,
          ),
        ),
        Container(
          height: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomButton(
                height: 30,
                width: 60,
                bgColor: isBottomIconTap[0] ? Colors.green : Colors.white,
                borderColor: Colors.green,
                widthBorder: 1,
                child: Text(
                  "current",
                  style: TextStyle(
                    fontSize: 11,
                    color: isBottomIconTap[0] ? Colors.white : Colors.green,
                  ),
                ),
                onTap: () {
                  _onItemTapped(0);
                },
              ),
              SizedBox(width: 10),
              CustomButton(
                height: 30,
                width: 60,
                bgColor: isBottomIconTap[1] ? Colors.green : Colors.white,
                borderColor: Colors.green,
                widthBorder: 1,
                child: Text(
                  "daily",
                  style: TextStyle(
                    fontSize: 11,
                    color: isBottomIconTap[1] ? Colors.white : Colors.green,
                  ),
                ),
                onTap: () {
                  _onItemTapped(1);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
//TempWidgetIcon()
