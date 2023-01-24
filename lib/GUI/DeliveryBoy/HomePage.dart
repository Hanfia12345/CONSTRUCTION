// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:the_builders/GUI/DeliveryBoy/AddVehicle.dart';
import 'package:the_builders/GUI/DeliveryBoy/VehicleDetail.dart';
import 'package:the_builders/GUI/DeliveryBoy/ViewOrders.dart';
import 'package:the_builders/GUI/loginpages.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(245, 240, 246, 1.0),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(204, 41, 54, 1.0),
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
                  const BoxDecoration(color: Color.fromRGBO(204, 41, 54, 1.0)),
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.history,
                color: const Color.fromARGB(255, 255, 81, 0),
                size: 33.r,
              ),
              title: Text(
                'Order History',
                style: TextStyle(
                    color: const Color.fromARGB(255, 255, 81, 0),
                    fontSize: 22.sp),
              ),
              onTap: () {

                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => const HomePage()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.fire_truck,
                color: const Color.fromARGB(255, 255, 81, 0),
                size: 33.r,
              ),
              title: Text(
                'Vehicle Detail',
                style: TextStyle(
                    color: const Color.fromARGB(255, 255, 81, 0),
                    fontSize: 22.sp),
              ),
              onTap: () {
              Get.to(()=>const VehicleDetails());
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => const HomePage()));
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
            SizedBox(
              height: 140.h,
            ),
            ElevatedButton(
              onPressed: () {

                Get.to(const AddVehicle());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(102, 103, 171, 1.0),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(80, 10, 80, 10),
                child: Text(
                  'ADD Vehicle',
                  style: TextStyle(
                      fontSize: 22.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            ElevatedButton(
              onPressed: () {
                 Get.to(() => const ViewOrders());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(102, 103, 171, 1.0),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(80, 10, 80, 10),
                child: Text(
                  'View Orders',
                  style: TextStyle(
                      fontSize: 22.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 40.h,
            ),

            SizedBox(
              height: 30.h,
            ),
            Text('___OR___',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: const Color.fromRGBO(102, 103, 171, 0.2),
                )),
            SizedBox(
              height: 30.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SizedBox(
                //   width: 42.w,
                // ),
                ElevatedButton(
                  onPressed: () {
                    // Get.defaultDialog(onConfirm: () {
                       Get.off(const login());
                    // });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(102, 103, 171, 1.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(100, 10, 100, 10),
                    child: Text(
                      'LogOut',
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
        ),
      ),
    );
  }
}



class OrderCompleted extends StatefulWidget {
  const OrderCompleted({Key? key}) : super(key: key);

  @override
  State<OrderCompleted> createState() => _OrderCompletedState();
}

class _OrderCompletedState extends State<OrderCompleted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Order Completed Successfully",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 50.sp,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(207, 241, 82, 9)),
          ),
          SizedBox(
            height: 50.h,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 40.h,
                width: 70.w,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[400],
                  ),
                  child: Text(
                    'Ok',
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
