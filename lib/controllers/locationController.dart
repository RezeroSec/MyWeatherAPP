import 'dart:async';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocationController extends GetxController {
  var latitude = 0.0.obs;
  var longitude = 0.0.obs;
  var currentLocation = "Location".obs;
  var isCurrentAddress = false.obs;

  LocationPermission _permission;
  bool _looping = true;
  Timer _timer;

  bool _isAnyChangeLocation = false;

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

  _getLocation() {
    _timer = Timer.periodic(const Duration(seconds: 10), (timer) async {
      if (_permission == LocationPermission.always) {
        try {
          await Geolocator.getCurrentPosition(
                  desiredAccuracy: LocationAccuracy.best)
              .then((position) async {
            print("# current_position => ${position}");
            latitude.value = position.latitude;
            longitude.value = position.longitude;
            await _getAddressFromLatLng();
          });
        } catch (e) {
          print("# error get position e:$e");
        }
      }
    });
  }

  Future<void> _getAddressFromLatLng() async {
    try {
      _isAnyChangeLocation = false;
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude.value, longitude.value);
      Placemark place = placemarks[0];

      if (place.subLocality == "") {
        currentLocation.value = place.locality;
        isCurrentAddress.value = true;
      } else {
        currentLocation.value = "${place.subLocality}, ${place.locality}";
        isCurrentAddress.value = true;
      }
    } catch (e) {
      print("# error get placemarks e:$e");
    }
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    _getLocation();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    _timer.cancel();
  }
}
