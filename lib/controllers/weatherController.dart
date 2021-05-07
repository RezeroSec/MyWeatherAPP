import 'package:dio/dio.dart' as d;
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/api/weather_api_client.dart';
import 'package:weather_app/models/currentWeather.dart';
import 'package:weather_app/models/hourlyWeather.dart';

class WeatherController extends GetxController {
  d.Dio dio = d.Dio();

  var isInternetNetworkSuccess = true.obs;
  var currentWeather = CurrentWeather().obs;
  var listHourlyWeather = <HourlyWeather>[].obs;
  var listTime = [].obs;
  var listWeather = [].obs;
  var listWeatherIcon = [].obs;
  var listTemp = [].obs;

  double longitude = 105.307265;
  double latitude = -5.117839;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();

    // await get7DailyWeather(latitude, longitude);

    // Stream.periodic(const Duration(seconds: 5))
    //     .takeWhile((_) => streamCondition)
    //     .forEach((e) {
    //   if (!isInternetNetworkSuccess.value) {
    //     categoryProduct.value = "all";
    //     stage.value = 0;
    //     getDataProductCategorySelected();
    //     print("send data");
    //     Get.snackbar(
    //         "Information", "Network Error, Check your internet connection");
    //   }
    // });
  }

  Future<void> get7DailyWeather(double latitude, double longitude) async {
    listHourlyWeather.clear();
    try {
      d.Response response =
          await dio.get(Api.get7DaysWeather(latitude, longitude));
      if (response.statusCode == 200) {
        isInternetNetworkSuccess.value = true;
        print("# data => ${response.data["current"]}");
        CurrentWeather tempCurrentWeather =
            CurrentWeather.fromMap(response.data["current"]);
        currentWeather.value = tempCurrentWeather;

        await Future.forEach(response.data["hourly"], (item) async {
          var date = DateFormat("H:mm")
              .format(DateTime.fromMillisecondsSinceEpoch(item["dt"] * 1000));
          listTime.add(date);
          listWeather.add(item["weather"][0]["main"]);
          listWeatherIcon.add(item["weather"][0]["icon"]);
          listTemp.add(item["temp"]);
        });
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
