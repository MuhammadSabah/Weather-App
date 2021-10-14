import 'package:flutter/material.dart';

class TertiaryContainer extends StatelessWidget {
  // double _width = MediaQuery.of(context).size.width;
  // double _height = MediaQuery.of(context).size.height;
  const TertiaryContainer(
      {Key? key, required this.maxDegree, required this.minDegree})
      : super(key: key);

  final int maxDegree;
  final int minDegree;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                'max',
                style: Theme.of(context).textTheme.headline5,
              ),
              const SizedBox(height: 14),
              Text(
                '${maxDegree.toString()}°',
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
          const VerticalDivider(
            thickness: 1,
            indent: 10,
            endIndent: 6,
            width: 30,
          ),
          Column(
            children: [
              Text(
                'min',
                style: Theme.of(context).textTheme.headline5,
              ),
              const SizedBox(height: 14),
              Text(
                '${minDegree.toString()}°',
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
