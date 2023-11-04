import 'dart:convert';

import 'package:api_ex/Datum.dart';

class CityData {
  List<Datum?> data;
  String message;
  String status;

  CityData({
    required this.data,
    required this.message,
    required this.status,
  });

  factory CityData.fromRawJson(String str) =>
      CityData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CityData.fromJson(Map<String, dynamic> json) => CityData(
        data: List<Datum?>.from(
            json["data"].map((x) => x == null ? null : Datum.fromJson(x))),
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x?.toJson())),
        "message": message,
        "status": status,
      };
}
