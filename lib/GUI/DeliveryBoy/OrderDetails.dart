import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:the_builders/API/TransporterApi/ShowOrdersForDeliveryBoy.dart';
//import 'package:get/get.dart';

class OrderDetail extends StatefulWidget {
  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  var oid = Get.arguments;

  List<dynamic> OrderItems = List.empty(growable: true);
  List<dynamic> ItemsQty = List.empty(growable: true);
  List<dynamic> vendorlocations = List.empty(growable: true);
  List<dynamic> pUnitt = List.empty(growable: true);


@override
  void initState() {
    // TODO: implement initState
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
        body: ListView(
          children: [
            Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                FutureBuilder<List<OrderDetailsForDelivery>>(
                  future: ordersDetailsDeliveryBoy(int.parse(oid[0])),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<OrderDetailsForDelivery> Order =
                      snapshot.data as List<OrderDetailsForDelivery>;
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
                      if (pUnitt.isEmpty) {
                        for (var i in Order) {
                          pUnitt.add(i.punit);
                          //OrderItems.add(i.pQty);
                        }
                      }
                      if (vendorlocations.isEmpty) {
                        for (var i in Order) {
                          vendorlocations.add(i.vendorAddress);
                          //OrderItems.add(i.pQty);
                        }
                      }

                      //print(snapshot.data);

                      //print(snapshot.data![0].name.toString());
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Ordered Items, Seller Address & Quantity',
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
                                           Text(
                                             "${pUnitt[index].toString()} ",style: TextStyle(
                                               color: Colors.white, fontSize: 22.sp),),


                                         ],
                                       ),
                                        Text(
                                          "Seller Address :",
                                          style: TextStyle(
                                            color: Colors.white, fontSize: 16.sp),),
                                        Text(
                                          "${vendorlocations[index].toString()} "
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

                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [

                                        Text(
                                          'Order No :',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 22.sp),
                                        ),

                                        Text(
                                          oid[0].toString(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 22.sp),
                                        ),
                                      ],
                                    ),

                                    Row(
                                      children: [

                                        Text(
                                          'Order By :',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 22.sp),
                                        ),

                                        Text(
                                          snapshot.data![index].customername.toString(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 22.sp),
                                        ),
                                      ],
                                    ),


                                    Row(
                                      children: [

                                        Text(
                                          'Customer Address : ',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 22.sp),
                                        ),


                                      ],
                                    ),
                                    Text(
                                      snapshot.data![index].customerAddress.toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.sp),
                                    ),


                                  ],
                                ),
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
          ],
        ));
  }
}