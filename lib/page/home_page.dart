import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/home_controller.dart';
import 'package:weather_app/core/app_theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        var weatherData = controller.weather.value;
        return Scaffold(
          backgroundColor: const Color(0xff4a4a4a),
          body: controller.isLoading.value == true
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Today, ${controller.formatDate(DateTime.now())}",
                            style: myTextTheme.labelLarge,
                          ),
                          Text(
                            controller.formatTime(DateTime.now()),
                            style: myTextTheme.labelLarge,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(controller.city!, style: myTextTheme.bodyLarge),
                          SizedBox(
                            width: Get.width / 1.5,
                            height: Get.height / 2.5,
                            child: CircleAvatar(
                              backgroundColor: Colors.grey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      height: 100,
                                      width: 200,
                                      child: controller.getIcon(
                                          weatherData.weather![0].icon)),
                                  const SizedBox(height: 20),
                                  Text(
                                    "${weatherData.main!.temp}°C",
                                    style: const TextStyle(
                                      fontSize: 45,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Text(
                            weatherData.weather![0].description,
                            style: myTextTheme.bodySmall,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Wind Speed",
                                style: myTextTheme.labelMedium,
                              ),
                              Text(weatherData.wind!.speed.toString()),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Humidity",
                                style: myTextTheme.labelMedium,
                              ),
                              Text(weatherData.main!.humidity.toString()),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Visibility",
                                style: myTextTheme.labelMedium,
                              ),
                              Text(weatherData.visibility.toString()),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Air Pressure",
                                style: myTextTheme.labelMedium,
                              ),
                              Text(weatherData.main!.pressure.toString()),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
        );
      },
    );
  }
}
