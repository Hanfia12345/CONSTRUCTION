// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_builders/GUI/CustomerScreens/Cart.dart';

class BookVehicle extends StatefulWidget {
  const BookVehicle({Key? key}) : super(key: key);

  @override
  State<BookVehicle> createState() => _BookVehicleState();
}

class _BookVehicleState extends State<BookVehicle> {
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
                  '400',
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
                        foregroundColor: Colors.green,
                        textStyle: TextStyle(fontSize: 22.sp)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddToCart()));
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
                  'Trawley: ',
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
                  '800',
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
                        foregroundColor: Colors.green,
                        textStyle: TextStyle(fontSize: 22.sp)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddToCart()));
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
                  'Large Trawley: ',
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
                  '1300',
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
                        foregroundColor: Colors.green,
                        textStyle: TextStyle(fontSize: 22.sp)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddToCart()));
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
                  '1400',
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
                        foregroundColor: Colors.green,
                        textStyle: TextStyle(fontSize: 22.sp)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddToCart()));
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
