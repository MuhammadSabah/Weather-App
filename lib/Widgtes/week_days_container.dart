import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/getX/controller.dart';

class WeekDaysContainer extends StatelessWidget {
  const WeekDaysContainer({Key? key, @required this.weatherDataJson})
      : super(key: key);
  final weatherDataJson;

  final double _fixedHeight = 5;

  @override
  Widget build(BuildContext context) {
    StateController controller = Get.put(StateController());
    List<Map<String, dynamic>> weekDays() {
      return List.generate(6, (index) {
        final eachWeekDay = DateTime.now().subtract(Duration(days: index + 1));
        controller.updateTheWeekDay(weatherDataJson, index);

        return {
          'day': DateFormat.E().format(eachWeekDay).substring(0, 3),
          'tempDay': controller.eachDayTemp.value,
          'tempNight': controller.eachNightTemp.value,
          'weatherIcon': controller.weekDaysWeatherIconData.value,
        };
      }).reversed.toList();
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: weekDays().map((data) {
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
