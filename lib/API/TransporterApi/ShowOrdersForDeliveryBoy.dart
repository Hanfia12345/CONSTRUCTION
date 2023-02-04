// To parse this JSON data, do
//
//     final ordersForDeliveryBoy = ordersForDeliveryBoyFromJson(jsonString);

import 'dart:convert';
import 'package:the_builders/API/CustomerApis/LatLongListforDistance.dart';
import 'package:the_builders/GUI/globalApi.dart' as global;
import 'package:get/get.dart';
import 'package:the_builders/Global/global.dart';


List<OrdersForDelivery> ordersForDeliveryFromJson(String str) => List<OrdersForDelivery>.from(json.decode(str).map((x) => OrdersForDelivery.fromJson(x)));

String ordersForDeliveryToJson(List<OrdersForDelivery> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrdersForDelivery {
  OrdersForDelivery({
    required this.oid,
  });

  int oid;

  factory OrdersForDelivery.fromJson(Map<String, dynamic> json) => OrdersForDelivery(
    oid: json["oid"],
  );

  Map<String, dynamic> toJson() => {
    "oid": oid,
  };
}


Future<List<OrdersForDelivery>> ordersForDelivery() async {
  var httprequest = GetConnect();
  print(login_user_id);
  var response =
  await httprequest.get("${global.url}/ShowOrdersIdToDeliveryBoy?dbid=${int.parse(login_user_id!)}");
  if (response.statusCode == 200) {
    var res = ordersForDeliveryFromJson(response.bodyString!);
    print(response.bodyString);
    return res;
  } else {
    throw Exception('Failed to load data');
  }
}









List<OrderDetailsForDelivery> orderDetailsForDeliveryFromJson(String str) => List<OrderDetailsForDelivery>.from(json.decode(str).map((x) => OrderDetailsForDelivery.fromJson(x)));

String orderDetailsForDeliveryToJson(List<OrderDetailsForDelivery> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderDetailsForDelivery {
  OrderDetailsForDelivery({
    required this.customerid,
    required this.customername,
    required this.customerlat,
    required this.customerlong,
    required this.customerAddress,
    required this.customernumber,
    required this.vendorid,
    required this.productid,
    required this.productname,
    required this.pqty,
    required this.vendorlat,
    required this.vendorlong,
    required this.vendorAddress,
    required this.punit,
  });

  int customerid;
  String customername;
  double customerlat;
  double customerlong;
  String customerAddress;
  String customernumber;
  int vendorid;
  int productid;
  String productname;
  int pqty;
  double vendorlat;
  double vendorlong;
  String vendorAddress;
  String punit;

  factory OrderDetailsForDelivery.fromJson(Map<String, dynamic> json) => OrderDetailsForDelivery(
    customerid: json["customerid"],
    customername: json["customername"],
    customerlat: json["customerlat"]?.toDouble(),
    customerlong: json["customerlong"]?.toDouble(),
    customerAddress:json["customerAddress"],
    customernumber:json["customernumber"],
    vendorid: json["vendorid"],
    productid: json["productid"],
    productname:json["productname"],
    pqty: json["pqty"],
    vendorlat: json["vendorlat"]?.toDouble(),
    vendorlong: json["vendorlong"]?.toDouble(),
    vendorAddress:json["vendorAddress"],
    punit:json["punit"],
  );

  Map<String, dynamic> toJson() => {
    "customerid": customerid,
    "customername": customername,
    "customerlat": customerlat,
    "customerlong": customerlong,
    "customerAddress": customerAddress,
    "customernumber":customernumber,
    "vendorid": vendorid,
    "productid": productid,
    "productname":productname,
    "pqty": pqty,
    "vendorlat": vendorlat,
    "vendorlong": vendorlong,
    "vendorAddress":vendorAddress,
    "punit": punit,
  };
}



List<LatLongListForDistance> latlongfordeliveryboy=[];


Future<List<OrderDetailsForDelivery>> ordersDetailsDeliveryBoy(int oid) async {
  var httprequest = GetConnect();
  print(login_user_id);
  var response =
  await httprequest.get("${global.url}/ShowOrderDetailsToDeliveryBoy?oid=$oid");
  if (response.statusCode == 200) {
    var res = orderDetailsForDeliveryFromJson(response.bodyString!);
    if(latlongfordeliveryboy.isEmpty){
      res.forEach((element) {
        latlongfordeliveryboy.add(LatLongListForDistance(lat: element.vendorlat, long: element.vendorlong));
      });
    }

    latlongfordeliveryboy.forEach((element) {
      print(element.lat);
      print(element.long);
    });
    print(latlongfordeliveryboy);
    //latlongfordeliveryboy.add(LatLongListForDistance(lat: double.parse(res['lat']), long: res['lat'],distance: 0 ));
    return res;
  } else {
    throw Exception('Failed to load data');
  }
}




