import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:the_builders/GUI/CustomerScreens/BookVehicle.dart';
import 'package:geolocator/geolocator.dart';
//import 'package:geocoding/geocoding.dart';

class AddAddressincart extends StatefulWidget {
  const AddAddressincart({Key? key}) : super(key: key);

  @override
  State<AddAddressincart> createState() => _AddAddressincartState();
}

class _AddAddressincartState extends State<AddAddressincart> {
  TextEditingController address = TextEditingController();

  late GoogleMapController mapcontroller;
  Position? position;
  double? lat;
  double? long;
  double Latitude = 35.6431345;
  double Longitude = 75.0769348;

  Future<void> getcurrentlocation() async {
    var permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      lat = position?.latitude;
      long = position?.longitude;
      print(lat);
      print(long);
      print(position);

      reload();
    }
  }

  void reload() async {
    await Future.delayed(const Duration(milliseconds: 10));
    setState(() {});
  }

  // searchLocationByTextfield() async {
  //   final query = address.text;
  //   final placemarks = await Geolocator().placemarkFromAddress(query);
  //   if (placemarks.isNotEmpty) {
  //     final first = placemarks.first;
  //     mapcontroller.animateCamera(
  //       CameraUpdate.newCameraPosition(
  //         CameraPosition(
  //           target: LatLng(first.position.latitude, first.position.longitude),
  //           zoom: 14.0,
  //         ),
  //       ),
  //     );
  //   }
  // }

  static const _initialCameraPosition =
      CameraPosition(target: LatLng(35.6431168, 75.0769498), zoom: 13.5);

  @override
  void initState() {
    // TODO: implement initState
    getcurrentlocation();
    reload();
    super.initState();
  }

  @override
  void dispose() {
    mapcontroller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent[200],
      appBar: AppBar(
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
              decoration: InputDecoration(filled: true,fillColor: Colors.white,
                hintText: "Enter Your Address",
                hintStyle: const TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.black,
                  ),
                ),
              )),
          Expanded(
            child: GoogleMap(
              myLocationEnabled: true,
              initialCameraPosition: CameraPosition(
                  target: LatLng(position?.latitude ?? 33.6431168,
                      position?.longitude ?? 73.0769498),
                  zoom: 13.5),
              onMapCreated: (controller) => mapcontroller = controller,
              markers: {
                Marker(
                  markerId: MarkerId("current_location"),
                  position: LatLng(position?.latitude ?? Latitude,
                      position?.longitude ?? Longitude),
                )
              },
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              mapcontroller.animateCamera(CameraUpdate.newCameraPosition(
                  CameraPosition(
                      target: LatLng(position?.latitude ?? 33.6431168,
                          position?.longitude ?? 73.0769498),
                      zoom: 14.0)));
            },
            child: Icon(Icons.center_focus_strong),
          ),
          SizedBox(
            height: 20.h,
          ),
          ElevatedButton(
            onPressed: () {
              getcurrentlocation();
              Get.to(() => const BookVehicle());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green[400],
            ),
            child: Text(
              'Book Vehicle',
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
