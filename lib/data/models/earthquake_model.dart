// To parse this JSON data, do
//
//     final earthquake = earthquakeFromJson(jsonString);

import 'dart:convert';

Earthquake earthquakeFromJson(String str) =>
    Earthquake.fromJson(json.decode(str));

String earthquakeToJson(Earthquake data) => json.encode(data.toJson());

class Earthquake {
  Earthquake({
    this.status,
    this.result,
  });

  bool? status;
  List<Result>? result;

  factory Earthquake.fromJson(Map<String, dynamic> json) => Earthquake(
        status: json["status"],
        result:
            List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "result": List<dynamic>.from(result!.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    this.mag,
    this.lng,
    this.lat,
    this.lokasyon,
    this.title,
    this.date,
  });

  double? mag;
  double? lng;
  double? lat;
  String? lokasyon;
  String? title;
  String? date;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        mag: json["mag"].toDouble(),
        lng: json["lng"].toDouble(),
        lat: json["lat"].toDouble(),
        lokasyon: json["lokasyon"],
        title: json["title"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "mag": mag,
        "lng": lng,
        "lat": lat,
        "lokasyon": lokasyon,
        "title": title,
        "date": date,
      };
}
