import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/Screens/location_error_screen.dart';
import 'package:weather_app/Services/get_weather.dart';
import 'error_screen.dart';
import 'home_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  // _startTimer() async {
  //   Duration _duration = const Duration(seconds: 8);
  //   return Timer(_duration, route);
  // }
  route() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const LocationError();
        },
      ),
    );
  }

  Future<dynamic> getLocationData() async {
    var weatherData = await WeatherModel().getLocationAndWeatherData();

    if (weatherData == null) {
      Get.to(() => const ErrorScreen());
    }
    if (weatherData != null) {
      Get.to(() => HomeScreen(weatherDataJson: weatherData));
      // Get.to(() => StateController(weatherDataJsonState: weatherData));
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
