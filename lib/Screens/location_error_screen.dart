import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_app/Services/get_weather.dart';
import 'home_screen.dart';

class LocationError extends StatelessWidget {
  LocationError({Key? key}) : super(key: key);
  final WeatherModel _weatherModel = WeatherModel();
  final _transition = Transition.leftToRight;
  final _duration = const Duration(milliseconds: 300);
  Future<void> refreshLocationScreen() async {
    var weatherData = await _weatherModel.getLocationAndWeatherData();
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (weatherData != null && serviceEnabled) {
      Get.to(
        () => HomeScreen(weatherDataJson: weatherData),
        transition: _transition,
        duration: _duration,
      );
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;
    return RefreshIndicator(
      onRefresh: () => refreshLocationScreen(),
      backgroundColor: Colors.white,
      color: Colors.green,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: SizedBox(
          height: _screenHeight,
          child: Image.asset(
            'assets/Location Error.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
