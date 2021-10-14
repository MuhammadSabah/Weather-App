import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/Services/get_weather.dart';
import 'package:weather_app/Utils/weather_icon.dart';
import 'package:weather_app/Widgtes/bottom_container.dart';
import 'package:weather_app/Widgtes/center_container.dart';
import 'package:weather_app/Widgtes/week_days_container.dart';
import 'package:weather_app/Widgtes/tertiary_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, this.weatherDataJson}) : super(key: key);

  final weatherDataJson;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final double _fixedHeight = 10;

  // ************************
  var dateStringFormat = DateFormat.yMMMEd('en_US').format(DateTime.now());
  //
  var weatherData = WeatherModel().getLocationAndWeatherData();
  //
  late int dt;
  late String sunrise;
  late String sunset;
  late int temperatureDegree;
  late int maxDegree;
  late int minDegree;
  late String cityName;
  late String weatherCondition;
  late double windSpeed;
  late int humidity;
  late IconData weatherIconData;
  late String iconCode;
  //
  @override
  void initState() {
    super.initState();
    updateUI(widget.weatherDataJson);
  }

  void updateUI(dynamic weatherDataInput) {
    // Change it to PROVIDER......
    setState(() {
      if (weatherDataInput == null) {
        temperatureDegree = 0;
        maxDegree = 0;
        minDegree = 0;
        humidity = 0;
        windSpeed = 0;
        sunrise = "00:00";
        sunset = "00:00";
        cityName = "Error";
        weatherCondition = "Not Available";
        return;
      }
      iconCode = weatherDataInput["current"]["weather"][0]["icon"];
      weatherIconData = getIconData(iconCode);

      int sunriseDT = weatherDataInput["current"]["sunrise"];
      int sunsetDT = weatherDataInput["current"]["sunset"];
      sunrise = getTheDateTime(sunriseDT);
      sunset = getTheDateTime(sunsetDT);

      double temp = weatherDataInput["current"]["temp"];
      temperatureDegree = temp.toInt();
      double maxTemp = weatherDataInput["daily"][0]["temp"]["max"];
      double minTemp = weatherDataInput["daily"][0]["temp"]["min"];
      maxDegree = maxTemp.toInt();
      minDegree = minTemp.toInt();
      cityName = weatherDataInput["timezone"];
      weatherCondition =
          weatherDataInput["current"]["weather"][0]["description"];
      windSpeed = weatherDataInput["current"]["wind_speed"];
      humidity = weatherDataInput["current"]["humidity"];
    });
  }

  IconData getIconData(String iconCode) {
    switch (this.iconCode) {
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

  // *********************************************
  String getTheDateTime(int dt) {
    var d12;
    setState(() {
      d12 = DateFormat('hh:mm a')
          .format(DateTime.fromMillisecondsSinceEpoch(dt * 1000));
    });
    return d12;
  }

  @override
  Widget build(BuildContext context) {
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
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //CenterContainer
            CenterContainer(
              cityName: cityName,
              temperatureDegree: temperatureDegree,
              weatherCondition: weatherCondition,
              centerIcon: weatherIconData,
            ),
            //
            SizedBox(height: _fixedHeight),
            // SliderContainer
            TertiaryContainer(
              minDegree: minDegree,
              maxDegree: maxDegree,
            ),
            //
            SizedBox(height: _fixedHeight * 2),
            const Divider(
              thickness: 1,
            ),
            SizedBox(height: _fixedHeight),
            // ListViewContainer
            WeekDaysContainer(
              weatherDataJson: widget.weatherDataJson,
            ),
            SizedBox(height: _fixedHeight),
            const Divider(
              thickness: 1,
            ),
            SizedBox(height: _fixedHeight),
            // BottomContainer
            BottomContainer(
              humidity: humidity,
              windSpeed: windSpeed,
              sunrise: sunrise,
              sunset: sunset,
            ),
            //
            SizedBox(height: _fixedHeight * 4),
          ],
        ),
      ),
    );
  }
}
