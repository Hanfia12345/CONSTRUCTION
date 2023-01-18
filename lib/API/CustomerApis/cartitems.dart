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
   required this.unitprice,
    this.pid,
    this.cid,
    this.vid,
   required this.qty,

  // "vid": 1,
  // "qty": 12

  });

  int? cartid;
  String? pDesc;
  String? pImage;
  int unitprice;
  int? pid;
  int? cid;
  int?vid;
  int qty;

  factory CartItems.fromJson(Map<String, dynamic> json) => CartItems(
        cartid: json["cartid"],
        pDesc: json["p_desc"],
        pImage: json["p_image"],
        unitprice: json["unitprice"],
        pid: json["pid"],
        cid: json["cid"],
        vid:json["vid"],
        qty:json["qty"],
      );

  Map<String, dynamic> toJson() => {
        "cartid": cartid,
        "p_desc": pDesc,
        "p_image": pImage,
        "unitprice": unitprice,
        "pid": pid,
        "cid": cid,
        "vid":vid,
        "qty":qty,
      };
}

Future<List<CartItems>> cartitemdetails(int id) async {
  var httprequest = GetConnect();
  var response = await httprequest.get('${global.url}/viewCartItem?cid=$id');
  var res = cartItemsFromJson(response.bodyString!);
  return res;
}


Future<void> UpdateCartQty(var pid, var cid, String btn) async {
  var httprequest=GetConnect();
  var response =
  await httprequest.post("${global.url}/updateItemsQty?pid=${int.parse(pid)}&cid=${int.parse(cid)}&buttonpressed=$btn",{});
  if (response.statusCode == 200) {
    //Get.snackbar("Message", response.body);
  } else {
    Get.snackbar("Message", response.body);
  }
}
