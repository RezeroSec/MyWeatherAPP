import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/utils/utilColors.dart';
import 'package:weather_app/utils/utilString.dart';

import 'slideDots_widget.dart';
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
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  void initState() {
    super.initState();
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
      Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Text("ini berpindah"),
      ),
    ];
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: AutoSizeText(
            widget.location,
            style: TextStyle(
              color: UtilColors.secondColor,
              fontWeight: FontWeight.bold,
            ),
            presetFontSizes: [UtilString.fontSizeLocation, 33, 31, 29, 27, 25],
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Expanded(
          flex: 2,
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
        // Expanded(
        //   flex: 1,
        //   child: Container(),
        // ),
        Expanded(
          flex: 18,
          child: PageView(
            scrollDirection: Axis.horizontal,
            controller: _pageController,
            children: ViewWidget,
            onPageChanged: (index) => _onPageChanged(index),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(widget.slideName),
                for (int i = 0; i < ViewWidget.length; i++)
                  if (i == _currentPage) SlideDots(true) else SlideDots(false)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
//TempWidgetIcon()
