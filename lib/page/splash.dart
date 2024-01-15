import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/check_location.dart';

class SplashScreen extends GetView {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CheckLocation location = CheckLocation();

    Future.delayed(const Duration(seconds: 2), () {
      location.getLocation();
    });

    return const Scaffold(
      body: Center(
        child: Text(
          "Weather App",
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
      ),
    );
  }
}
