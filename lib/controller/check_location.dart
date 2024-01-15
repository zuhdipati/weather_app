import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_app/core/app_routes.dart';

class CheckLocation {
  bool isGranted = true;
  double? latitude;
  double? longitude;

  Future<void> getLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
      Get.offNamed(Routes.empty);
      if (permission == LocationPermission.denied) {
        log('Location permissions are denied');
        Get.snackbar('', 'Location Permission Denied');
        Get.offNamed(Routes.empty);
      } else if (permission == LocationPermission.deniedForever) {
        log("Location permissions are permanently denied");
        Get.snackbar('', 'Location Permission Denied');
        Get.offNamed(Routes.empty);
      } else {
        log("GPS Location service is granted");
        Get.offNamed(Routes.home);
      }
    } else {
      debugPrint("GPS Location permission granted.");
      Get.offNamed(Routes.home);
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    latitude = position.latitude;
    longitude = position.longitude;
  }
}
