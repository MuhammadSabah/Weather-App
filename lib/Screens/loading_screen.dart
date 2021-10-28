import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/Services/get_weather.dart';
import 'error_screen.dart';
import 'home_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  final _transition = Transition.leftToRight;
  final _duration = const Duration(milliseconds: 300);

  Future<dynamic> getLocationData() async {
    var weatherData = await WeatherModel().getLocationAndWeatherData();

    if (weatherData == null) {
      Get.to(
        () => const ErrorScreen(),
        transition: _transition,
        duration: _duration,
      );
    }
    if (weatherData != null) {
      Get.to(
        () => HomeScreen(weatherDataJson: weatherData),
        transition: _transition,
        duration: _duration,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
