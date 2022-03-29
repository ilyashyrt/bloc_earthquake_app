// ignore_for_file: avoid_print

import 'package:http/http.dart' as http;

class HttpService {
  static Future<http.Response?> getData() async {
    http.Response? response;
    try {
      response = await http.get(Uri.parse(
          "https://api.orhanaydogdu.com.tr/deprem/live.php?limit=25"));
    } catch (e) {
      print(e);
    }

    return response;
  }
}
