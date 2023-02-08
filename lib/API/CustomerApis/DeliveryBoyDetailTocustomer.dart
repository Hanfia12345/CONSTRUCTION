import 'dart:convert';

List<DeliveryBoyDetailToCustomer> deliveryBoyDetailToCustomerFromJson(String str) => List<DeliveryBoyDetailToCustomer>.from(json.decode(str).map((x) => DeliveryBoyDetailToCustomer.fromJson(x)));

String deliveryBoyDetailToCustomerToJson(List<DeliveryBoyDetailToCustomer> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DeliveryBoyDetailToCustomer {
  DeliveryBoyDetailToCustomer({
    this.lat,
    this.long,
    this.name,
    this.phoneno,
    this.tNo,
  });

  var lat;
  var long;
  var name;
  var phoneno;
  var tNo;

  factory DeliveryBoyDetailToCustomer.fromJson(Map<String, dynamic> json) => DeliveryBoyDetailToCustomer(
    lat: json["lat"].toDouble(),
    long: json["long"].toDouble(),
    name: json["name"],
    phoneno: json["phoneno"],
    tNo: json["t_no"],
  );

  Map<String, dynamic> toJson() => {
    "lat": lat,
    "long": long,
    "name": name,
    "phoneno": phoneno,
    "t_no": tNo,
  };
}
