// ignore_for_file: avoid_print

import 'package:bloc_earthquake_app/constants/strings.dart';
import 'package:http/http.dart' as http;

class HttpService {
  static Future<http.Response?> getData() async {
    http.Response? response;
    try {
      response = await http.get(Uri.parse(AppStrings.baseUrl));
    } catch (e) {
      print(e);
    }

    return response;
  }
}
