// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_builders/GUI/DeliveryBoy/HomePage.dart';
import 'package:the_builders/GUI/loginpages.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackingPage extends StatefulWidget {
  const TrackingPage({Key? key}) : super(key: key);

  @override
  State<TrackingPage> createState() => _TrackingPageState();
}

class _TrackingPageState extends State<TrackingPage> {
  static const _initialCameraPosition =
      CameraPosition(target: LatLng(33.6431168, 73.0769498), zoom: 13.5);

// import 'package:geolocator/geolocator.dart';

// // Get the current position
// Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

// // Extract the latitude and longitude from the position object
// double latitude = position.latitude;
// double longitude = position.longitude;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 81, 0),
        title: Text(
          'Product Details',
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
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
      body: ListView(
        children: [
          SizedBox(
              height: 400.h,
              child: const GoogleMap(
                  initialCameraPosition: _initialCameraPosition)),
          // Container(
          //   height: 400.h,
          //   decoration: const BoxDecoration(
          //       image: DecorationImage(
          //     image: AssetImage(
          //       'assets/map.png',
          //     ),
          //     fit: BoxFit.fill,
          //   )),
          // ),
          Container(
              height: 220.h,
              margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  color: Color.fromARGB(29, 255, 102, 0),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  )),
              child: Table(
                children: [
                  TableRow(children: [
                    TableCell(
                        child: Text(
                      'Ordered By:',
                      style: TextStyle(
                          fontSize: 22.sp,
                          color: const Color.fromARGB(255, 255, 81, 0),
                          fontWeight: FontWeight.bold),
                    )),
                    TableCell(
                        child: Text(
                      'Mr Ali.',
                      style: TextStyle(
                          fontSize: 22.sp,
                          color: const Color.fromARGB(255, 255, 81, 0),
                          fontWeight: FontWeight.bold),
                    ))
                  ]),
                  TableRow(children: [
                    TableCell(
                        child: Text(
                      'Product:',
                      style: TextStyle(
                          fontSize: 22.sp,
                          color: const Color.fromARGB(255, 255, 81, 0),
                          fontWeight: FontWeight.bold),
                    )),
                    TableCell(
                        child: Text(
                      'Sand',
                      style: TextStyle(
                          fontSize: 22.sp,
                          color: const Color.fromARGB(255, 255, 81, 0),
                          fontWeight: FontWeight.bold),
                    ))
                  ]),
                  TableRow(children: [
                    TableCell(
                        child: Text(
                      'From:',
                      style: TextStyle(
                          fontSize: 22.sp,
                          color: const Color.fromARGB(255, 255, 81, 0),
                          fontWeight: FontWeight.bold),
                    )),
                    TableCell(
                        child: Text(
                      'Saidpur Road rwp',
                      style: TextStyle(
                          fontSize: 22.sp,
                          color: const Color.fromARGB(255, 255, 81, 0),
                          fontWeight: FontWeight.bold),
                    ))
                  ]),
                  TableRow(children: [
                    TableCell(
                        child: Text(
                      'To:',
                      style: TextStyle(
                          fontSize: 22.sp,
                          color: const Color.fromARGB(255, 255, 81, 0),
                          fontWeight: FontWeight.bold),
                    )),
                    TableCell(
                        child: Text(
                      'Sadiqabad rwp',
                      style: TextStyle(
                          fontSize: 22.sp,
                          color: const Color.fromARGB(255, 255, 81, 0),
                          fontWeight: FontWeight.bold),
                    ))
                  ]),
                  TableRow(children: [
                    TableCell(
                        child: Text(
                      'Contact:',
                      style: TextStyle(
                          fontSize: 22.sp,
                          color: const Color.fromARGB(255, 255, 81, 0),
                          fontWeight: FontWeight.bold),
                    )),
                    TableCell(
                        child: Text(
                      '03037275402',
                      style: TextStyle(
                          fontSize: 22.sp,
                          color: const Color.fromARGB(255, 255, 81, 0),
                          fontWeight: FontWeight.bold),
                    ))
                  ]),
                ],
              )),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                backgroundColor: const Color.fromARGB(255, 255, 81, 0),
                //maximumSize: Size(100.w, 40.h),
                padding: const EdgeInsets.all(20),
              ),
              child: Text(
                'Not Found',
                style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.white,
                  //fontWeight: FontWeight.bold
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OrderCompleted()));
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                backgroundColor: const Color.fromARGB(255, 255, 81, 0),
                //maximumSize: Size(100.w, 40.h),
                padding: const EdgeInsets.fromLTRB(45, 20, 45, 20),
              ),
              child: Text(
                'Done',
                style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.white,
                  //fontWeight: FontWeight.bold
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
