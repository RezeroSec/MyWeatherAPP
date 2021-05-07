import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_app/controllers/weatherController.dart';

class LocationController extends GetxController {
  // final WeatherController weatherController = Get.put(WeatherController());
  var x = "".obs;
  LocationPermission _permission;
  bool _looping = true;

  checkPermission() async {
    while (_looping) {
      _permission = await Geolocator.checkPermission();
      // print("permission => $_permission");
      if (_permission == LocationPermission.always) {
        print("# permission => granted");
        _looping = false;
      }
      if (_permission == LocationPermission.denied) {
        _permission = await Geolocator.requestPermission();
        print("# permission => not granted");
      }
      await Future.delayed(const Duration(seconds: 1));
    }
  }
}
