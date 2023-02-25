import 'dart:convert';

import 'package:get/get.dart';
import 'package:the_builders/GUI/globalApi.dart' as global;


List<schemeName> schemeNameFromJson(String str) =>
    List<schemeName>.from(json.decode(str).map((x) => schemeName.fromJson(x)));

String schemeNameToJson(List<schemeName> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class schemeName {
  schemeName({
    this.schemename,


  });
  var schemename;





  factory schemeName.fromJson(Map<String, dynamic> json) => schemeName(
    schemename: json["schemeName"],
  );

  Map<String, dynamic> toJson() => {
    "schemeName": schemename,
  };
}


// Future<List<schemeName>> ordersForDelivery() async {
//   var httprequest = GetConnect();
//   var response =
//   await httprequest.get("${global.url}/ShowOrdersIdToDeliveryBoy?dbid=${int.parse(login_user_id!)}");
//   if (response.statusCode == 200) {
//     var res = schemeNameFromJson(response.bodyString!);
//     return res;
//   }
//   else if (response.statusCode == 404) {
//     throw Exception('Please Add Your Vehicle');
//   }
//   else {
//     throw Exception('Failed to load data');
//   }
// }


