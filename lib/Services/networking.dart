import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper({required this.url});
  final String url;

  Future getData() async {
    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        String data = response.body;
        return jsonDecode(data);
      } else {
        String failData = 0.toString();
        return jsonDecode(failData);
      }
    } catch (e) {
      print(e);
    }
  }
}
