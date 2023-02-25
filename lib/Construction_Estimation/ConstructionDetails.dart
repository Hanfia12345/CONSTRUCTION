import 'dart:convert';

import 'package:get/get.dart';
import 'package:the_builders/GUI/globalApi.dart' as global;


List<schemeDetails> schemeDetailsFromJson(String str) =>
    List<schemeDetails>.from(json.decode(str).map((x) => schemeDetails.fromJson(x)));

String schemeDetailsToJson(List<schemeDetails> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class schemeDetails {
  schemeDetails({
    this.quantity,
    this.material,
    this.cost

  });
  var material;
  var quantity;
  var cost;





  factory schemeDetails.fromJson(Map<String, dynamic> json) => schemeDetails(
    material: json["material"],
      quantity:json["quantity"],
    cost:json["cost"],
  );

  Map<String, dynamic> toJson() => {
    "material": material,
    "quantity": quantity,
    "cost": cost,
  };
}



Future<List<schemeDetails>> getSchemeDetails(var sid) async {
  var httprequest = GetConnect();
  var response =
  await httprequest.get("${global.url}/ShowConstructionSchemeDetail?sid=$sid");
  if (response.statusCode == 200) {
    var res = schemeDetailsFromJson(response.bodyString!);
    return res;
  } else {

    throw Exception('Failed to load data');
  }
}