// To parse this JSON data, do
//
//     final cartItems = cartItemsFromJson(jsonString);

import 'dart:convert';
import 'package:the_builders/GUI/globalApi.dart' as global;
import 'package:get/get.dart';

List<CartItems> cartItemsFromJson(String str) =>
    List<CartItems>.from(json.decode(str).map((x) => CartItems.fromJson(x)));

String cartItemsToJson(List<CartItems> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CartItems {
  CartItems({
    this.cartid,
    this.pDesc,
    this.pImage,
    this.unitprice,
    this.pid,
    this.cid,
  });

  int? cartid;
  String? pDesc;
  String? pImage;
  int? unitprice;
  int? pid;
  int? cid;

  factory CartItems.fromJson(Map<String, dynamic> json) => CartItems(
        cartid: json["cartid"],
        pDesc: json["p_desc"],
        pImage: json["p_image"],
        unitprice: json["unitprice"],
        pid: json["pid"],
        cid: json["cid"],
      );

  Map<String, dynamic> toJson() => {
        "cartid": cartid,
        "p_desc": pDesc,
        "p_image": pImage,
        "unitprice": unitprice,
        "pid": pid,
        "cid": cid,
      };
}

Future<List<CartItems>> cartitemdetails(int id) async {
  var httprequest = GetConnect();
  var response = await httprequest.get('${global.url}/viewCartItem?cid=$id');
  var res = cartItemsFromJson(response.bodyString!);
  return res;
}
