import 'package:geolocator/geolocator.dart';
import 'package:weather_app/Services/location.dart';
import 'package:weather_app/Services/networking.dart';

const apiKey = 'ea77b27a1760fcfa9b16541e066e86f8';
const openWeatherURL = 'https://api.openweathermap.org/data/2.5/onecall';

class WeatherModel {
  //
  // Future<dynamic> requestPermission() async {
  //   LocationPermission permissionRequest = await Geolocator.requestPermission();
  //   return permissionRequest;
  // }

  Future<void> permissionFunction() async {
    var permissionResult = await Geolocator.checkPermission();
    if (permissionResult == LocationPermission.always) {
      getLocationAndWeatherData();
    }
    // if (permissionResult == LocationPermission.denied ||
    //     permissionResult == LocationPermission.deniedForever) {
    //   ifPermissionDenied();
    // }
  }

  Future<dynamic> getLocationAndWeatherData() async {
    Location locationCheck = Location();
    await locationCheck.getCurrentLocation();
    double latitude = locationCheck.latitude;
    double longitude = locationCheck.longitude;

    NetworkHelper networkHelper = NetworkHelper(
      url:
          '$openWeatherURL?lat=$latitude&lon=$longitude&exclude=minutely,hourly&appid=$apiKey&units=metric',
    );
    var weatherJsonData = await networkHelper.getData();
    return weatherJsonData;
  }
}
