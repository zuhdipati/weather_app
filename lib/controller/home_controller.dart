import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/controller/check_location.dart';
import 'package:weather_app/model/weather_model.dart';

class HomeController extends GetxController {
  final location = CheckLocation();
  Rx<Weather> weather = Weather().obs;
  RxBool isLoading = false.obs;
  String? city;

  Future<void> getWeather() async {
    isLoading.value = true;

    await location.getLocation();

    double lat = location.latitude!;
    double long = location.longitude!;

    await getCity(lat, long);

    final baseUrl = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=246870ca0491e4f355fa3c139dd60029&lang=ID&units=metric');

    try {
      var response = await http.get(baseUrl);
      if (response.statusCode == 200) {
        var decodedJson = jsonDecode(response.body);
        weather.value = Weather.fromJson(decodedJson);
        update();
        isLoading.value = false;
      } else {
        isLoading.value = false;
        throw Exception("Failed to load weather data");
      }
    } catch (e) {
      debugPrint("Error $e");
      isLoading.value = false;
      throw Exception("Failed to load weather data");
    }
  }

  Future<void> getCity(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);

      if (placemarks.isNotEmpty) {
        Placemark placemark = placemarks[0];
        city = placemark.locality;
      } else {
        debugPrint('No location information available');
      }
    } catch (e) {
      debugPrint('Error getting location: $e');
    }
  }

  String formatDate(DateTime date) {
    String formattedDate = DateFormat('dd MMM yyyy').format(date);
    return formattedDate;
  }

  String formatTime(DateTime time) {
    String formattedTime = DateFormat('HH:mm').format(time);
    return formattedTime;
  }

  Image getIcon(String code) {
    var weatherIcon = Image.network(
      "https://openweathermap.org/img/wn/$code@2x.png",
      fit: BoxFit.cover,
    );
    return weatherIcon;
  }

  @override
  void onInit() {
    getWeather();
    super.onInit();
  }
}
