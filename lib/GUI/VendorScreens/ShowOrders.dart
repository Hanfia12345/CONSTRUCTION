// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_builders/GUI/VendorScreens/OrderDetails.dart';
import 'package:the_builders/GUI/globalApi.dart' as global;

//for getting orders id
class Orders {
  int? soid;

  Orders({this.soid});

  Orders.fromJson(Map<String, dynamic> json) {
    soid = json['soid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['soid'] = soid;
    return data;
  }
}
//----------------------------------------------------------------------

class ShowOrders extends StatefulWidget {
  const ShowOrders({Key? key}) : super(key: key);

  @override
  State<ShowOrders> createState() => _ShowOrdersState();
}

class _ShowOrdersState extends State<ShowOrders> {
  var vid = Get.arguments;

  Future<List<Orders>> OrdersList() async {
    var response = await http.get(Uri.parse(
      "${global.url}/ShowOrders?id=$vid",
    ));
    //print(response.statusCode);
    if (response.statusCode == 200) {
      List res = jsonDecode(response.body);
      return res.map((e) => Orders.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.orangeAccent[200],
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 255, 81, 0),
          title: Text(
            'Orders',
            style: TextStyle(color: Colors.white, fontSize: 38.sp),
          ),
          bottom: TabBar(tabs: [Tab(text: "Pending Orders",),Tab(text: "Delivered Orders",),],
            indicatorColor: Colors.white,
          ),
        ),

        body: TabBarView(
          children  :[
            Center(
              child: ListView(
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


                  FutureBuilder<List<Orders>>(
                    future: OrdersList(),
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
                                    Get.to(const PendingOrderDetails(),
                                        arguments: [vid,snapshot.data![index].soid]);
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
            ),
            Center(
              child: ListView(
                children: [

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





                ],
              ),
            ),
          ]
        ),
      ),
    );
  }
}
