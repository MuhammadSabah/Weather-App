import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/getX/controller.dart';

class WeekDaysContainer extends StatelessWidget {
  WeekDaysContainer({Key? key, @required this.weatherDataJson})
      : super(key: key);
  dynamic weatherDataJson;
  final double _fixedHeight = 5;

  //
  StateController weekDaysController = Get.put(StateController());

  List<Map<String, dynamic>> weekDays(dynamic weatherDataJson) {
    return List.generate(6, (index) {
      final eachWeekDay = DateTime.now().subtract(Duration(days: index + 1));
      weekDaysController.updateTheWeekDay(weatherDataJson, index);
      return {
        'day': DateFormat.E().format(eachWeekDay).substring(0, 3),
        'tempDay': weekDaysController.groupVal.value == 'metric'
            ? weekDaysController.eachDayTemp.value
            : weekDaysController.eachDayFahrenheitTemp.value,
        'tempNight': weekDaysController.groupVal.value == 'metric'
            ? weekDaysController.eachNightTemp.value
            : weekDaysController.eachNightFahrenheitTemp.value,
        'weatherIcon': weekDaysController.weekDaysWeatherIconData.value,
      };
    }).reversed.toList();
  }

  //
  @override
  Widget build(BuildContext context) {
    return GetX<StateController>(
      init: StateController(),
      initState: (_) {
        weekDays(weatherDataJson);
      },
      builder: (_) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: weekDays(weatherDataJson).map((data) {
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
      },
    );
  }
}
