// To parse this JSON data, do
//
//     final latLongListForDistance = latLongListForDistanceFromJson(jsonString);

import 'dart:convert';


List<LatLongListForDistance> latLongListForDistanceFromJson(String str) => List<LatLongListForDistance>.from(json.decode(str).map((x) => LatLongListForDistance.fromJson(x)));

String latLongListForDistanceToJson(List<LatLongListForDistance> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LatLongListForDistance {
  LatLongListForDistance({
    required this.lat,
    required this.long,
    this.distance=0.0,
  });

  double lat;
  double long;
  late double distance;

  factory LatLongListForDistance.fromJson(Map<String, dynamic> json) => LatLongListForDistance(
    lat: json["Lat"]?.toDouble(),
    long: json["Long"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "Lat": lat,
    "Long": long,
  };
}








