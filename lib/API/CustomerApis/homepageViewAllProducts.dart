import 'package:get/get_connect/connect.dart';
import 'package:the_builders/GUI/globalApi.dart' as global;
import 'dart:convert';

List<ViewAllProducts> viewAllProductsFromJson(String str) =>
    List<ViewAllProducts>.from(
        json.decode(str).map((x) => ViewAllProducts.fromJson(x)));

String viewAllProductsToJson(List<ViewAllProducts> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ViewAllProducts {
  ViewAllProducts({
    this.pid,
    this.pDesc,
    this.pCtg,
    this.pUnit,
    this.pImage,
    this.unitcost,
    this.name,
    this.id,
  });

  int? pid;
  String? pDesc;
  String? pCtg;
  String? pUnit;
  String? pImage;
  int? unitcost;
  String? name;
  int? id;

  factory ViewAllProducts.fromJson(Map<String, dynamic> json) =>
      ViewAllProducts(
        pid: json["pid"],
        pDesc: json["p_desc"],
        pCtg: json["p_ctg"],
        pUnit: json["p_unit"],
        pImage: json["P_image"],
        unitcost: json["unitcost"],
        name: json["name"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
    "pid": pid,
    "p_desc": pDesc,
    "p_ctg": pCtg,
    "p_unit": pUnit,
    "P_image": pImage,
    "unitcost": unitcost,
    "name": name,
    "id": id,
  };
}

Future<List<ViewAllProducts>> GetAllProducts({String? query}) async {
  var httprequest = GetConnect();
  httprequest.timeout = const Duration(seconds: 20);
  var response = await httprequest.get("${global.url}/displayProducts");
  //print(response.statusCode);
  if (response.statusCode == 200) {
    var res = viewAllProductsFromJson(response.bodyString!);
    if (query!= null){
      res = res.where((element) => element.pDesc!.toLowerCase().contains((query.toLowerCase())) ||
          element.pCtg!.toLowerCase().contains((query.toLowerCase()))).toList();
    }
    return res;
  } else {
    throw Exception('Failed to load data');
  }
}