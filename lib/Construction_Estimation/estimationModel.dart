import 'dart:convert';

List<estimatematerial> estimatematerialFromJson(String str) =>
    List<estimatematerial>.from(json.decode(str).map((x) => estimatematerial.fromJson(x)));

String estimatematerialToJson(List<estimatematerial> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class estimatematerial {
  estimatematerial({
    this.schemename,
    this.pDesc,
    required this.qty,

    // "vid": 1,
    // "qty": 12

  });
var schemename;

  String? pDesc;

  var qty;

  factory estimatematerial.fromJson(Map<String, dynamic> json) => estimatematerial(

    pDesc: json["p_desc"],

    qty:json["qty"],
  );

  Map<String, dynamic> toJson() => {

    "p_desc": pDesc,
    "qty":qty,
  };
}
