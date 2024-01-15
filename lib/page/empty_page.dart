import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/check_location.dart';

class EmptyPage extends GetView {
  const EmptyPage({super.key});

  @override
  Widget build(BuildContext context) {
    CheckLocation location = CheckLocation();

    return Scaffold(
      body: Center(
          child: ElevatedButton(
              onPressed: () {
                location.getLocation();
              },
              child: const Text("Grant Location"))),
    );
  }
}
