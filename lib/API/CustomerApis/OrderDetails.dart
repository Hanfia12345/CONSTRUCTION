// ignore_for_file: file_names, prefer_typing_uninitialized_variables

import 'dart:convert';
import 'package:the_builders/GUI/globalApi.dart' as global;
import 'package:get/get.dart';

class Orders {
  int? oid;

  Orders({this.oid});

  Orders.fromJson(Map<String, dynamic> json) {
    oid = json['oid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['oid'] = oid;
    return data;
  }
}








// To parse this JSON data, do
//
//     final customerOrderDetail = customerOrderDetailFromJson(jsonString);


// To parse this JSON data, do
//
//     final customerOrderDetail = customerOrderDetailFromJson(jsonString);


List<CustomerOrderDetail> customerOrderDetailFromJson(String str) => List<CustomerOrderDetail>.from(json.decode(str).map((x) => CustomerOrderDetail.fromJson(x)));

String customerOrderDetailToJson(List<CustomerOrderDetail> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CustomerOrderDetail {
  CustomerOrderDetail({
    this.customerid,
    this.vendorid,
    this.productid,
    this.productname,
    this.productctg,
    this.pqty,
    this.punit,
    this.orderstatus,
    this.orderdate,
    this.deliverytime,
    this.vendorname,
    this.vendorAddress,
  });

  var customerid;
  var vendorid;
  var productid;
  var productname;
  var productctg;
  var pqty;
  var punit;
  var orderstatus;
  var orderdate;
  var deliverytime;
  var vendorname;
  var vendorAddress;

  factory CustomerOrderDetail.fromJson(Map<String, dynamic> json) => CustomerOrderDetail(
    customerid: json["customerid"],
    vendorid: json["vendorid"],
    productid: json["productid"],
    productname: json["productname"],
    productctg: json["productctg"],
    pqty: json["pqty"],
    punit: json["punit"],
    orderstatus: json["orderstatus"],
    orderdate: DateTime.parse(json["orderdate"]),
    deliverytime: DateTime.parse(json["deliverytime"]),
    vendorname: json["vendorname"],
    vendorAddress: json["vendorAddress"],
  );

  Map<String, dynamic> toJson() => {
    "customerid": customerid,
    "vendorid": vendorid,
    "productid": productid,
    "productname": productname,
    "productctg": productctg,
    "pqty": pqty,
    "punit": punit,
    "orderstatus": orderstatus,
    "orderdate": orderdate.toIso8601String(),
    "deliverytime": deliverytime.toIso8601String(),
    "vendorname": vendorname,
    "vendorAddress": vendorAddress,
  };
}




Future<List<CustomerOrderDetail>> getOrdersDetails(int oid) async {
  var httprequest = GetConnect();
  var response =
  await httprequest.get("${global.url}/CustomersOrderdetails?oid=$oid");
  if (response.statusCode == 200) {
    var res = customerOrderDetailFromJson(response.bodyString!);
    return res;
  } else {

    throw Exception('Failed to load data');
  }
}