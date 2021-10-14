import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/Screens/loading_screen.dart';
import 'package:weather_app/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      theme: themeData(context),
      darkTheme: darkThemeData(context),
      themeMode: ThemeMode.dark,
      home: const LoadingScreen(),
    );
  }
}
