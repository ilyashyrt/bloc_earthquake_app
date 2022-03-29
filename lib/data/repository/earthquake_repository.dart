import 'dart:convert';
import 'dart:io';

import 'package:bloc_earthquake_app/data/models/earthquake_model.dart';
import 'package:bloc_earthquake_app/data/services/http_service.dart';

class EarthquakeRepository {
  Future<Earthquake?> getDataFromService() async {
    try {
      final response = await HttpService.getData();
      var data = jsonDecode(response!.body);
      if (response.statusCode == 200) {
        final result = Earthquake.fromJson(data);
        return result;
      } else {
        return null;
      }
    } on SocketException {
      rethrow;
    } on HttpException {
      rethrow;
    } on FormatException {
      rethrow;
    }
  }
}
