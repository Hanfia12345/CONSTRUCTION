// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:the_builders/GUI/VendorScreens/ProductDetails.dart';
import 'dart:convert';
import 'package:the_builders/GUI/globalApi.dart' as global;
import 'package:the_builders/Global/global.dart';

// To parse this JSON data, do
//
//     final vendorProductss = vendorProductssFromJson(jsonString);

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

class ViewProducts extends StatefulWidget {
  const ViewProducts({Key? key}) : super(key: key);

  @override
  State<ViewProducts> createState() => _ViewProductsState();
}

class _ViewProductsState extends State<ViewProducts> {
  var vid = Get.arguments;

  //var pid;

  Future<List<VendorProductss>> GetVendorProducts() async {
    var httprequest = GetConnect();
    httprequest.timeout = const Duration(seconds: 20);
    var response = await httprequest
        .get("${global.url}/displayVendorProducts?id=${vid[0]}");
    if (response.statusCode == 200) {
      var res = vendorProductssFromJson(response.bodyString!);
      return res;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orangeAccent[200],
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 255, 81, 0),
          title: Text(
            'All Products',
            style: TextStyle(color: Colors.white, fontSize: 38.sp),
          ),
        ),
        body: Center(
          child: FutureBuilder<List<VendorProductss>>(
            future: GetVendorProducts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                    itemCount: snapshot.data!.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1,
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          vendor_product_id =
                              snapshot.data![index].pid.toString();
                          Get.to(
                            () => const ProductDetails(),
                            arguments: vendor_product_id,
                          );
                          //print(snapshot.data![index].pImage);
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                flex: 4,
                                child: Container(
                                  width: 180.w,
                                  height: 180.h,
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      //border: Border.all(width: 1.w),
                                      image: DecorationImage(
                                        image: NetworkImage(global.pImagesUrl +
                                            snapshot.data![index].pImage
                                                .toString()),
                                        fit: BoxFit.cover,
                                      )),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Center(
                                  child: Text(
                                    snapshot.data![index].pDesc.toString(),
                                    style: TextStyle(
                                        fontSize: 20.sp, color: Colors.black),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ));
  }
}
