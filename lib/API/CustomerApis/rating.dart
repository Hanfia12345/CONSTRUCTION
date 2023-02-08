
import 'dart:convert';

Ratings ratingsFromJson(String str) => Ratings.fromJson(json.decode(str));

String ratingsToJson(Ratings data) => json.encode(data.toJson());

class Ratings {
  Ratings({
    this.vid,
    this.avgStars,
  });

  var vid;
  var avgStars;

  factory Ratings.fromJson(Map<String, dynamic> json) => Ratings(
    vid: json["vid"],
    avgStars: json["avg_stars"],
  );

  Map<String, dynamic> toJson() => {
    "vid": vid,
    "avg_stars": avgStars,
  };
}


