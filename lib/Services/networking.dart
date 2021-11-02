import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/Screens/error_screen.dart';

class NetworkHelper {
  NetworkHelper({required this.url});
  final String url;

  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print("STATUS CODE: " + response.statusCode.toString());
    }
  }
}
