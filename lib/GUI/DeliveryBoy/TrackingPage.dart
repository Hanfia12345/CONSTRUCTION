// ignore_for_file: file_names
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:the_builders/API/TransporterApi/LatLongForTracking.dart';
import 'package:the_builders/GUI/DeliveryBoy/HomePage.dart';
import 'package:the_builders/GUI/loginpages.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import '../../API/TransporterApi/OrderStatus.dart';
import '../../API/TransporterApi/ShowOrdersForDeliveryBoy.dart';
import 'package:the_builders/Global/global.dart';
import 'package:the_builders/GUI/globalApi.dart' as global;



class TrackingPage extends StatefulWidget {
  const TrackingPage({Key? key}) : super(key: key);

  @override
  State<TrackingPage> createState() => _TrackingPageState();
}

class _TrackingPageState extends State<TrackingPage> {
  bool DeliveryCompleted = false;
  var oid = Get.arguments;
  late GoogleMapController mapcontroller;
  Position? position;
  Position? currentPosition;

  late double lat;
  late double long;

  void UpdateLocationForTracking(int oid, double lat,double long)async{
    var httprequest = GetConnect();
    var response=await httprequest.post("${global.url}/UpdateDeliveryBoyLiveLocation?lat=$lat&lng=$long&oid=$oid", {});
    if(response.statusCode==200){
      print(response.body);
    }else{
      print(response.body);
    }
  }

  var _initialCameraPosition =
      const CameraPosition(target: LatLng(33.6431168, 73.0769498), zoom: 14);

  Set<Marker> markers = {};
  Future<void> getCurrentLocation() async {
    var permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      lat = position!.latitude;
      long = position!.longitude;
      mapcontroller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(lat, long),
            zoom: 12.0,
          ),
        ),
      );
      _initialCameraPosition = CameraPosition(
          target: LatLng(position!.latitude, position!.longitude), zoom: 14);
      markers.add(Marker(
        markerId: const MarkerId('Current location'),
        position: LatLng(position!.latitude, position!.longitude),
        infoWindow: const InfoWindow(
          title: 'Delivery boy',
        ),
      ));
    }
  }

  void startTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      getCurrentLocation();
      UpdateLocationForTracking(int.parse(oid[0]),lat,long);
    });
  }

  List<LatLng> polylinesss = [];

  Future<void> getroute() async {
    for (var i = 0; i < latlngList.length - 1; i++) {
      var j = i + 1;
      LatLng first = latlngList[i];
      LatLng second = latlngList[j];
      PolylinePoints polylinePoints = PolylinePoints();
      PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
          "AIzaSyDjzFHeTqGM_I05Nv15Tos-2vlmNV2pH5U",
          PointLatLng(first.latitude, first.longitude),
          PointLatLng(second.latitude, second.longitude),
          travelMode: TravelMode.driving);
      for (var point in result.points) {
        polylinesss.add(LatLng(point.latitude, point.longitude));
      }
    }
    reload();
  }

  void reload() async {
    await Future.delayed(const Duration(milliseconds: 50));
    setState(() {});
  }

  void timer() {
    Timer(const Duration(seconds: 1), () {
      setState(() {});
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < latlngList.length; i++) {
      if (i <= latlngList.length - 2) {
        markers.add(
          Marker(
            markerId: MarkerId(i.toString()),
            position: latlngList[i],
            infoWindow: InfoWindow(
              title: 'Delivery Point : ${i + 1}',
            ),
            icon: BitmapDescriptor.defaultMarker,
          ),
        );
      } else {
        markers.add(
          Marker(
            markerId: MarkerId(i.toString()),
            position: latlngList[i],
            infoWindow: const InfoWindow(
              title: 'Customer Location',
            ),
            icon: BitmapDescriptor.defaultMarkerWithHue(250),
          ),
        );
      }
    }

    getCurrentLocation();
    //startTimer();
    //getroute();
    //timer();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: ()async{
      if (DeliveryCompleted) {
        return true;
      } else {
        return false;
      }
    },
      child: Scaffold(
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
                onMapCreated: (controller) => mapcontroller = controller,
                polylines: {
                  Polyline(
                      polylineId: const PolylineId("route"),
                      points: polylinesss,
                      color: Colors.red,
                      width: 4)
                },
              ),
            ),
            FutureBuilder<List<OrderDetailsForDelivery>>(
              future: ordersDetailsDeliveryBoy(int.parse(oid[0])),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          //print(vid[1]);

                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 200.h,
                              //margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(29, 255, 102, 0),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  )),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'Name  :',
                                        style: TextStyle(
                                            color: const Color.fromARGB(
                                                255, 255, 81, 0),
                                            fontSize: 22.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        snapshot.data![index].customername
                                            .toString(),
                                        style: TextStyle(
                                            color: const Color.fromARGB(
                                                255, 255, 81, 0),
                                            fontSize: 22.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'Contact No :',
                                        style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 255, 81, 0),
                                          fontSize: 22.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        snapshot.data![index].customernumber
                                            .toString(),
                                        style: TextStyle(
                                            color: const Color.fromARGB(
                                                255, 255, 81, 0),
                                            fontSize: 22.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'Delivery Address : ',
                                        style: TextStyle(
                                            color: const Color.fromARGB(
                                                255, 255, 81, 0),
                                            fontSize: 22.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: 155.w,
                                        child: Text(
                                          snapshot.data![index].customerAddress
                                              .toString(),
                                          style: TextStyle(
                                              color: const Color.fromARGB(
                                                  255, 255, 81, 0),
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
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
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  DeliveryCompleted=true;
                  UpdateOrderStatus(int.parse(login_user_id!),"Available",int.parse(oid[0]), "Delivered");
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
      ),
    );
  }
}
