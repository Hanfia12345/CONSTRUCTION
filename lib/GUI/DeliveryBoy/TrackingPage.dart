// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:the_builders/API/TransporterApi/LatLongForTracking.dart';
//import 'package:get/get.dart';
import 'package:the_builders/GUI/DeliveryBoy/HomePage.dart';
import 'package:the_builders/GUI/loginpages.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackingPage extends StatefulWidget {
  const TrackingPage({Key? key}) : super(key: key);

  @override
  State<TrackingPage> createState() => _TrackingPageState();
}

class _TrackingPageState extends State<TrackingPage> {
  late GoogleMapController mapcontroller;
  Position? position;



  static const _initialCameraPosition =
      CameraPosition(target: LatLng(33.6431168, 73.0769498), zoom: 13.5);

    Set<Marker> markers={};
    Set<Polyline> polyLines={};
  late List<LatLng> latlonglist;

  Future<void> getCurrentLocation() async {

    var permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      // lat = position?.latitude;
      // long = position?.longitude;
      // g.lat=lat;
      // g.long=long;

      // // setState(() {
      // //
      // // });

    }
  }

  void reload() async {
    await Future.delayed(const Duration(milliseconds: 10));
    setState(() {});
  }

@override
  void initState() {
   reload();


    // TODO: implement initState
    super.initState();
    for(int i=0;i<latlngList.length;i++){
      print(latlngList[i]);
      markers.add(Marker(markerId: MarkerId(i.toString()),
      position: latlngList[i],
      infoWindow: const InfoWindow(
        title: 'delivery points',
            snippet: 'delivery routes',
      ),
      icon: BitmapDescriptor.defaultMarker,
      ),

      );
      setState(() {

      });
      polyLines.add(Polyline(polylineId: PolylineId('1'),
          points: latlngList
      ),
      );
    }


  }
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
      body: Column(
        children: [
           Expanded(
            child: GoogleMap(
              myLocationEnabled: true,
              markers: markers,

                initialCameraPosition: _initialCameraPosition,
            onMapCreated: (controller)=> mapcontroller = controller,
              polylines: polyLines,
            ),

          ),


          Container(
            //height: 220.h,
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
