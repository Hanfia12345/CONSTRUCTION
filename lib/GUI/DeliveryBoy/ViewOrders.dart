// ignore_for_file: non_constant_identifier_names, duplicate_ignore, file_names, prefer_typing_uninitialized_variables

// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:the_builders/API/TransporterApi/LatLongForTracking.dart';
import 'package:the_builders/API/TransporterApi/ShowOrdersForDeliveryBoy.dart';
import 'package:the_builders/GUI/DeliveryBoy/HomePage.dart';
import 'package:the_builders/GUI/DeliveryBoy/OrderDetails.dart';
import 'package:the_builders/GUI/DeliveryBoy/TrackingPage.dart';
import 'package:the_builders/GUI/loginpages.dart';

class ViewOrders extends StatefulWidget {
  const ViewOrders({Key? key}) : super(key: key);

  @override
  State<ViewOrders> createState() => _ViewOrdersState();
}

class _ViewOrdersState extends State<ViewOrders> {
  late var Toaddress;

  toAddress(double clat, double clong) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(clat, clong);
    Toaddress =
        "${placemarks.first.subLocality} " "${placemarks.first.locality}";
    //Toaddress = addresses.first;
    //print("${placemarks}");
    setState(() {});
    //reload();
  }

  // void goToTracking()async{
  //
  // }


  void reload() async {
    await Future.delayed(const Duration(milliseconds: 100));
    setState(() {});
  }

  // Future<List<OrdersForDeliveryBoy>>? ordersFordb;
// @override
  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    // ordersFordb= ordersForDeliveryBoy();
      //llList.clear();
    latlngList.clear();
    //setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 81, 0),
        title: Text(
          'Home',
          style: TextStyle(color: Colors.white, fontSize: 38.sp),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration:
                  const BoxDecoration(color: Color.fromARGB(255, 255, 110, 43)),
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
                Get.to(const HomePage());
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 70.h,
                width: 300.w,
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                    color: Color.fromARGB(132, 229, 255, 0),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    )),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Order Requests',
                          style: TextStyle(
                              fontSize: 22.sp,
                              color: const Color.fromARGB(255, 255, 81, 0),
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Icon(
                          Icons.fire_truck_outlined,
                          size: 34.r,
                          color: Colors.green,
                        ),
                      ],
                    ),
                  ],
                )),
            FutureBuilder<List<OrdersForDelivery>>(
              future: ordersForDelivery(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return SingleChildScrollView(
                        child: Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(29, 255, 102, 0),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                )),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "Order No",
                                      style: TextStyle(
                                          fontSize: 22.sp,
                                          color: const Color.fromARGB(
                                              255, 255, 81, 0),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 5.h,),
                                    Text(
                                      snapshot.data![index].oid.toString(),
                                      style: TextStyle(
                                          fontSize: 22.sp,
                                          color: const Color.fromARGB(
                                              255, 255, 81, 0),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10.h,),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    ElevatedButton(
                                        onPressed: () async{

                                         await latlongforTracking(int.parse(snapshot.data![index].oid.toString()) );
                                          //print(llList.first.lat);
                                          Get.to(const TrackingPage());
                                        },
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          backgroundColor: const Color.fromARGB(
                                              255, 255, 81, 0),
                                          //padding: const EdgeInsets.all(20),)
                                        ),
                                        child: const Text("ACCEPT")),
                                    ElevatedButton(
                                        onPressed: () {
                                          Get.to(OrderDetail(),arguments: [snapshot.data![index].oid.toString()]);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          backgroundColor: const Color.fromARGB(
                                              255, 255, 81, 0),
                                          //padding: const EdgeInsets.all(20),)
                                        ),
                                        child: const Text("View Details")),
                                  ],
                                )
                              ],
                            )),
                      );
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
    );
  }
}
// SingleChildScrollView(
// child: Column(
// children: [

// Container(
// height: 220.h,
// margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
// padding: const EdgeInsets.all(10),
// decoration: const BoxDecoration(
// color: Color.fromARGB(29, 255, 102, 0),
// borderRadius: BorderRadius.all(
// Radius.circular(15),
// )),
// child: Table(
// children: [
// TableRow(children: [
// TableCell(
// child: Text(
// 'Product:',
// style: TextStyle(
// fontSize: 22.sp,
// color: const Color.fromARGB(255, 255, 81, 0),
// fontWeight: FontWeight.bold),
// )),
// TableCell(
// child: Text(
// 'steel,bricks',
// style: TextStyle(
// fontSize: 22.sp,
// color: const Color.fromARGB(255, 255, 81, 0),
// fontWeight: FontWeight.bold),
// ))
// ]),
// TableRow(children: [
// TableCell(
// child: Text(
// 'From:',
// style: TextStyle(
// fontSize: 22.sp,
// color: const Color.fromARGB(255, 255, 81, 0),
// fontWeight: FontWeight.bold),
// )),
// TableCell(
// child: Text(
// 'Commercial Market Road',
// style: TextStyle(
// fontSize: 22.sp,
// color: const Color.fromARGB(255, 255, 81, 0),
// fontWeight: FontWeight.bold),
// ))
// ]),
// TableRow(children: [
// TableCell(
// child: Text(
// 'To:',
// style: TextStyle(
// fontSize: 22.sp,
// color: const Color.fromARGB(255, 255, 81, 0),
// fontWeight: FontWeight.bold),
// )),
// TableCell(
// child: Text(
// 'Raja Bazar',
// style: TextStyle(
// fontSize: 22.sp,
// color: const Color.fromARGB(255, 255, 81, 0),
// fontWeight: FontWeight.bold),
// ))
// ]),
// TableRow(children: [
// TableCell(
// child: Center(
// child: ElevatedButton(
// onPressed: () {
// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) =>
// const TrackingPage()));
// },
// style: ElevatedButton.styleFrom(
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(12)),
// backgroundColor:
// const Color.fromARGB(255, 255, 81, 0),
// //maximumSize: Size(100.w, 40.h),
// padding: const EdgeInsets.all(20),
// ),
// child: Text(
// 'Accept',
// style: TextStyle(
// fontSize: 18.sp,
// color: Colors.white,
// //fontWeight: FontWeight.bold
// ),
// ),
// ),
// ),
// ),
// TableCell(
// child: Center(
// child: ElevatedButton(
// onPressed: () {},
// style: ElevatedButton.styleFrom(
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(12)),
// backgroundColor:
// const Color.fromARGB(255, 255, 81, 0),
// //maximumSize: Size(100.w, 40.h),
// padding: const EdgeInsets.all(20),
// ),
// child: Text(
// 'Reject',
// style: TextStyle(
// fontSize: 18.sp,
// color: Colors.white,
// //fontWeight: FontWeight.bold
// ),
// ),
// ),
// ))
// ]),
// ],
// )),
// Container(
// height: 220.h,
// margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
// padding: const EdgeInsets.all(10),
// decoration: const BoxDecoration(
// color: Color.fromARGB(29, 255, 102, 0),
// borderRadius: BorderRadius.all(
// Radius.circular(15),
// )),
// child: Table(
// children: [
// TableRow(children: [
// TableCell(
// child: Text(
// 'Product:',
// style: TextStyle(
// fontSize: 22.sp,
// color: const Color.fromARGB(255, 255, 81, 0),
// fontWeight: FontWeight.bold),
// )),
// TableCell(
// child: Text(
// 'crush,steel',
// style: TextStyle(
// fontSize: 22.sp,
// color: const Color.fromARGB(255, 255, 81, 0),
// fontWeight: FontWeight.bold),
// ))
// ]),
// TableRow(children: [
// TableCell(
// child: Text(
// 'From:',
// style: TextStyle(
// fontSize: 22.sp,
// color: const Color.fromARGB(255, 255, 81, 0),
// fontWeight: FontWeight.bold),
// )),
// TableCell(
// child: Text(
// '6th Road rwp',
// style: TextStyle(
// fontSize: 22.sp,
// color: const Color.fromARGB(255, 255, 81, 0),
// overflow: TextOverflow.ellipsis,
// fontWeight: FontWeight.bold),
// ))
// ]),
// TableRow(children: [
// TableCell(
// child: Text(
// 'To:',
// style: TextStyle(
// fontSize: 22.sp,
// color: const Color.fromARGB(255, 255, 81, 0),
// fontWeight: FontWeight.bold),
// )),
// TableCell(
// child: Text(
// 'Ra.Bazar Rwp',
// style: TextStyle(
// fontSize: 22.sp,
// color: const Color.fromARGB(255, 255, 81, 0),
// fontWeight: FontWeight.bold),
// ))
// ]),
// TableRow(children: [
// TableCell(
// child: Center(
// child: ElevatedButton(
// onPressed: () {
// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) =>
// const TrackingPage()));
// },
// style: ElevatedButton.styleFrom(
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(12)),
// backgroundColor:
// const Color.fromARGB(255, 255, 81, 0),
// //maximumSize: Size(100.w, 40.h),
// padding: const EdgeInsets.all(20),
// ),
// child: Text(
// 'Accept',
// style: TextStyle(
// fontSize: 18.sp,
// color: Colors.white,
// //fontWeight: FontWeight.bold
// ),
// ),
// ),
// ),
// ),
// TableCell(
// child: Center(
// child: ElevatedButton(
// onPressed: () {},
// style: ElevatedButton.styleFrom(
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(12)),
// backgroundColor:
// const Color.fromARGB(255, 255, 81, 0),
// //maximumSize: Size(100.w, 40.h),
// padding: const EdgeInsets.all(20),
// ),
// child: Text(
// 'Reject',
// style: TextStyle(
// fontSize: 18.sp,
// color: Colors.white,
// //fontWeight: FontWeight.bold
// ),
// ),
// ),
// ))
// ]),
// ],
// )),
// Container(
// height: 220.h,
// margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
// padding: const EdgeInsets.all(10),
// decoration: const BoxDecoration(
// color: Color.fromARGB(29, 255, 102, 0),
// borderRadius: BorderRadius.all(
// Radius.circular(15),
// )),
// child: Table(
// children: [
// TableRow(children: [
// TableCell(
// child: Text(
// 'Product:',
// style: TextStyle(
// fontSize: 22.sp,
// color: const Color.fromARGB(255, 255, 81, 0),
// fontWeight: FontWeight.bold),
// )),
// TableCell(
// child: Text(
// 'Sand',
// style: TextStyle(
// fontSize: 22.sp,
// color: const Color.fromARGB(255, 255, 81, 0),
// fontWeight: FontWeight.bold),
// ))
// ]),
// TableRow(children: [
// TableCell(
// child: Text(
// 'From:',
// style: TextStyle(
// fontSize: 22.sp,
// color: const Color.fromARGB(255, 255, 81, 0),
// fontWeight: FontWeight.bold),
// )),
// TableCell(
// child: Text(
// 'Saidpur Road rwp',
// style: TextStyle(
// fontSize: 22.sp,
// color: const Color.fromARGB(255, 255, 81, 0),
// fontWeight: FontWeight.bold),
// ))
// ]),
// TableRow(children: [
// TableCell(
// child: Text(
// 'To:',
// style: TextStyle(
// fontSize: 22.sp,
// color: const Color.fromARGB(255, 255, 81, 0),
// fontWeight: FontWeight.bold),
// )),
// TableCell(
// child: Text(
// 'Sadiqabad rwp',
// style: TextStyle(
// fontSize: 22.sp,
// color: const Color.fromARGB(255, 255, 81, 0),
// fontWeight: FontWeight.bold),
// ))
// ]),
// TableRow(children: [
// TableCell(
// child: Center(
// child: ElevatedButton(
// onPressed: () {
// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) =>
// const TrackingPage()));
// },
// style: ElevatedButton.styleFrom(
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(12)),
// backgroundColor:
// const Color.fromARGB(255, 255, 81, 0),
// //maximumSize: Size(100.w, 40.h),
// padding: const EdgeInsets.all(20),
// ),
// child: Text(
// 'Accept',
// style: TextStyle(
// fontSize: 18.sp,
// color: Colors.white,
// //fontWeight: FontWeight.bold
// ),
// ),
// ),
// ),
// ),
// TableCell(
// child: Center(
// child: ElevatedButton(
// onPressed: () {},
// style: ElevatedButton.styleFrom(
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(12)),
// backgroundColor:
// const Color.fromARGB(255, 255, 81, 0),
// //maximumSize: Size(100.w, 40.h),
// padding: const EdgeInsets.all(20),
// ),
// child: Text(
// 'Reject',
// style: TextStyle(
// fontSize: 18.sp,
// color: Colors.white,
// //fontWeight: FontWeight.bold
// ),
// ),
// ),
// ))
// ]),
// ],
// )),
// ],
// ),
// ),
