// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:the_builders/GUI/VendorScreens/ShowOrders.dart';
import 'package:the_builders/GUI/globalApi.dart' as global;

List<Orderdetailss> orderdetailssFromJson(String str) =>
    List<Orderdetailss>.from(
        json.decode(str).map((x) => Orderdetailss.fromJson(x)));

String orderdetailssToJson(List<Orderdetailss> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Orderdetailss {
  Orderdetailss({
    this.name,
    this.pDesc,
    this.pQty,
    this.pCtg,
    required this.oDate,
    required this.deliveryTime,
    this.O_status,
  });

  String? name;
  String? pDesc;
  String? pCtg;
  int? pQty;
  DateTime oDate;
  DateTime deliveryTime;
  String? O_status;

  factory Orderdetailss.fromJson(Map<String, dynamic> json) => Orderdetailss(
        name: json["name"],
        pDesc: json["p_desc"],
        pCtg: json["p_ctg"],
        pQty: json["p_qty"],
        oDate: DateTime.parse(json["O_date"]),
        deliveryTime: DateTime.parse(json["Delivery_time"]),
        O_status:json["O_status"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "p_desc": pDesc,
        "p_ctg" :pCtg,
        "p_qty": pQty,
        "O_date": oDate.toIso8601String(),
        "Delivery_time": deliveryTime.toIso8601String(),
        "O_status":O_status,
      };
}

class PendingOrderDetails extends StatefulWidget {
  const PendingOrderDetails({Key? key}) : super(key: key);

  @override
  State<PendingOrderDetails> createState() => _PendingOrderDetailsState();
}

class _PendingOrderDetailsState extends State<PendingOrderDetails> {
  var vid = Get.arguments;

  List<dynamic> OrderItems = List.empty(growable: true);
  List<dynamic> ItemsQty = List.empty(growable: true);
  List<dynamic> ItemsCtg = List.empty(growable: true);
  //var OrderItems = [];
  // var a = OrderItems.toSet().toList();
  //var ditinct =OrderItems.toSet;
  Future<List<Orderdetailss>> GetOrdersDetail() async {
    var httprequest = GetConnect();
    var response =
        await httprequest.get("${global.url}/orderdetails?oid=${vid[1]}");
    //print(vid[1]);
    //print(response.body);
    //print(response.statusCode);
    if (response.statusCode == 200) {
      var res = orderdetailssFromJson(response.bodyString!);
      //List res = jsonDecode(response.bodyString!);
      //return res.map((e) => OrderDetailss.fromJson(e)).toList();
      //var name =jsonDecode (res) as Map<String,dynamic>;
      //var namee=jsonDecode(name) as Map<String,dynamic>;
      //print(name);
      return res;
    } else {
      throw Exception('Failed to load data');
    }
  }

  // String DropdownValue = 'In Progress';
  // var items = ['In Progress', 'Delivered'];


  // void UpdateStatus() async {
  //   print(DropdownValue);
  //   var httprequest = GetConnect();
  //   var response = await httprequest.post(
  //     "${global.url}/updateOrderStatus?oid=${vid[1]}&status=$DropdownValue",{}
  //   );
  //
  //   if (response.statusCode == 200) {
  //     Get.snackbar("Message", response.body);
  //   } else {
  //     print(response.statusCode);
  //     Get.snackbar("Message", response.body);
  //   }
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 255, 81, 0),
          title: Text(
            'Order Details',
            style: TextStyle(color: Colors.white, fontSize: 38.sp),
          ),
        ),
        body: ListView(
          children: [
            Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                FutureBuilder<List<Orderdetailss>>(
                  future: GetOrdersDetail(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Orderdetailss> Order =
                          snapshot.data as List<Orderdetailss>;
                      if (OrderItems.isEmpty) {
                        for (var i in Order) {
                          OrderItems.add(i.pDesc);
                          //OrderItems.add(i.pQty);
                        }
                      }
                      if (ItemsQty.isEmpty) {
                        for (var i in Order) {
                          ItemsQty.add(i.pQty);
                          //OrderItems.add(i.pQty);
                        }
                      }
                      if (ItemsCtg.isEmpty) {
                        for (var i in Order) {
                          ItemsCtg.add(i.pCtg);
                          //OrderItems.add(i.pQty);
                        }
                      }
                    //print(snapshot.data);

                    //print(snapshot.data![0].name.toString());
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Ordered Items & Quantity',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 25.sp)),
                          SizedBox(
                            height: 20.h,
                          ),
                          SizedBox(
                            height: 300.h,
                            child: ListView.builder(
                                itemCount: OrderItems.length,
                                itemBuilder: (context, index) {
                                  return SingleChildScrollView(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                ">${OrderItems[index].toString()} : ",style: TextStyle(
                                                  color: Colors.white, fontSize: 22.sp),),
                                              //SizedBox(width: 10.w,),
                                              Text(
                                                "${ItemsQty[index].toString()} ",style: TextStyle(
                                                  color: Colors.white, fontSize: 22.sp),),


                                            ],
                                          ),

                                          Text(
                                            "${ItemsCtg[index].toString()} "
                                            ,style: TextStyle(
                                              color: Colors.white, fontSize: 16.sp),),
                                          Divider(height: 2,color: Colors.white,)
                                        ],),
                                    ),
                                  );
                                }),
                          ),
                          const Divider(
                            height: 3,
                            color: Colors.white,
                          ),
                          ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            itemCount: 1,
                            itemBuilder: (context, index) {
                              //print(vid[1]);

                              return Column(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 25.w,
                                      ),
                                      Text(
                                        'Order Id :',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22.sp),
                                      ),
                                      SizedBox(
                                        width: 75.w,
                                      ),
                                      Text(
                                        vid[1].toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22.sp),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 25.w,
                                      ),
                                      Text(
                                        'Order By :',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22.sp),
                                      ),
                                      SizedBox(
                                        width: 70.w,
                                      ),
                                      Text(
                                        snapshot.data![index].name.toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22.sp),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 25.w,
                                      ),
                                      Text(
                                        'Order Date :',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22.sp),
                                      ),
                                      SizedBox(
                                        width: 50.w,
                                      ),
                                      SizedBox(
                                        width: 190.w,
                                        child: Text(
                                          "${snapshot.data![index].oDate.day.toString()}/${snapshot.data![index].oDate.month.toString()}/${snapshot.data![index].oDate.year.toString()}",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 22.sp),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 25.w,
                                      ),
                                      Text(
                                        'Delivery Time :',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22.sp),
                                      ),
                                      SizedBox(
                                        width: 22.w,
                                      ),
                                      SizedBox(
                                        width: 190.w,
                                        child: Text(
                                          "${snapshot.data![index].deliveryTime.day.toString()}/${snapshot.data![index].deliveryTime.month.toString()}/${snapshot.data![index].deliveryTime.year.toString()}",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 22.sp),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 25.w,
                                      ),
                                      Text(
                                        'Order Status :',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22.sp),
                                      ),
                                      SizedBox(
                                        width: 25.w,
                                      ),

                                      Text("${snapshot.data![index].O_status}",style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22.sp),),
                                      // DropdownButton(
                                      //     value: DropdownValue,
                                      //     icon: const Icon(
                                      //         Icons.keyboard_arrow_down),
                                      //     items: items.map((String items) {
                                      //       return DropdownMenuItem(
                                      //         value: items,
                                      //         child: Text(
                                      //           items,
                                      //           style: TextStyle(
                                      //               color: Colors.black,
                                      //               fontSize: 22.sp),
                                      //         ),
                                      //       );
                                      //     }).toList(),
                                      //     onChanged: (String? newValue) {
                                      //       setState(() {
                                      //         DropdownValue = newValue!;
                                      //       });
                                      //     })
                                    ],
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return const CircularProgressIndicator();
                  },
                ),
                SizedBox(
                  height: 100.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 210.w),
                  child: ElevatedButton(
                    onPressed: () {
                      // print(vid[1]);
                      // print(DropdownValue);
                      // UpdateStatus();
                      Get.off(const ShowOrders(), arguments: "${vid[0]}");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[400],
                    ),
                    child: Text(
                      'OK',
                      style: TextStyle(
                          fontSize: 22.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}

class DeliveredOrderDetails extends StatefulWidget {
  const DeliveredOrderDetails({Key? key}) : super(key: key);

  @override
  State<DeliveredOrderDetails> createState() => _DeliveredOrderDetailsState();
}

class _DeliveredOrderDetailsState extends State<DeliveredOrderDetails> {
  var vid = Get.arguments;

  List<dynamic> OrderItems = List.empty(growable: true);
  List<dynamic> ItemsQty = List.empty(growable: true);
  List<dynamic> ItemsCtg = List.empty(growable: true);

  Future<List<Orderdetailss>> GetOrdersDetail() async {
    var httprequest = GetConnect();
    var response =
    await httprequest.get("${global.url}/orderdetails?oid=${vid[1]}");
    if (response.statusCode == 200) {
      var res = orderdetailssFromJson(response.bodyString!);
      return res;
    } else {
      throw Exception('Failed to load data');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 255, 81, 0),
          title: Text(
            'Order Details',
            style: TextStyle(color: Colors.white, fontSize: 38.sp),
          ),
        ),
        body: ListView(
          children: [
            Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                FutureBuilder<List<Orderdetailss>>(
                  future: GetOrdersDetail(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Orderdetailss> Order =
                      snapshot.data as List<Orderdetailss>;
                      if (OrderItems.isEmpty) {
                        for (var i in Order) {
                          OrderItems.add(i.pDesc);
                          //OrderItems.add(i.pQty);
                        }
                      }
                      if (ItemsQty.isEmpty) {
                        for (var i in Order) {
                          ItemsQty.add(i.pQty);
                          //OrderItems.add(i.pQty);
                        }
                      }
                      if (ItemsCtg.isEmpty) {
                        for (var i in Order) {
                          ItemsCtg.add(i.pCtg);
                          //OrderItems.add(i.pQty);
                        }
                      }
                      //print(snapshot.data);

                      //print(snapshot.data![0].name.toString());
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Ordered Items & Quantity',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 25.sp)),
                          SizedBox(
                            height: 20.h,
                          ),
                          SizedBox(
                            height: 300.h,
                            child: ListView.builder(
                                itemCount: OrderItems.length,
                                itemBuilder: (context, index) {
                                  return SingleChildScrollView(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                ">${OrderItems[index].toString()} : ",style: TextStyle(
                                                  color: Colors.white, fontSize: 22.sp),),
                                              //SizedBox(width: 10.w,),
                                              Text(
                                                "${ItemsQty[index].toString()} ",style: TextStyle(
                                                  color: Colors.white, fontSize: 22.sp),),


                                            ],
                                          ),

                                          Text(
                                            "${ItemsCtg[index].toString()} "
                                            ,style: TextStyle(
                                              color: Colors.white, fontSize: 16.sp),),
                                          Divider(height: 2,color: Colors.white,)
                                        ],),
                                    ),
                                  );
                                }),
                          ),
                          const Divider(
                            height: 3,
                            color: Colors.white,
                          ),
                          ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            itemCount: 1,
                            itemBuilder: (context, index) {
                              //print(vid[1]);

                              return Column(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 25.w,
                                      ),
                                      Text(
                                        'Order Id :',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22.sp),
                                      ),
                                      SizedBox(
                                        width: 75.w,
                                      ),
                                      Text(
                                        vid[1].toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22.sp),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 25.w,
                                      ),
                                      Text(
                                        'Order By :',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22.sp),
                                      ),
                                      SizedBox(
                                        width: 70.w,
                                      ),
                                      Text(
                                        snapshot.data![index].name.toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22.sp),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 25.w,
                                      ),
                                      Text(
                                        'Order Date :',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22.sp),
                                      ),
                                      SizedBox(
                                        width: 50.w,
                                      ),
                                      SizedBox(
                                        width: 190.w,
                                        child: Text(
                                          "${snapshot.data![index].oDate.day.toString()}/${snapshot.data![index].oDate.month.toString()}/${snapshot.data![index].oDate.year.toString()}",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 22.sp),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 25.w,
                                      ),
                                      Text(
                                        'Delivery Time :',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22.sp),
                                      ),
                                      SizedBox(
                                        width: 22.w,
                                      ),
                                      SizedBox(
                                        width: 190.w,
                                        child: Text(
                                          "${snapshot.data![index].deliveryTime.day.toString()}/${snapshot.data![index].deliveryTime.month.toString()}/${snapshot.data![index].deliveryTime.year.toString()}",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 22.sp),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 25.w,
                                      ),
                                      Text(
                                        'Order Status :',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22.sp),
                                      ),
                                      SizedBox(
                                        width: 25.w,
                                      ),
                                     Text("Delivered",style: TextStyle(
                                         color: Colors.white,
                                         fontSize: 22.sp),)
                                    ],
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return const CircularProgressIndicator();
                  },
                ),
                SizedBox(
                  height: 100.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 210.w),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.off(const ShowOrders(), arguments: "${vid[0]}");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[400],
                    ),
                    child: Text(
                      'OK',
                      style: TextStyle(
                          fontSize: 22.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
