import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_builders/GUI/globalApi.dart' as global;
import 'package:the_builders/Global/global.dart';
import 'package:the_builders/API/CustomerApis/OrderDetails.dart' as orddetails;


class CustomerOrders extends StatefulWidget {
  const CustomerOrders({Key? key}) : super(key: key);

  @override
  State<CustomerOrders> createState() => _CustomerOrdersState();
}

class _CustomerOrdersState extends State<CustomerOrders> {

  Future<List<orddetails.Orders>> customerOrdersList() async {
    var response = await http.get(Uri.parse(
      "${global.url}/ShowOrdersAgainstCustomer?cid=$login_user_id",
    ));
    //print(response.statusCode);
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
            SizedBox(
              height: 150.h,
              child: Center(
                  child: Text('Pending',
                      style: TextStyle(color: Colors.white, fontSize: 38.sp))),
            ),
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
              future: customerOrdersList(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                          contentPadding:
                          EdgeInsets.fromLTRB(70.w, 0.h, 30.w, 0.h),
                          leading: Text(snapshot.data![index].soid.toString(),
                              style: TextStyle(
                                  color: Colors.white, fontSize: 22.sp)),
                          trailing: TextButton(
                            onPressed: () {
                              Get.to(const CustomerOrderDetails(),
                                  arguments: [snapshot.data![index].soid]);
                            },
                            child: Text('Show Details',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22.sp,
                                    decoration: TextDecoration.underline)),
                          ));
                    },
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

class CustomerOrderDetails extends StatefulWidget {
  const CustomerOrderDetails({Key? key}) : super(key: key);

  @override
  State<CustomerOrderDetails> createState() => _CustomerOrderDetailsState();
}

class _CustomerOrderDetailsState extends State<CustomerOrderDetails> {
  var vid = Get.arguments;

  List<dynamic> OrderItems = List.empty(growable: true);
  List<dynamic> ItemsQty = List.empty(growable: true);
  List<dynamic> ItemsCtg = List.empty(growable: true);



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
              FutureBuilder<List<orddetails.CustomerOrderDetails>>(
                future: orddetails.getOrdersDetail(vid[0]),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<orddetails.CustomerOrderDetails> Order =
                    snapshot.data as List<orddetails.CustomerOrderDetails>;
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
                                return ListTile(
                                  contentPadding:
                                  const EdgeInsets.fromLTRB(20, 0, 40, 0),
                                  leading: Text(
                                    ">${OrderItems[index].toString()} : ${ItemsCtg[index].toString()}",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22.sp),
                                  ),
                                  trailing: Text(
                                    ItemsQty[index].toString(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22.sp),
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
                                      vid[0].toString(),
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
                                      'Seller Name :',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22.sp),
                                    ),
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                    Text(
                                     overflow:TextOverflow.ellipsis,
                                      maxLines: 1,
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
                                      width: 30.w,
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
                                      'Expected Delivery Time :',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22.sp),
                                    ),
                                    SizedBox(
                                      width: 22.w,
                                    ),

                                    Text(overflow:TextOverflow.fade,

                                      "${snapshot.data![index].deliveryTime.day.toString()}/${snapshot.data![index].deliveryTime.month.toString()}/${snapshot.data![index].deliveryTime.year.toString()}",
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
                                      'Order Status :',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22.sp),
                                    ),
                                    SizedBox(
                                      width: 25.w,
                                    ),
                                    Text(
                                      snapshot.data![index].status.toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22.sp),
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
            ],
          ),
        ));
  }
}
