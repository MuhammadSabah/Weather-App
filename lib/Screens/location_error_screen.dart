import 'package:flutter/material.dart';

class LocationError extends StatelessWidget {
  const LocationError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/Location Error.png',
      fit: BoxFit.cover,
    );
  }
}
