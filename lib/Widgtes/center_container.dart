import 'package:flutter/material.dart';

class CenterContainer extends StatelessWidget {
  const CenterContainer({
    Key? key,
    required this.temperatureDegree,
    required this.cityName,
    required this.weatherCondition,
    required this.centerIcon,
  }) : super(key: key);

  final int temperatureDegree;
  final String cityName;
  final String weatherCondition;
  final IconData centerIcon;
  final double _fixedHeight = 10;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Text(
              cityName.toUpperCase(),
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(height: _fixedHeight),
            Text(
              weatherCondition.toUpperCase(),
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(height: _fixedHeight * 2),
            Icon(
              centerIcon,
              size: 70,
            ),
            SizedBox(height: _fixedHeight * 2),
            Text(
              '${temperatureDegree.toString()}°',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ],
    );
  }
}
