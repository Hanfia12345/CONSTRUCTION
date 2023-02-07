import 'dart:async';
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
      "${global.url}/ShowOrdersIdAgainstCustomer?cid=$login_user_id",
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
                              Get.to(const CustomerOrderDetails(),
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

class CustomerOrderDetails extends StatefulWidget {
  const CustomerOrderDetails({Key? key}) : super(key: key);

  @override
  State<CustomerOrderDetails> createState() => _CustomerOrderDetailsState();
}

class _CustomerOrderDetailsState extends State<CustomerOrderDetails> {
  var vid = Get.arguments;
  bool deliveryboy=false;
  //bool rating=false;
  //var status;

  List<dynamic> OrderItems = List.empty(growable: true);
  List<dynamic> ItemsQty = List.empty(growable: true);
  List<dynamic> ItemsCtg = List.empty(growable: true);
  List<dynamic> VendorName = List.empty(growable: true);

  // void getOrdersDetails() async {
  //   var httprequest = GetConnect();
  //   var response =
  //   await httprequest.get("${global.url}/CustomersOrderdetails?oid=${vid[0]}");
  //   if (response.statusCode == 200) {
  //     var stts=jsonDecode(response.bodyString!);
  //     Map<String,dynamic> sttts=stts[0];
  //     var orderstatus=sttts['orderstatus'];
  //     if(orderstatus=="On The Way"){
  //       deliveryboy=true;
  //       }
  //     if(orderstatus=="Delivered"){
  //       rating=true;
  //     }
  //
  //
  //   }
  // }
  // void startTimer() {
  //   Timer.periodic(const Duration(minutes: 1), (timer) {
  //    setState(() {
  //      getOrdersDetails();
  //    });
  //   });
  // }

  @override
  void initState() {
    // TODO: implement initState

   // startTimer();
    super.initState();
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
                    if (VendorName.isEmpty) {
                      for (var i in Order) {
                        VendorName.add(i.vendorname);
                        //OrderItems.add(i.pQty);
                      }
                    }
                    //print(snapshot.data);

                    //print(snapshot.data![0].name.toString());
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        ListView.builder(

                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            //print(vid[1]);
                           // status=snapshot.data![index].orderstatus
                               // .toString();
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
                                Container(
                                  height: 80.h,
                                  child: ListView.builder(
                                    itemCount: VendorName.length,
                                    itemBuilder: (BuildContext context, index) {
                                      return Row(
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
                                          SizedBox(
                                            width: 218.w,
                                            child: Text(
                                              //overflow:TextOverflow.ellipsis,
                                              // maxLines: 1,
                                              snapshot.data![index].vendorname
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 22.sp),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
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
                                        "${snapshot.data![index].orderdate.day.toString()}/${snapshot.data![index].orderdate.month.toString()}/${snapshot.data![index].orderdate.year.toString()}",
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
                                          color: Colors.white, fontSize: 22.sp),
                                    ),
                                    SizedBox(
                                      width: 22.w,
                                    ),
                                    Text(
                                      overflow: TextOverflow.fade,
                                      "${snapshot.data![index].deliverytime.day.toString()}/${snapshot.data![index].deliverytime.month.toString()}/${snapshot.data![index].deliverytime.year.toString()}",
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
                        const Divider(
                          height: 3,
                          color: Colors.white,
                        ),

                        Center(
                          child: Text(' Ordered Items & Quantity',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 25.sp)),
                        ),
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
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return const CircularProgressIndicator();
                },
              ),

              Visibility(visible: deliveryboy,
                child: Column(children: [
                  Text("Name    :"),
                  Text("Vehicle :")
                ],),
              ),
              Visibility(
                //visible: rating,
                child: Column(children: [
                  //Text("Rate this Order:"),
                 // Text("Status : $status"),

                // RatingBar.builder(
                //   initialRating: 3,
                //   minRating: 1,
                //   direction: Axis.horizontal,
                //   allowHalfRating: true,
                //   itemCount: 5,
                //   itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                //   itemBuilder: (context, _) => Icon(
                //     Icons.star,
                //     color: Colors.amber,
                //   ),
                //   onRatingUpdate: (rating) {
                //     print(rating);
                //   },
                // ),

                ],),
              ),


            ],
          ),
        ));
  }
}



