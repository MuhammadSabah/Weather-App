import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/getX/controller.dart';

class BottomContainer extends StatelessWidget {
  const BottomContainer(
      {Key? key,
      required this.windSpeed,
      required this.humidity,
      required this.sunrise,
      required this.sunset})
      : super(key: key);

  final double windSpeed;
  final int humidity;
  final double _fixedHeight = 10;
  final String sunrise;
  final String sunset;

  @override
  Widget build(BuildContext context) {
    StateController controller = Get.put(StateController());
    return IntrinsicHeight(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  'Wind Speed',
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(height: _fixedHeight * 2.5),
                Obx(
                  () => RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                            fontSize: 14,
                          ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '${windSpeed.toString()} ',
                        ),
                        TextSpan(
                          text: controller.groupVal.value == "metric"
                              ? 'm/s'
                              : 'M/h',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const VerticalDivider(
              thickness: 1,
              indent: 3,
              endIndent: 3,
              width: 30,
            ),
            Column(
              children: [
                Text(
                  'Sunrise',
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(height: _fixedHeight * 2.5),
                Text(
                  sunrise,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
            const VerticalDivider(
              thickness: 1,
              indent: 3,
              endIndent: 3,
              width: 30,
            ),
            Column(
              children: [
                Text(
                  'Sunset',
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(height: _fixedHeight * 2.5),
                Text(
                  sunset,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
            const VerticalDivider(
              thickness: 1,
              indent: 3,
              endIndent: 3,
              width: 30,
            ),
            Column(
              children: [
                Text(
                  'Humidity',
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(height: _fixedHeight * 2.5),
                Text(
                  '${humidity.toString()}%',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
