import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/Utils/weather_icon.dart';

class WeekDaysContainer extends StatefulWidget {
  const WeekDaysContainer({Key? key, @required this.weatherDataJson})
      : super(key: key);
  final weatherDataJson;

  @override
  State<WeekDaysContainer> createState() => _WeekDaysContainerState();
}

class _WeekDaysContainerState extends State<WeekDaysContainer> {
  int eachDayTemp = 0;
  int eachNightTemp = 0;
  late String iconCode;
  late IconData weatherIconData;

  List<Map<String, dynamic>> get weekDays {
    return List.generate(6, (index) {
      final eachWeekDay = DateTime.now().subtract(Duration(days: index + 1));

      setState(() {
        if (widget.weatherDataJson == null) {
          eachDayTemp = 0;
          eachNightTemp = 0;
          return;
        }
        double tempOfDays =
            widget.weatherDataJson["daily"][7 - (index + 1)]["temp"]["day"];
        eachDayTemp = tempOfDays.toInt();

        double tempOfNights =
            widget.weatherDataJson["daily"][7 - (index + 1)]["temp"]["night"];
        eachNightTemp = tempOfNights.toInt();

        iconCode = widget.weatherDataJson["daily"][7 - (index + 1)]["weather"]
            [0]["icon"];
        weatherIconData = getIconData(iconCode);
      });
      return {
        'day': DateFormat.E().format(eachWeekDay).substring(0, 3),
        'tempDay': eachDayTemp,
        'tempNight': eachNightTemp,
        'weatherIcon': weatherIconData,
      };
    }).reversed.toList();
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

  final double _fixedHeight = 5;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: weekDays.map((data) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              data['day'].toString(),
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(height: _fixedHeight),
            Icon(
              data["weatherIcon"],
              size: 18,
            ),
            SizedBox(height: _fixedHeight * 3),
            Text(
              '${data['tempDay'].toString()}°',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: _fixedHeight),
            Text(
              '${data['tempNight'].toString()}°',
              style: Theme.of(context).textTheme.headline5,
            ),
          ],
        );
      }).toList(),
    );
  }
}
