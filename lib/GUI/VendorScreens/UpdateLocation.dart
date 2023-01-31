// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:the_builders/GUI/VendorScreens/vendorHome.dart';

import 'package:the_builders/Global/global.dart' as g;
import 'package:the_builders/GUI/globalApi.dart' as global;

// Polyline(
// polylineId: PolylineId('route'),
// visible: true,
// points: [LatLng(lat1, lon1), LatLng(lat2, lon2)],
// width: 4,
// color: Colors.blue,
// ),
// double distanceAtoB = haversineDistance(lat1, lon1, lat2, lon2);
// double distanceBtoC = haversineDistance(lat2, lon2, lat3, lon3);
// double totalDistance = distanceAtoB + distanceBtoC;
//
// import 'dart:math';
//
// double haversineDistance(lat1, lon1, lat2, lon2) {
//   var R = 6371; // radius of the Earth in kilometers
//   var dLat = (lat2 - lat1) * (pi / 180);
//   var dLon = (lon2 - lon1) * (pi / 180);
//   lat1 = lat1 * (pi / 180);
//   lat2 = lat2 * (pi / 180);
//
//   var a = sin(dLat / 2) * sin(dLat / 2) +
//       cos(lat1) * cos(lat2) * sin(dLon / 2) * sin(dLon / 2);
//   var c = 2 * atan2(sqrt(a), sqrt(1 - a));
//   var d = R * c;
//
//   return d;
// }
//
// void main() {
//   var lat1 = 40.748817;
//   var lon1 = -73.985428;
//   var lat2 = 41.748817;
//   var lon2 = -72.985428;
//
//   var distance = haversineDistance(lat1, lon1, lat2, lon2);
//   print(distance);
// }



class UpdateLocation extends StatefulWidget {
  const UpdateLocation({Key? key}) : super(key: key);

  @override
  State<UpdateLocation> createState() => _UpdateLocationState();
}

class _UpdateLocationState extends State<UpdateLocation> {


  TextEditingController address = TextEditingController();
  //final geocoding=GoogleMapsGeocoding(apiKey: global.googleApiKey);

  late GoogleMapController mapcontroller;
  Position? position;
  double Latitude = 35.6431345;
  double Longitude = 75.0769348;

  Future<void> adddAddress(double clat, double clong) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(clat, clong);
    g.Address="${placemarks.first.street} " "${placemarks.first.subLocality}";
    print(g.Address);
    //Toaddress = addresses.first;
    //print("${placemarks}");
    setState(() {});
    //reload();
  }


  Future<void> getSearchedLocation() async {
    var permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      List<Location> locations = await locationFromAddress(address.text);
      g.Address=address.text;
      g.lat = locations.last.latitude;
      g.long = locations.last.longitude;

      mapcontroller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(g.lat!, g.long!),
            zoom: 16.0,
          ),
        ),
      );

      reload();
    }
  }

  Future<void> getcurrentlocation() async {
    var permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      List<Placemark> placemarks = await placemarkFromCoordinates(position!.latitude, position!.longitude);
      g.Address="${placemarks.first.street} " "${placemarks.first.subLocality}";
      print(g.Address);
      g.lat = position?.latitude;
      g.long = position?.longitude;

      mapcontroller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(g.lat!, g.long!),
            zoom: 12.0,
          ),
        ),
      );
      addLatLong(g.lat!, g.long!,g.Address!);
      reload();
    }
  }


  Future<void> addLatLong(double lt,double lng,String address)async {
    Future.delayed(Duration(milliseconds: 50));
    var httprequest = GetConnect();
    var response = await httprequest.post(
        "${global.url}/addLocation?lat=$lt&lng=$lng&address=$address&uid=${int.parse(g.login_user_id!)}",{});
    print(response.statusCode);
    if (response.statusCode == 200) {
      Get.off(const VendorHome());
      Get.snackbar("Message", "Address added");
    } else {
      Get.snackbar("Message", "Address not added! please add your address");
    }
  }



  void reload() async {
    await Future.delayed(const Duration(milliseconds: 10));
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        foregroundColor: Colors.white,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 81, 0),
        title: Text(
          'Update Address',
          style: TextStyle(fontSize: 30.sp),
        ),
      ),
      body: Column(
        children: [
          TextField(
            controller: address,
            style: TextStyle(fontSize: 16.sp, color: Colors.black),
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  getSearchedLocation();
                },
                icon: const Icon(Icons.search_sharp),
              ),
              filled: true,
              fillColor: Colors.white,
              hintText: "Enter Your Address",
              hintStyle: const TextStyle(color: Colors.black),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Expanded(
            child: GoogleMap(
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              
              //myLocationEnabled: true,
              initialCameraPosition: CameraPosition(
                  target: LatLng(g.lat ?? Latitude, g.long ?? Longitude),
                  zoom: 13.5),
              onMapCreated: (controller){  mapcontroller = controller;},

              markers: {
                Marker(
                  markerId: const MarkerId("current_location"),
                  position: LatLng(g.lat ?? Latitude, g.long ?? Longitude),
                )
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              getcurrentlocation();
              //reload();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green[400],
            ),
            child: Text(
              "Use Current Location",
              style: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          ElevatedButton(
            onPressed: () {
              if(g.lat!=null && g.long!=null){
                addLatLong(g.lat!,g.long!,g.Address!);
              }
              // reload();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green[400],
            ),
            child: Text(
              ' Use Search Location',
              style: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
