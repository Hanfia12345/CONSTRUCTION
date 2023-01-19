import 'dart:convert';
import 'package:the_builders/GUI/globalApi.dart' as global;
import 'package:get/get.dart';

class Orders {
  int? soid;

  Orders({this.soid});

  Orders.fromJson(Map<String, dynamic> json) {
    soid = json['soid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['soid'] = soid;
    return data;
  }
}





List<CustomerOrderDetails> customerOrderDetailsFromJson(String str) => List<CustomerOrderDetails>.from(json.decode(str).map((x) => CustomerOrderDetails.fromJson(x)));

String customerOrderDetailsToJson(List<CustomerOrderDetails> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CustomerOrderDetails {
  CustomerOrderDetails({
    required this.name,
    required this.pDesc,
    required this.pCtg,
    required this.pQty,
    required this.oDate,
    required this.deliveryTime,
    required this.status,
  });

  String name;
  String pDesc;
  String pCtg;
  int pQty;
  DateTime oDate;
  DateTime deliveryTime;
  String status;

  factory CustomerOrderDetails.fromJson(Map<String, dynamic> json) => CustomerOrderDetails(
    name: json["name"],
    pDesc: json["p_desc"],
    pCtg: json["p_ctg"],
    pQty: json["p_qty"],
    oDate: DateTime.parse(json["O_date"]),
    deliveryTime: DateTime.parse(json["Delivery_time"]),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "p_desc": pDesc,
    "p_ctg": pCtg,
    "p_qty": pQty,
    "O_date": oDate.toIso8601String(),
    "Delivery_time": deliveryTime.toIso8601String(),
    "status": status,
  };
}

Future<List<CustomerOrderDetails>> getOrdersDetail(int oid) async {
  var httprequest = GetConnect();
  var response =
  await httprequest.get("${global.url}/Customerorderdetails?oid=$oid");
  if (response.statusCode == 200) {
    var res = customerOrderDetailsFromJson(response.bodyString!);
    return res;
  } else {
    throw Exception('Failed to load data');
  }
}