import 'package:dio/dio.dart' as d;
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:get/state_manager.dart';
import 'package:weather_app/api/weather_api_client.dart';
import 'package:weather_app/models/currentWeather.dart';

import 'locationController.dart';

class WeatherController extends GetxController {
  final LocationController locationController = Get.put(LocationController());

  d.Dio dio = d.Dio();

  var isInternetNetworkSuccess = true.obs;
  var isDataComplite = false.obs;
  var currentWeather = CurrentWeather().obs;

  var listTime = [].obs;
  var listWeather = [].obs;
  var listWeatherIcon = [].obs;
  var listTemp = [].obs;

  var listDailyDay = [].obs;
  var listDailyDate = [].obs;
  var listDailyWeatherIcon = [].obs;
  var listDailyTempMax = [].obs;
  var listDailyTempMin = [].obs;
  var listDailyWindSpeed = [].obs;

  var lastLoaction;

  bool streamCondition = true;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();

    lastLoaction = locationController.currentLocation.value;

    await get7DailyWeather(
        locationController.latitude.value, locationController.longitude.value);

    Stream.periodic(const Duration(seconds: 5))
        .takeWhile((_) => streamCondition)
        .forEach((e) async {
      if (!isInternetNetworkSuccess.value) {
        Get.snackbar(
            "Information", "Network Error, Check your internet connection");

        await get7DailyWeather(locationController.latitude.value,
            locationController.longitude.value);
      }

      if ((lastLoaction != locationController.currentLocation.value) &&
          isInternetNetworkSuccess.value) {
        print("# reget data");
        await get7DailyWeather(locationController.latitude.value,
            locationController.longitude.value);
        lastLoaction = locationController.currentLocation.value;
      }
    });
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    streamCondition = false;
  }

  Future<void> get7DailyWeather(double latitude, double longitude) async {
    print("# latitude => $latitude");
    print("# longitude => $longitude");
    try {
      d.Response response =
          await dio.get(Api.get7DaysWeather(latitude, longitude));
      if (response.statusCode == 200) {
        isInternetNetworkSuccess.value = true;

        if (locationController.isCurrentAddress.value) {
          // get current waeather
          CurrentWeather tempCurrentWeather =
              CurrentWeather.fromMap(response.data["current"]);
          currentWeather.value = tempCurrentWeather;

          // get hourly weather
          await Future.forEach(response.data["hourly"], (item) async {
            var date = DateFormat("H:mm")
                .format(DateTime.fromMillisecondsSinceEpoch(item["dt"] * 1000));
            listTime.add(date);
            listWeather.add(item["weather"][0]["main"]);
            listWeatherIcon.add(item["weather"][0]["icon"]);
            listTemp.add(item["temp"]);
          });

          // get daily Weather
          await Future.forEach(response.data["daily"], (item) async {
            var day = DateFormat("EEE")
                .format(DateTime.fromMillisecondsSinceEpoch(item["dt"] * 1000));
            var date = DateFormat("d/M")
                .format(DateTime.fromMillisecondsSinceEpoch(item["dt"] * 1000));
            listDailyDay.add(day);
            listDailyDate.add(date);
            listDailyWeatherIcon.add(item["weather"][0]["icon"]);
            listDailyTempMax.add(item["temp"]["max"]);
            listDailyTempMin.add(item["temp"]["min"]);
            listDailyWindSpeed.add(item["wind_speed"]);
          });

          //
          isDataComplite.value = true;
        }
      }
    } on d.DioError catch (ex) {
      _dioError(ex);
    }
  }

  //  network error detection
  _dioError(d.DioError ex) {
    if (ex.type == d.DioErrorType.response) {
      //error respon 400,500
      isInternetNetworkSuccess.value = false;
      print("error http respon 400,500");
    } else if (ex.type == d.DioErrorType.other) {
      //example wifi off
      isInternetNetworkSuccess.value = false;
      print("error http default");
    } else {
      //timeout dan cancel
      isInternetNetworkSuccess.value = false;
      print("error time out or cancel");
    }
  }
}
