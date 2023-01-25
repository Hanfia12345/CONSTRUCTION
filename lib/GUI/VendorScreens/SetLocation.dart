// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

import 'package:the_builders/Global/global.dart' as g;

class SetLocation extends StatefulWidget {
  const SetLocation({Key? key}) : super(key: key);

  @override
  State<SetLocation> createState() => _SetLocationState();
}

class _SetLocationState extends State<SetLocation> {
  TextEditingController address = TextEditingController();
  //final geocoding=GoogleMapsGeocoding(apiKey: global.googleApiKey);

  late GoogleMapController mapcontroller;
  Position? position;
  // double? lat;
  // double? long;
  double Latitude = 35.6431345;
  double Longitude = 75.0769348;

  Future<void> getSearchedLocation() async {
    var permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      List<Location> locations = await locationFromAddress(address.text);
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
      // print(lat);
      // print(long);
      //print(position);

      reload();
    }
  }

  void reload() async {
    await Future.delayed(const Duration(milliseconds: 10));
    setState(() {});
  }

  // @override
  // void dispose() {
  //   mapcontroller.dispose();
  //   // TODO: implement dispose
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        foregroundColor: Colors.white,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 81, 0),
        title: Text(
          'Add Address',
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
              //myLocationEnabled: true,
              initialCameraPosition: CameraPosition(
                  target: LatLng(g.lat ?? Latitude, g.long ?? Longitude),
                  zoom: 13.5),
              onMapCreated: (controller) => mapcontroller = controller,
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
              Get.back();

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
