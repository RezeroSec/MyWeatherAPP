import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/components/CustomButton.dart';
import 'package:weather_app/controllers/weatherController.dart';
import 'package:weather_app/utils/utilColors.dart';

import 'components/currentTemp_widget.dart';
import 'components/detailWeatherDaily_widget.dart';
import 'components/itemBarChart.dart';
import 'components/weatherDetails_widget.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final WeatherController weatherController = Get.put(WeatherController());
  List<bool> isBottomIconTap = [false, false];

  @override
  void initState() {
    super.initState();
    weatherController.get7DailyWeather(-5.117839, 105.307265);
    _onItemTapped(0);
  }

  void _onItemTapped(int index) {
    setState(() {
      isBottomIconTap = [false, false];
      isBottomIconTap[index] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: () {
              // Get.to(() => ManageCities());
            }),
        title: Text(DateFormat('EEEE, d MMM yyyy').format(DateTime.now()),
            style: TextStyle(
              color: UtilColors.thridColor,
              fontSize: 14,
            )),
        centerTitle: true,
        backgroundColor: UtilColors.primaryColor,
        elevation: 0,
      ),
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.all(10),
        color: UtilColors.primaryColor,
        child: Column(
          children: [
            Expanded(
              flex: 11,
              child: Column(
                children: [
                  Expanded(
                    flex: 12,
                    // child: Container(),
                    child: Obx(
                      () => CurrentTemp(
                        location:
                            "Metro", //weatherController.currentLocation.value,
                        weatherDesc: weatherController
                            .currentWeather.value.weather[0].description,
                        weatherIcon: weatherController
                            .currentWeather.value.weather[0].icon,
                        temp: weatherController.currentWeather.value.temp
                            .toString(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 0.05,
              color: UtilColors.secondColor,
            ),
            Container(
              height: 200,
              width: double.maxFinite,
              child: Column(
                children: [
                  Container(
                    height: 40,
                    width: double.maxFinite,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomButton(
                          height: 30,
                          width: 150,
                          bgColor:
                              isBottomIconTap[0] ? Colors.green : Colors.white,
                          borderColor: Colors.green,
                          widthBorder: 1,
                          child: Text(
                            "Hourly Weather Icon",
                            style: TextStyle(
                              color: isBottomIconTap[0]
                                  ? Colors.white
                                  : Colors.green,
                            ),
                          ),
                          onTap: () {
                            _onItemTapped(0);
                          },
                        ),
                        CustomButton(
                          height: 30,
                          width: 150,
                          bgColor:
                              isBottomIconTap[1] ? Colors.green : Colors.white,
                          borderColor: Colors.green,
                          widthBorder: 1,
                          child: Text(
                            "Hourly Weather Chart",
                            style: TextStyle(
                              color: isBottomIconTap[1]
                                  ? Colors.white
                                  : Colors.green,
                            ),
                          ),
                          onTap: () {
                            _onItemTapped(1);
                          },
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: AnimatedSwitcher(
                      child: isBottomIconTap[0]
                          ? Container(
                              key: UniqueKey(),
                              child: Obx(
                                () => ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount:
                                      weatherController.listWeather.length,
                                  itemBuilder: (context, index) {
                                    return DetailWeatherDaily(
                                      weather:
                                          weatherController.listWeather[index],
                                      temp: weatherController.listTemp[index]
                                          .toString(),
                                      weatherIcon: weatherController
                                          .listWeatherIcon[index],
                                      time: weatherController.listTime[index],
                                    );
                                  },
                                ),
                              ),
                            )
                          : isBottomIconTap[1]
                              ? Container(
                                  height: double.maxFinite,
                                  width: double.maxFinite,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xff2c4260),
                                  ),
                                  key: UniqueKey(),
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                        weatherController.listWeather.length,
                                    itemBuilder: (context, index) {
                                      return ItemBarChart(
                                        weatherIcon: weatherController
                                            .listWeatherIcon[index],
                                        time: weatherController.listTime[index],
                                        bar: weatherController.listTemp[index],
                                        temp: weatherController.listTemp[index],
                                      );
                                    },
                                  ),
                                )
                              : Container(),
                      duration: Duration(milliseconds: 500),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                child: Column(
                  children: [
                    Divider(
                      thickness: 0.05,
                      color: UtilColors.secondColor,
                    ),
                    Expanded(
                      child: Obx(
                        () => WeatherDetails(
                          windSpeed: weatherController
                              .currentWeather.value.windSpeed
                              .toString(),
                          realFeel: weatherController
                              .currentWeather.value.feelsLike
                              .toString(),
                          pressure: weatherController
                              .currentWeather.value.pressure
                              .toString(),
                          humidity: weatherController
                              .currentWeather.value.humidity
                              .toString(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
