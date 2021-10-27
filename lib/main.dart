import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
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
    return GetMaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      theme: themeData(context),
      darkTheme: darkThemeData(context),
      themeMode: ThemeMode.light,
      home: const LoadingScreen(),
    );
  }
}
