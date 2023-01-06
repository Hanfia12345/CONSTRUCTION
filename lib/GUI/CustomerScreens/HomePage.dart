// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:the_builders/GUI/CustomerScreens/Cart.dart';
import 'package:the_builders/GUI/CustomerScreens/Construct.dart';
import 'package:the_builders/GUI/CustomerScreens/ProductDetail.dart';
import 'package:the_builders/GUI/loginpages.dart';
import 'dart:convert';
import 'package:the_builders/GUI/globalApi.dart' as global;
import 'package:the_builders/Global/global.dart';

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

class CustomerHome extends StatefulWidget {
  const CustomerHome({Key? key}) : super(key: key);

  @override
  State<CustomerHome> createState() => _CustomerHomeState();
}

class _CustomerHomeState extends State<CustomerHome> {
  Future<List<ViewAllProducts>> GetAllProducts() async {
    var httprequest = GetConnect();
    httprequest.timeout = const Duration(seconds: 20);
    var response = await httprequest.get("${global.url}/displayProducts");
    //print(response.statusCode);
    if (response.statusCode == 200) {
      var res = viewAllProductsFromJson(response.bodyString!);
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
            'Home',
            style: TextStyle(color: Colors.white, fontSize: 38.sp),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Get.to(const AddToCart());
              },
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 110, 43)),
                child: Text(
                  'My Profile',
                  style: TextStyle(color: Colors.white, fontSize: 28.sp),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.home,
                  color: const Color.fromARGB(255, 255, 81, 0),
                  size: 33.r,
                ),
                title: Text(
                  'Home',
                  style: TextStyle(
                      color: const Color.fromARGB(255, 255, 81, 0),
                      fontSize: 22.sp),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CustomerHome()));
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.construction,
                  color: const Color.fromARGB(255, 255, 81, 0),
                  size: 33.r,
                ),
                title: Text(
                  'Construct',
                  style: TextStyle(
                      color: const Color.fromARGB(255, 255, 81, 0),
                      fontSize: 22.sp),
                ),
                onTap: () {
                  Get.to(const Estimate());
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => Estimate()));
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.logout,
                  color: const Color.fromARGB(255, 255, 81, 0),
                  size: 33.r,
                ),
                title: Text(
                  'Logout',
                  style: TextStyle(
                      color: const Color.fromARGB(255, 255, 81, 0),
                      fontSize: 22.sp),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const login()));
                },
              ),
            ],
          ),
        ),
        body: Center(
          child: FutureBuilder<List<ViewAllProducts>>(
            future: GetAllProducts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                    itemCount: snapshot.data!.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 0.9,
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Customer_product_id =
                              snapshot.data![index].pid.toString();
                          //print(Customer_product_id);
                          Get.to(const ProductDetail(),
                              arguments: snapshot.data![index].pid);
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 5,
                                child: Container(
                                  width: 180.w,
                                  height: 140.h,
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
                                child: Text(
                                  snapshot.data![index].pDesc.toString(),
                                  style: TextStyle(
                                      fontSize: 20.sp, color: Colors.black),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  snapshot.data![index].name.toString(),
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20.sp),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Row(
                                  children: [
                                    Text(
                                      'Rs. ',
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 255, 81, 0),
                                          fontSize: 20.sp),
                                    ),
                                    Text(
                                      snapshot.data![index].unitcost.toString(),
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 255, 81, 0),
                                          fontSize: 20.sp),
                                    ),
                                  ],
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
        )

        // ListView(
        //     Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        //       GestureDetector(
        //         onTap: () {
        //           Navigator.push(
        //               context,
        //               MaterialPageRoute(
        //                   builder: (context) =>
        //                       const ProductFromDifferentVendors()));
        //         },
        //         child: Container(
        //           decoration: const BoxDecoration(
        //             color: Colors.white,
        //             borderRadius: BorderRadius.all(Radius.circular(10)),
        //           ),
        //           child: Column(
        //             children: [
        //               Container(
        //                 width: 180.w,
        //                 height: 140.h,
        //                 decoration: const BoxDecoration(
        //                     borderRadius: BorderRadius.all(Radius.circular(10)),
        //                     image: DecorationImage(
        //                       image: AssetImage(
        //                         'assets/steel.png',
        //                       ),
        //                       fit: BoxFit.cover,
        //                     )),
        //               ),
        //               Center(
        //                   child: Text(
        //                 'Steel',
        //                 style: TextStyle(fontSize: 22.sp, color: Colors.black),
        //               ))
        //             ],
        //           ),
        //         ),
        //       ),
        //       GestureDetector(
        //         onTap: () {
        //           Navigator.push(
        //               context,
        //               MaterialPageRoute(
        //                   builder: (context) =>
        //                       const ProductFromDifferentVendors()));
        //         },
        //         child: Container(
        //           decoration: const BoxDecoration(
        //             color: Colors.white,
        //             borderRadius: BorderRadius.all(Radius.circular(10)),
        //           ),
        //           child: Column(
        //             children: [
        //               Container(
        //                 width: 180.w,
        //                 height: 140.h,
        //                 decoration: const BoxDecoration(
        //                     borderRadius: BorderRadius.all(Radius.circular(10)),
        //                     image: DecorationImage(
        //                       image: AssetImage(
        //                         'assets/crush.png',
        //                       ),
        //                       fit: BoxFit.cover,
        //                     )),
        //               ),
        //               Center(
        //                   child: Text(
        //                 'Crushed Stone',
        //                 style: TextStyle(fontSize: 22.sp, color: Colors.black),
        //               ))
        //             ],
        //           ),
        //         ),
        //       ),
        //     ]),
        //
        //   ],
        // ),
        );
  }
}

// GestureDetector(
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Material(
//                               elevation: 3.0,
//                               child: Image.network(
//                                 pImagesUrl +
//                                     snapshot.data![index].pImage.toString(),
//                                 fit: BoxFit.cover,
//                                 height: 130,
//                                 width: 160,
//                               ),
//                             ),
//                             Expanded(
//                               flex: 1,
//                               child: Container(
//                                 alignment: Alignment.center,
//                                 padding: const EdgeInsets.all(5),
//                                 child: Text(
//                                     snapshot.data![index].pDesc.toString(),
//                                     style: TextStyle(
//                                         fontSize: 18.sp, color: Colors.white)),
//                               ),
//                             ),
//                           ],
//                         ),
//                         onTap: () {
//                           Get.to(() => const ProductDetail(),
//                               arguments: ["${snapshot.data![index].pid}"]);
//                         },
//                       );
