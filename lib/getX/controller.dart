import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/Utils/weather_icon.dart';

class StateController extends GetxController {
  StateController({this.weatherDataJsonState});
  final weatherDataJsonState;
  //
  final groupVal = 'metric'.obs;
  //
  final sunrise = ''.obs;
  final sunset = ''.obs;
  final temperatureDegree = 0.obs;
  final maxDegree = 0.obs;
  final minDegree = 0.obs;
  final cityName = ''.obs;
  final weatherCondition = ''.obs;
  final windSpeed = 0.0.obs;
  final humidity = 0.obs;
  final weatherIconData = Rxn<dynamic>();
  final iconCode = ''.obs;
  //
  final weekDaysIconCode = ''.obs;
  final weekDaysWeatherIconData = Rxn<dynamic>();
  final eachDayTemp = 0.obs;
  final eachNightTemp = 0.obs;
  //
  void updateUI(dynamic weatherDataInput) {
    if (weatherDataInput == null) {
      temperatureDegree(0).toInt();
      maxDegree(0).toInt();
      minDegree(0).toInt();
      humidity(0).toInt();
      windSpeed(0.0).toDouble();
      sunrise('00:00').toString();
      sunset('00:00').toString();
      cityName('Error').toString();
      weatherCondition("Not Available").toString();
      return;
    }
    iconCode(weatherDataInput["current"]["weather"][0]["icon"]).toString();
    weatherIconData(getIconData(iconCode.toString()));

    int sunriseDT = weatherDataInput["current"]["sunrise"];
    int sunsetDT = weatherDataInput["current"]["sunset"];
    sunrise(getTheDateTime(sunriseDT).toString());
    sunset(getTheDateTime(sunsetDT).toString());

    double temp = weatherDataInput["current"]["temp"];
    temperatureDegree(temp.toInt());
    var maxTemp = weatherDataInput["daily"][0]["temp"]["max"];
    var minTemp = weatherDataInput["daily"][0]["temp"]["min"];
    maxDegree(maxTemp.toInt());
    minDegree(minTemp.toInt());
    cityName(weatherDataInput["timezone"].toString());
    weatherCondition(
        weatherDataInput["current"]["weather"][0]["description"].toString());
    windSpeed(weatherDataInput["current"]["wind_speed"].toDouble());
    humidity(weatherDataInput["current"]["humidity"].toInt());
  }

  //
  String getTheDateTime(int dt) {
    var d12;
    d12 = DateFormat('hh:mm a')
        .format(DateTime.fromMillisecondsSinceEpoch(dt * 1000));
    return d12;
  }

  //
  void updateTheWeekDay(dynamic weatherDataInput, int index) {
    if (weatherDataInput == null) {
      eachDayTemp(0).toInt();
      eachNightTemp(0).toInt();
      return;
    }
    var tempOfDays = weatherDataInput["daily"][7 - (index + 1)]["temp"]["day"];
    eachDayTemp(tempOfDays.toInt());
    //
    var tempOfNights =
        weatherDataInput["daily"][7 - (index + 1)]["temp"]["night"];
    eachNightTemp(tempOfNights.toInt());
    //
    weekDaysIconCode(
        weatherDataInput["daily"][7 - (index + 1)]["weather"][0]["icon"]);
    weekDaysWeatherIconData(getIconData(weekDaysIconCode.toString()));
  }

  IconData getIconData(String iconCode) {
    switch (iconCode) {
      case '01d':
        return WeatherIcons.clearDay;
      case '01n':
        return WeatherIcons.clearNight;
      case '02d':
        return WeatherIcons.fewCloudsDay;
      case '02n':
        return WeatherIcons.fewCloudsNight;
      case '03d':
      case '04d':
        return WeatherIcons.cloudDay;
      case '03n':
      case '04n':
        return WeatherIcons.cloudNight;
      case '09d':
        return WeatherIcons.showerRainDay;
      case '09n':
        return WeatherIcons.showerRainNight;
      case '10d':
        return WeatherIcons.rainDay;
      case '10n':
        return WeatherIcons.rainNight;
      case '11d':
        return WeatherIcons.thunderStormDay;
      case '11n':
        return WeatherIcons.thunderStormNight;
      case '13d':
        return WeatherIcons.snowDay;
      case '13n':
        return WeatherIcons.snowNight;
      case '50d':
        return WeatherIcons.mistDay;
      case '50n':
        return WeatherIcons.mistNight;
      default:
        return WeatherIcons.clearDay;
    }
  }
}
