import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/Services/get_weather.dart';
import 'package:weather_app/Widgtes/bottom_container.dart';
import 'package:weather_app/Widgtes/center_container.dart';
import 'package:weather_app/Widgtes/week_days_container.dart';
import 'package:weather_app/Widgtes/tertiary_container.dart';
import 'package:weather_app/getX/controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key, this.weatherDataJson}) : super(key: key);
  final weatherDataJson;

  final double _fixedHeight = 10;
  var dateStringFormat = DateFormat.yMMMEd('en_US').format(DateTime.now());
  var weatherData = WeatherModel().getLocationAndWeatherData();
  //
  // late int dt;
  // late String sunrise;
  // late String sunset;
  // late int temperatureDegree;
  // late int maxDegree;
  // late int minDegree;
  // late String cityName;
  // late String weatherCondition;
  // late double windSpeed;
  // late int humidity;
  // late IconData weatherIconData;
  // late String iconCode;
  // //
  // @override
  // void initState() {
  //   super.initState();

  //   // _updateUI(widget.weatherDataJson);
  // }

  // void _updateUI(dynamic weatherDataInput) {
  //   setState(() {
  //     if (weatherDataInput == null) {
  //       temperatureDegree = 0;
  //       maxDegree = 0;
  //       minDegree = 0;
  //       humidity = 0;
  //       windSpeed = 0;
  //       sunrise = "00:00";
  //       sunset = "00:00";
  //       cityName = "Error";
  //       weatherCondition = "Not Available";
  //       return;
  //     }
  //     iconCode = weatherDataInput["current"]["weather"][0]["icon"];
  //     weatherIconData = StateController().getIconData(iconCode);

  //     int sunriseDT = weatherDataInput["current"]["sunrise"];
  //     int sunsetDT = weatherDataInput["current"]["sunset"];
  //     sunrise = getTheDateTime(sunriseDT);
  //     sunset = getTheDateTime(sunsetDT);

  //     double temp = weatherDataInput["current"]["temp"];
  //     temperatureDegree = temp.toInt();
  //     double maxTemp = weatherDataInput["daily"][0]["temp"]["max"];
  //     double minTemp = weatherDataInput["daily"][0]["temp"]["min"];
  //     maxDegree = maxTemp.toInt();
  //     minDegree = minTemp.toInt();
  //     cityName = weatherDataInput["timezone"];
  //     weatherCondition =
  //         weatherDataInput["current"]["weather"][0]["description"];
  //     windSpeed = weatherDataInput["current"]["wind_speed"];
  //     humidity = weatherDataInput["current"]["humidity"];
  //   });
  // }

  // *********************************************
  // String getTheDateTime(int dt) {
  //   var d12;

  //     d12 = DateFormat('hh:mm a')
  //         .format(DateTime.fromMillisecondsSinceEpoch(dt * 1000));

  //   return d12;
  // }

  // *********************************************
  @override
  Widget build(BuildContext context) {
    StateController stateController = Get.put(StateController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        actions: [
          Icon(
            Icons.more_vert,
            color: Theme.of(context).appBarTheme.backgroundColor,
          )
        ],
        title: Text(
          dateStringFormat,
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ),
      body: GetBuilder<StateController>(
        init: StateController(),
        initState: (_) {
          stateController.updateUI(weatherDataJson);
        },
        builder: (_) {
          return SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //CenterContainer
                Obx(() => CenterContainer(
                      cityName: stateController.cityName.value,
                      temperatureDegree:
                          stateController.temperatureDegree.value,
                      weatherCondition: stateController.weatherCondition.value,
                      centerIcon: stateController.weatherIconData.value,
                    )),

                SizedBox(height: _fixedHeight),
                // SliderContainer
                Obx(() => TertiaryContainer(
                      minDegree: stateController.minDegree.value,
                      maxDegree: stateController.maxDegree.value,
                    )),
                //
                SizedBox(height: _fixedHeight * 2),
                const Divider(
                  thickness: 1,
                ),
                SizedBox(height: _fixedHeight),
                // ListViewContainer
                WeekDaysContainer(
                  weatherDataJson: weatherDataJson,
                ),
                SizedBox(height: _fixedHeight),
                const Divider(
                  thickness: 1,
                ),
                SizedBox(height: _fixedHeight),
                // BottomContainer
                Obx(() => BottomContainer(
                      humidity: stateController.humidity.value,
                      windSpeed: stateController.windSpeed.value,
                      sunrise: stateController.sunrise.value,
                      sunset: stateController.sunset.value,
                    )),
                //
                SizedBox(height: _fixedHeight * 4),
              ],
            ),
          );
        },
      ),
    );
  }
}
