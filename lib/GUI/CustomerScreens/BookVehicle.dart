// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:the_builders/GUI/CustomerScreens/Cart.dart';
import 'package:the_builders/API/CustomerApis/LatLongListforDistance.dart';
import 'package:the_builders/GUI/globalApi.dart' as global;
import 'package:geolocator/geolocator.dart';
import 'package:the_builders/Global/global.dart' as g;

class BookVehicle extends StatefulWidget {
  const BookVehicle({Key? key}) : super(key: key);

  @override
  State<BookVehicle> createState() => _BookVehicleState();
}

class _BookVehicleState extends State<BookVehicle> {


  double loaderCharges=80;
  double suzukiCharges=100;
  double shehzoreCharges =150;
  double tractor_TrolleyCharges=190;
  double dumperCharges=300;

  late List<LatLongListForDistance> positions;
  double totalDistance = 0;
  Future<void> getDistance()async{
    var httprequest = GetConnect();
    var response = await httprequest.get('${global.url}/locationsforOrder?cid=${int.parse(g.login_user_id!)}');
    var res = latLongListForDistanceFromJson(response.bodyString!);
    positions=res;
    List<LatLongListForDistance> l =List.empty(growable: true);
    for (var b in positions) {
      b.distance =Geolocator.distanceBetween(
          g.lat!, g.long!,
          b.lat, b.long);
      b.distance=b.distance/1000;
      l.add(LatLongListForDistance(lat: b.lat, long: b.long,distance:b.distance));
    }
    l.sort((a,b)=> a.distance.compareTo(b.distance));
    l.insert(0,LatLongListForDistance(lat: g.lat!, long: g.long!));
    for (var i =0; i < l.length-1; i++) {
      //print(i);
      double distance = Geolocator.distanceBetween(
        l[i].lat,
        l[i].long,
        l[i+1].lat,
        l[i+1].long,
      )/1000;
      totalDistance=totalDistance+distance;
    }
    loaderCharges=loaderCharges*totalDistance;
    suzukiCharges=suzukiCharges*totalDistance;
    shehzoreCharges=shehzoreCharges*totalDistance;
    tractor_TrolleyCharges=tractor_TrolleyCharges*totalDistance;
    dumperCharges=dumperCharges*totalDistance;
   setState(() {

   });
  }

@override
  void initState() {
  getDistance();
    // TODO: implement initState
    super.initState();


}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: ListView(
        children: [
          Container(
            height: 70.h,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                )),
            child: Center(
              child: Text(
                'Book Vehicle',
                style: TextStyle(
                    color: const Color.fromARGB(255, 255, 81, 0),
                    fontSize: 38.sp),
              ),
            ),
          ),
          SizedBox(
            height: 50.h,
          ),
          SizedBox(
            height: 70.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  'Loader: ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.sp,
                  ),
                ),
                Text(
                  'Rs. ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.sp,
                  ),
                ),
                Text(
                  '${loaderCharges.toInt()}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.sp,
                  ),
                ),
                const SizedBox(
                    // width: 30.w,
                    ),
                TextButton(
                    style: TextButton.styleFrom(
                        foregroundColor:const Color.fromARGB(255, 255, 81, 0),
                        textStyle: TextStyle(fontSize: 22.sp)),
                    onPressed: () {
                      g.deliveryCharges=loaderCharges.toInt();
                      g.vtype="Loader";
                      Get.to(const AddToCart());
                    },
                    child: Row(
                      children: const [
                        Text(
                          'Book Now',
                        ),
                        Icon(Icons.arrow_forward_ios_outlined),
                      ],
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 70.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  'Suzuki: ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.sp,
                  ),
                ),
                Text(
                  'Rs. ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.sp,
                  ),
                ),
                Text(
                  '${suzukiCharges.toInt()}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.sp,
                  ),
                ),
                const SizedBox(
                    //width: 30.w,
                    ),
                TextButton(
                    style: TextButton.styleFrom(
                        foregroundColor: const Color.fromARGB(255, 255, 81, 0),
                        textStyle: TextStyle(fontSize: 22.sp)),
                    onPressed: () {
                      g.deliveryCharges=suzukiCharges.toInt();
                      g.vtype="Suzuki";
                      Get.to(const AddToCart());
                    },
                    child: Row(
                      children: const [
                        Text(
                          'Book Now',
                        ),
                        Icon(Icons.arrow_forward_ios_outlined),
                      ],
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 70.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  'Shehzore: ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.sp,
                  ),
                ),
                Text(
                  'Rs. ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.sp,
                  ),
                ),
                Text(
                  '${shehzoreCharges.toInt()}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.sp,
                  ),
                ),
                const SizedBox(
                    //width: 30.w,
                    ),
                TextButton(
                    style: TextButton.styleFrom(
                        foregroundColor: const Color.fromARGB(255, 255, 81, 0),
                        textStyle: TextStyle(fontSize: 22.sp)),
                    onPressed: () {
                      g.deliveryCharges=shehzoreCharges.toInt();
                      g.vtype="Shehzore";
                      Get.to(const AddToCart());
                    },
                    child: Row(
                      children: const [
                        Text(
                          'Book Now',
                        ),
                        Icon(Icons.arrow_forward_ios_outlined),
                      ],
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 70.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 2.w,
                ),
                Text(
                  'Trolley:',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.sp,
                  ),
                ),
                Text(
                  'Rs. ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.sp,
                  ),
                ),
                Text(
                  '${tractor_TrolleyCharges.toInt()}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.sp,
                  ),
                ),
                const SizedBox(
                    //width: 30.w,
                    ),
                TextButton(
                    style: TextButton.styleFrom(
                        foregroundColor: const Color.fromARGB(255, 255, 81, 0),
                        textStyle: TextStyle(fontSize: 22.sp)),
                    onPressed: () {
                      g.deliveryCharges=tractor_TrolleyCharges.toInt();
                      g.vtype="Tractor Trolley";
                      Get.to(const AddToCart());
                    },
                    child: Row(
                      children: const [
                        Text(
                          'Book Now',
                        ),
                        Icon(Icons.arrow_forward_ios_outlined),
                      ],
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 70.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  'Dumper: ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.sp,
                  ),
                ),
                Text(
                  'Rs. ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.sp,
                  ),
                ),
                Text(
                  '${dumperCharges.toInt()}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.sp,
                  ),
                ),
                const SizedBox(
                  //width: 30.w,
                ),
                TextButton(
                    style: TextButton.styleFrom(
                        foregroundColor: const Color.fromARGB(255, 255, 81, 0),
                        textStyle: TextStyle(fontSize: 22.sp)),
                    onPressed: () {
                      g.deliveryCharges=dumperCharges.toInt();
                      g.vtype="Dumper";
                      Get.to(const AddToCart());
                    },
                    child: Row(
                      children: const [
                        Text(
                          'Book Now',
                        ),
                        Icon(Icons.arrow_forward_ios_outlined),
                      ],
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
