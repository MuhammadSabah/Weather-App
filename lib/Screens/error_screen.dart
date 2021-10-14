import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _statusBarHeight = MediaQuery.of(context).padding.top;
    double _height = MediaQuery.of(context).size.height;
    var _screenHeight = _height - _statusBarHeight;
    return Image.asset(
      'assets/Connection_Lost_2.png',
      fit: BoxFit.cover,
      height: _screenHeight,
    );
  }
}
