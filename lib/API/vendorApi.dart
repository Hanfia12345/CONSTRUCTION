// ignore_for_file: file_names

import 'dart:convert';
import 'package:the_builders/GUI/globalApi.dart' as global;
import 'package:get/get.dart';

//-----------------To Display product Details------------------------

List<VendorProductss> vendorProductssFromJson(String str) =>
    List<VendorProductss>.from(
        json.decode(str).map((x) => VendorProductss.fromJson(x)));

String vendorProductssToJson(List<VendorProductss> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VendorProductss {
  VendorProductss({
    this.pid,
    this.pDesc,
    this.pCtg,
    this.pImage,
    this.pUnit,
    this.unitcost,
    this.stock,
  });

  int? pid;
  String? pDesc;
  String? pCtg;
  String? pImage;
  String? pUnit;
  int? unitcost;
  int? stock;
  factory VendorProductss.fromJson(Map<String, dynamic> json) =>
      VendorProductss(
        pid: json["pid"],
        pDesc: json["p_desc"],
        pCtg: json["p_ctg"],
        pImage: json["P_image"],
        pUnit: json["p_unit"],
        unitcost: json["unitcost"],
        stock: json["stock"],
      );

  Map<String, dynamic> toJson() => {
        "pid": pid,
        "p_desc": pDesc,
        "p_ctg": pCtg,
        "P_image": pImage,
        "p_unit": pUnit,
        "unitcost": unitcost,
        "stock": stock,
      };
}

List<ProductDetail> productDetailFromJson(String str) =>
    List<ProductDetail>.from(
        json.decode(str).map((x) => ProductDetail.fromJson(x)));

String productDetailToJson(List<ProductDetail> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductDetail {
  ProductDetail({
    this.pid,
    this.pDesc,
    this.pCtg,
    this.pImage,
    this.stock,
    this.pUnit,
    this.unitcost,
  });

  int? pid;
  String? pDesc;
  String? pCtg;
  String? pImage;
  int? stock;
  String? pUnit;
  int? unitcost;

  factory ProductDetail.fromJson(Map<String, dynamic> json) => ProductDetail(
        pid: json["pid"],
        pDesc: json["p_desc"],
        pCtg: json["p_ctg"],
        pImage: json["P_image"],
        stock: json["stock"],
        pUnit: json["p_unit"],
        unitcost: json["unitcost"],
      );

  Map<String, dynamic> toJson() => {
        "pid": pid,
        "p_desc": pDesc,
        "p_ctg": pCtg,
        "P_image": pImage,
        "stock": stock,
        "p_unit": pUnit,
        "unitcost": unitcost,
      };
}

// ignore: non_constant_identifier_names
Future<List<ProductDetail>> ViewDetails(var pid) async {
  var httprequest = GetConnect();
  httprequest.timeout = const Duration(seconds: 20);
  var response =
      await httprequest.get("${global.url}/displayProductDetail?id=$pid");
  if (response.statusCode == 200) {
    var res = productDetailFromJson(response.bodyString!);
    return res;
  } else {
    throw Exception('Failed to load data');
  }
}
//------------------------------------------------------------------------