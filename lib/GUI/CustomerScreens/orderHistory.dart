// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_builders/GUI/globalApi.dart' as global;
import 'package:the_builders/Global/global.dart';
import 'package:the_builders/API/CustomerApis/OrderDetails.dart' as orddetails;
//import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({Key? key}) : super(key: key);
  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {


  Future<List<orddetails.Orders>> historOrderList() async {
    var response = await http.get(Uri.parse(
      "${global.url}/ShowDeliveredOrdersIdAgainstCustomer?cid=$login_user_id",
    ));
    if (response.statusCode == 200) {
      List res = jsonDecode(response.body);
      return res.map((e) => orddetails.Orders.fromJson(e)).toList();
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
          'Orders',
          style: TextStyle(color: Colors.white, fontSize: 38.sp),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(height: 50.h),
          Row(
            children: [
              SizedBox(
                width: 50.w,
              ),
              Text('Order Id ',
                  style: TextStyle(color: Colors.white, fontSize: 22.sp)),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          FutureBuilder<List<orddetails.Orders>>(
            future: historOrderList(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SizedBox(
                  height: 650.h,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                          contentPadding:
                              EdgeInsets.fromLTRB(70.w, 0.h, 30.w, 0.h),
                          leading: Text(snapshot.data![index].oid.toString(),
                              style: TextStyle(
                                  color: Colors.white, fontSize: 22.sp)),
                          trailing: TextButton(
                            onPressed: () {
                              Get.to(const HistoryOrderDetails(),
                                  arguments: [snapshot.data![index].oid]);
                            },
                            child: Text('Show Details',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22.sp,
                                    decoration: TextDecoration.underline)),
                          ));
                    },
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
          ),
        ],
      ),
    );
  }
}

//==========================================================================================


class HistoryOrderDetails extends StatefulWidget {
  const HistoryOrderDetails({Key? key}) : super(key: key);

  @override
  State<HistoryOrderDetails> createState() => _HistoryOrderDetailsState();
}

class _HistoryOrderDetailsState extends State<HistoryOrderDetails> {
  var vid = Get.arguments;

  List<dynamic> OrderItems = List.empty(growable: true);
  List<dynamic> ItemsQty = List.empty(growable: true);
  List<dynamic> ItemsCtg = List.empty(growable: true);

  // double star=0;
  // void submitRating(int oid, int userId, double stars) async {
  //   var httprequest = GetConnect();
  //   var response = await httprequest.post(
  //       "${global.url}/submitRating?oid=$oid&cid=$userId&stars=$stars",
  //       {});
  //   if (response.statusCode == 200) {
  //     Get.snackbar("Message", response.body);
  //   } else {
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
        body: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 20.h,
              ),
              FutureBuilder<List<orddetails.CustomerOrderDetail>>(
                future: orddetails.getOrdersDetails(vid[0]),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<orddetails.CustomerOrderDetail> Order =
                        snapshot.data as List<orddetails.CustomerOrderDetail>;
                    if (OrderItems.isEmpty) {
                      for (var i in Order) {
                        OrderItems.add(i.productname);
                        //OrderItems.add(i.pQty);
                      }
                    }
                    if (ItemsQty.isEmpty) {
                      for (var i in Order) {
                        ItemsQty.add(i.pqty);
                        //OrderItems.add(i.pQty);
                      }
                    }
                    if (ItemsCtg.isEmpty) {
                      for (var i in Order) {
                        ItemsCtg.add(i.productctg);
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
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              ">${OrderItems[index].toString()} : ",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 22.sp),
                                            ),
                                            //SizedBox(width: 10.w,),
                                            Text(
                                              "${ItemsQty[index].toString()} ",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 22.sp),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "${ItemsCtg[index].toString()} ",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16.sp),
                                        ),
                                        const Divider(
                                          height: 2,
                                          color: Colors.white,
                                        )
                                      ],
                                    ),
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
                                          color: Colors.white, fontSize: 22.sp),
                                    ),
                                    SizedBox(
                                      width: 75.w,
                                    ),
                                    Text(
                                      vid[0].toString(),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 22.sp),
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
                                      'Seller Name :',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 22.sp),
                                    ),
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                    SizedBox(
                                      width: 218.w,
                                      child: Text(
                                        snapshot.data![index].vendorname
                                            .toString(),
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
                                      'Order Date :',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 22.sp),
                                    ),
                                    SizedBox(
                                      width: 30.w,
                                    ),
                                    SizedBox(
                                      width: 190.w,
                                      child: Text(
                                        "${snapshot.data![index].orderdate?.day.toString()}/${snapshot.data![index].orderdate?.month.toString()}/${snapshot.data![index].orderdate?.year.toString()}",
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
                                          color: Colors.white, fontSize: 22.sp),
                                    ),
                                    SizedBox(
                                      width: 22.w,
                                    ),
                                    Text(
                                      overflow: TextOverflow.fade,
                                      "${snapshot.data![index].deliverytime?.day.toString()}/${snapshot.data![index].deliverytime?.month.toString()}/${snapshot.data![index].deliverytime?.year.toString()}",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 22.sp),
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
                                          color: Colors.white, fontSize: 22.sp),
                                    ),
                                    SizedBox(
                                      width: 25.w,
                                    ),
                                    Text(
                                      snapshot.data![index].orderstatus
                                          .toString(),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 22.sp),
                                    ),
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
                height: 70.h,
              ),
              // TextButton.icon(
              //   icon: const Icon(Icons.star_border_purple500,
              //       color: Colors.greenAccent),
              //   onPressed: () {
              //     Get.defaultDialog(buttonColor:  Colors.pink,
              //         title:"Rate Us",titleStyle: TextStyle(color: Colors.pink, fontSize: 22.sp),
              //         content: Column(
              //           children: [
              //             RatingBar(
              //               initialRating: 3,
              //               direction: Axis.horizontal,
              //               allowHalfRating: true,
              //               itemCount: 5,
              //               ratingWidget: RatingWidget(
              //                 full: const Icon(
              //                   Icons.star,
              //                   color: Colors.yellow,
              //                 ),
              //                 half: const Icon(Icons.star_half,
              //                     color: Colors.yellow),
              //                 empty: const Icon(Icons.star_border_outlined),
              //               ),
              //               itemPadding:
              //                   const EdgeInsets.symmetric(horizontal: 4.0),
              //               // onRatingUpdate: (rating) {
              //               //   star=rating;
              //               //   print(star);
              //               // },
              //             ),
              //             SizedBox(height: 30.h,),
              //             ElevatedButton(onPressed: (){
              //               // submitRating(vid[0],int.parse(login_user_id!),star);
              //               Get.back();
              //             }, child: Text("Thank You"),
              //               style: ElevatedButton.styleFrom(
              //                 shape: RoundedRectangleBorder(
              //                     borderRadius: BorderRadius.circular(32)),
              //                 backgroundColor:  Colors.pink,
              //                 //maximumSize: Size(100.w, 40.h),
              //                 //padding: const EdgeInsets.all(20),
              //               ),
              //
              //             )
              //           ],
              //         ),
              //
              //     );
              //   },
              //   label: Text(
              //     "Rate Us",
              //     style: TextStyle(
              //         color: Colors.greenAccent,
              //         fontSize: 28.sp,
              //         decoration: TextDecoration.underline),
              //   ),
              // )
            ],
          ),
        ));
  }
}
