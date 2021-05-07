import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controllers/weatherController.dart';

import 'dailyWeatherBox.dart';

class DailyWeatherView extends StatelessWidget {
  final WeatherController weatherController = Get.put(WeatherController());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      child: Obx(
        () => ListView.builder(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          itemCount: weatherController.listDailyDay.length,
          itemBuilder: (context, index) {
            return DailyWeatherBox(
              day: weatherController.listDailyDay[index],
              date: weatherController.listDailyDate[index],
              weatherIcon: weatherController.listDailyWeatherIcon[index],
              windSpeed: weatherController.listDailyWindSpeed[index],
              tempMax: weatherController.listDailyTempMax[index],
              tempMin: weatherController.listDailyTempMin[index],
            );
          },
        ),
      ),
    );
  }
}
