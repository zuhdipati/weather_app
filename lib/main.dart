import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/core/app_pages.dart';
import 'package:weather_app/core/app_theme.dart';
import 'package:weather_app/page/splash.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Weather App',
      home: const SplashScreen(),
      theme: myTheme,
      getPages: AppPages.pages,
    );
  }
}
