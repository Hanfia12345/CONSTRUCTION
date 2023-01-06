// ignore_for_file: file_names, unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_builders/GUI/VendorScreens/AddNewProduct.dart';
import 'package:the_builders/GUI/VendorScreens/ShowOrders.dart';
import 'package:the_builders/GUI/VendorScreens/ViewProduct.dart';
import 'package:the_builders/GUI/loginpages.dart';
import 'package:get/get.dart';
import 'package:the_builders/Global/global.dart';

class VendorHome extends StatefulWidget {
  const VendorHome({Key? key}) : super(key: key);

  @override
  State<VendorHome> createState() => _VendorHomeState();
}

class _VendorHomeState extends State<VendorHome> {
  var id = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent[200],
      //const Color.fromARGB(255, 255, 110, 43),
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
            const ListTile(
              leading: Icon(
                Icons.home,
              ),
            )
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
                Get.to(const AddNewProduct(), arguments: login_user_id);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[400],
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(60, 10, 60, 10),
                child: Text(
                  'ADD PRODUCT',
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
                Get.to(() => const ViewProducts(), arguments: login_user_id);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[400],
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                child: Text(
                  'VIEW PRODUCTS',
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
                Get.to(const ShowOrders(), arguments: login_user_id);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[400],
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: Text(
                  'SHOW ORDERS',
                  style: TextStyle(
                      fontSize: 22.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Text('___OR___',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.white24,
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
                    Get.defaultDialog(onConfirm: () {
                      Get.to(const login());
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[400],
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
