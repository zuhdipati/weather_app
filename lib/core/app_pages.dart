import 'package:get/get.dart';
import 'package:weather_app/core/app_routes.dart';
import 'package:weather_app/page/empty_page.dart';
import 'package:weather_app/page/home_page.dart';
import 'package:weather_app/page/splash.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.home, page: () => const HomePage()),
    GetPage(name: Routes.splash, page: () => const SplashScreen()),
    GetPage(name: Routes.empty, page: () => const EmptyPage()),
  ];
}
