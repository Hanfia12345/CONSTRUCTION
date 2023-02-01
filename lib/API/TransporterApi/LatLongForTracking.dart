
// ignore_for_file: file_names

import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:the_builders/GUI/globalApi.dart' as global;
import 'package:get/get.dart';
import 'package:the_builders/API/CustomerApis/LatLongListforDistance.dart';


List<LatLongForTracking> latLongForTrackingFromJson(String str) => List<LatLongForTracking>.from(json.decode(str).map((x) => LatLongForTracking.fromJson(x)));

String latLongForTrackingToJson(List<LatLongForTracking> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LatLongForTracking {
  LatLongForTracking({
   required this.customername,
    required this.customerlat,
    required this.customerlong,
   required this.vendorname,
    required this.vendorlat,
   required this.vendorlong,
    this.distance=0.0,
  });

  String customername;
  double customerlat;
  double customerlong;
  String vendorname;
  double vendorlat;
  double vendorlong;
double? distance;

  factory LatLongForTracking.fromJson(Map<String, dynamic> json) => LatLongForTracking(
    customername: json["customername"],
    customerlat: json["customerlat"]?.toDouble(),
    customerlong: json["customerlong"]?.toDouble(),
    vendorname: json["vendorname"],
    vendorlat: json["vendorlat"]?.toDouble(),
    vendorlong: json["vendorlong"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "customername": customername,
    "customerlat": customerlat,
    "customerlong": customerlong,
    "vendorname": vendorname,
    "vendorlat": vendorlat,
    "vendorlong": vendorlong,
  };
}


//List<LatLongListForDistance> llList =List.empty(growable: true);
List<LatLng> latlngList=List.empty(growable: true);

Future<List<LatLongListForDistance>> latlongforTracking(int oid) async {
  var httprequest = GetConnect();
  var response =
  await httprequest.get("${global.url}/LatLongForTracking?oid=$oid");

  if (response.statusCode == 200) {
    var res = latLongForTrackingFromJson(response.bodyString!);

    List<LatLongListForDistance> l =List.empty(growable: true);

    for (var b in res) {
      b.distance =Geolocator.distanceBetween(
          b.customerlat , b.customerlong,
          b.vendorlat, b.vendorlong);
      b.distance=b.distance!/1000;
      l.add(LatLongListForDistance(lat: b.vendorlat, long: b.vendorlong,distance:b.distance!));
    }
     l.sort((a,b)=> b.distance.compareTo(a.distance));
    l.add(LatLongListForDistance(lat: res[0].customerlat, long:res[0].customerlong));
    //l.insert(0,LatLongListForDistance(lat: g.lat!, long:g.long! ));
    // for(var element in l) {
    //   print(element.lat);
    //   print(element.long);
    // };

      latlngList = l.map((ll) => LatLng(ll.lat, ll.long)).toList();

    //if(latlngList.isEmpty){latlngList = llList.map((ll) => LatLng(ll.lat, ll.long)).toList();}

    // for(var i in llList){
    //   print(i.lat);
    //   print(i.long);
    // }



    return l;
    // if(latlongfortracking.isEmpty){
    //   res.forEach((element) {
    //     latlongfortracking.add(LatLongForTracking(vendorlat: element.vendorlat, vendorlong: element.vendorlong));
    //   });
    //
    // }


    // latlongfortracking.forEach((element) {
    //   print(element.lat);
    //   print(element.long);
    // });
    // print(latlongfortracking);
    //latlongfordeliveryboy.add(LatLongListForDistance(lat: double.parse(res['lat']), long: res['lat'],distance: 0 ));


  } else {
    throw Exception('Failed to load data');
  }
}

