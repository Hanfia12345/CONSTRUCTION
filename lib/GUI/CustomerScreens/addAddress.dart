import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:the_builders/GUI/CustomerScreens/BookVehicle.dart';

class AddAddressincart extends StatefulWidget {
  const AddAddressincart({Key? key}) : super(key: key);

  @override
  State<AddAddressincart> createState() => _AddAddressincartState();
}

class _AddAddressincartState extends State<AddAddressincart> {
  TextEditingController address =TextEditingController();
  static const _initialCameraPosition =
  CameraPosition(target: LatLng(33.6431168, 73.0769498), zoom: 13.5);
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
      body: ListView(children: [
        SizedBox(
            height: 400.h,
            child: const GoogleMap(
                initialCameraPosition: _initialCameraPosition)),
        SizedBox(height: 20.h,),
        TextField(
          controller: address,
            keyboardType: TextInputType.streetAddress,
            cursorColor: Colors.white,
            style: TextStyle(fontSize: 16.sp, color: Colors.white),
            decoration: InputDecoration(
              hintText: "Enter Your Address",
              hintStyle: const TextStyle(color: Colors.white),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.white,
                ),
              ),
            )
        ),
        SizedBox(height: 20.h,),
        ElevatedButton(
          onPressed: () {
            Get.to(()=>BookVehicle());
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
      ],),

    );
  }
}
