// ignore_for_file: file_names, non_constant_identifier_names

import 'package:the_builders/GUI/globalApi.dart' as global;
import 'dart:convert';

import 'package:get/get.dart';

List<ProductDetail> productDetailFromJson(String str) =>
    List<ProductDetail>.from(
        json.decode(str).map((x) => ProductDetail.fromJson(x)));

String productDetailToJson(List<ProductDetail> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductDetail {
  ProductDetail({
    this.Pid,
    this.pDesc,
    this.pImage,
    this.unitcost,
    this.name,
    this.location,
    this.pCtg,
   required this.stock,
  });

  String? pDesc;
  String? pImage;
  int? Pid;
  int? unitcost;
  String? name;
  String? location;
  String? pCtg;
  int stock;

  factory ProductDetail.fromJson(Map<String, dynamic> json) => ProductDetail(
        pDesc: json["p_desc"],
        pImage: json["P_image"],
        unitcost: json["unitcost"],
        name: json["name"],
        location: json["location"],
        pCtg: json["p_ctg"],
        Pid: json["pid"],
        stock:json["stock"],
      );

  Map<String, dynamic> toJson() => {
        "p_desc": pDesc,
        "P_image": pImage,
        "unitcost": unitcost,
        "name": name,
        "location": location,
        "p_ctg":pCtg,
        "pid":Pid,
        "stock":stock,
      };
}

Future<List<ProductDetail>> viewProductDetails(var pid) async {
  var httprequest = GetConnect();
  httprequest.timeout = const Duration(seconds: 20);
  var response = await httprequest.get("${global.url}/ProductDetail?pid=$pid");
  if (response.statusCode == 200) {
    var res = productDetailFromJson(response.bodyString!);
    return res;
  } else {
    throw Exception('Failed to load data');
  }
}

Future<List<ProductDetail>> SuggestionList(var pid) async {
  var httprequest = GetConnect();
  httprequest.timeout = const Duration(seconds: 20);
  var response = await httprequest.get("${global.url}/suggestionsList?pid=$pid");
  if (response.statusCode == 200) {
    var res = productDetailFromJson(response.bodyString!);
    return res;
  } else {
    throw Exception('Failed to load data');
  }
}