import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/components/CustomButton.dart';
import 'package:weather_app/controllers/locationController.dart';
import 'package:weather_app/controllers/weatherController.dart';
import 'package:weather_app/utils/utilColors.dart';

import 'components/barChart.dart';
import 'components/currentTemp_widget.dart';
import 'components/detailWeatherDaily_widget.dart';
import 'components/weatherDetails_widget.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final WeatherController weatherController = Get.put(WeatherController());
  final LocationController locationController = Get.put(LocationController());

  List<bool> isBottomIconTap = [false, false];

  double h = Get.height;
  double w = Get.width;

  @override
  void initState() {
    super.initState();
    locationController.checkPermission();
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
            width: double.maxFinite,
            height: double.maxFinite,
            padding: EdgeInsets.all(10),
            color: UtilColors.primaryColor,
            child: Stack(
              children: [
                Column(
                  children: [
                    Obx(
                      () => Container(
                        height: h * 0.35,
                        width: double.maxFinite,
                        child: CurrentTemp(
                          location: locationController.currentLocation.value,
                          weatherDesc: weatherController.isDataComplite.value
                              ? weatherController
                                  .currentWeather.value.weather[0].description
                              : "null",
                          weatherIcon: weatherController.isDataComplite.value
                              ? weatherController
                                  .currentWeather.value.weather[0].icon
                              : "null",
                          temp: weatherController.isDataComplite.value
                              ? weatherController.currentWeather.value.temp
                                  .toString()
                              : "-",
                        ),
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
                                  bgColor: isBottomIconTap[0]
                                      ? Colors.green
                                      : Colors.white,
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
                                  bgColor: isBottomIconTap[1]
                                      ? Colors.green
                                      : Colors.white,
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
                                          itemCount: weatherController
                                              .listWeather.length,
                                          itemBuilder: (context, index) {
                                            return DetailWeatherDaily(
                                              weather: weatherController
                                                  .listWeather[index],
                                              temp: weatherController
                                                  .listTemp[index]
                                                  .toString(),
                                              weatherIcon: weatherController
                                                  .listWeatherIcon[index],
                                              time: weatherController
                                                  .listTime[index],
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
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Color(0xff2c4260),
                                          ),
                                          key: UniqueKey(),
                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: 48,
                                            itemBuilder: (context, index) {
                                              return BarChart(
                                                weatherIcon: weatherController
                                                    .listWeatherIcon[index]
                                                    .toString(),
                                                time: weatherController
                                                    .listTime[index]
                                                    .toString(),
                                                bar: weatherController
                                                    .listTemp[index],
                                                temp: weatherController
                                                    .listTemp[index],
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
                Obx(
                  () => weatherController.isDataComplite.value
                      ? Container()
                      : SpinKitChasingDots(
                          color: Colors.black38, size: h * 0.1),
                ),
              ],
            )),
      ),
    );
  }
}
