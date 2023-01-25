// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_builders/GUI/CustomerScreens/HomePage.dart';
import 'package:the_builders/GUI/CustomerScreens/ProductDetail.dart';
import 'package:the_builders/GUI/loginpages.dart';

class ProductFromDifferentVendors extends StatefulWidget {
  const ProductFromDifferentVendors({Key? key}) : super(key: key);

  @override
  State<ProductFromDifferentVendors> createState() =>
      _ProductFromDifferentVendorsState();
}

class _ProductFromDifferentVendorsState
    extends State<ProductFromDifferentVendors> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 81, 0),
        title: Text(
          'Bricks',
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CustomerHome()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.construction,
                color: const Color.fromARGB(255, 255, 81, 0),
                size: 33.r,
              ),
              title: Text(
                'Construct',
                style: TextStyle(
                    color: const Color.fromARGB(255, 255, 81, 0),
                    fontSize: 22.sp),
              ),
              onTap: () {},
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
            height: 20.h,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProductDetail()));
              },
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 180.w,
                      height: 140.h,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          //border: Border.all(width: 1.w),
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/b.png',
                            ),
                            fit: BoxFit.cover,
                          )),
                    ),
                    SizedBox(
                      width: 180.w,
                      child: Text(
                        'Bricks',
                        style: TextStyle(fontSize: 20.sp, color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      width: 180.w,
                      child: Text(
                        'Pak Bricks Work',
                        style: TextStyle(color: Colors.black, fontSize: 20.sp),
                      ),
                    ),
                    SizedBox(
                      width: 180.w,
                      child: Row(
                        children: [
                          Text(
                            'Rs. ',
                            style: TextStyle(
                                color: const Color.fromARGB(255, 255, 81, 0),
                                fontSize: 20.sp),
                          ),
                          Text(
                            '13',
                            style: TextStyle(
                                color: const Color.fromARGB(255, 255, 81, 0),
                                fontSize: 20.sp),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const ProductFromDifferentVendors()));
              },
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 180.w,
                      height: 140.h,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/b.png',
                            ),
                            fit: BoxFit.cover,
                          )),
                    ),
                    SizedBox(
                      width: 180.w,
                      child: Text(
                        'Bricks',
                        style: TextStyle(fontSize: 20.sp, color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      width: 180.w,
                      child: Text(
                        'Rwp Brick Store',
                        style: TextStyle(color: Colors.black, fontSize: 20.sp),
                      ),
                    ),
                    SizedBox(
                      width: 180.w,
                      child: Row(
                        children: [
                          Text(
                            'Rs. ',
                            style: TextStyle(
                                color: const Color.fromARGB(255, 255, 81, 0),
                                fontSize: 20.sp),
                          ),
                          Text(
                            '12',
                            style: TextStyle(
                                color: const Color.fromARGB(255, 255, 81, 0),
                                fontSize: 20.sp),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
          SizedBox(
            height: 7.h,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const ProductFromDifferentVendors()));
              },
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 180.w,
                      height: 140.h,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/b.png',
                            ),
                            fit: BoxFit.cover,
                          )),
                    ),
                    SizedBox(
                      width: 180.w,
                      child: Text(
                        'Brick',
                        style: TextStyle(fontSize: 20.sp, color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      width: 180.w,
                      child: Text(
                        'MJ Building Material',
                        style: TextStyle(color: Colors.black, fontSize: 18.sp),
                      ),
                    ),
                    SizedBox(
                      width: 180.w,
                      child: Row(
                        children: [
                          Text(
                            'Rs. ',
                            style: TextStyle(
                                color: const Color.fromARGB(255, 255, 81, 0),
                                fontSize: 20.sp),
                          ),
                          Text(
                            '12',
                            style: TextStyle(
                                color: const Color.fromARGB(255, 255, 81, 0),
                                fontSize: 20.sp),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const ProductFromDifferentVendors()));
              },
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 180.w,
                      height: 140.h,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/b.png',
                            ),
                            fit: BoxFit.cover,
                          )),
                    ),
                    SizedBox(
                      width: 180.w,
                      child: Text(
                        'Bricks',
                        style: TextStyle(fontSize: 20.sp, color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      width: 180.w,
                      child: Text(
                        'Ali Constructions',
                        style: TextStyle(color: Colors.black, fontSize: 20.sp),
                      ),
                    ),
                    SizedBox(
                      width: 180.w,
                      child: Row(
                        children: [
                          Text(
                            'Rs. ',
                            style: TextStyle(
                                color: const Color.fromARGB(255, 255, 81, 0),
                                fontSize: 20.sp),
                          ),
                          Text(
                            '13',
                            style: TextStyle(
                                color: const Color.fromARGB(255, 255, 81, 0),
                                fontSize: 20.sp),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
          SizedBox(
            height: 7.h,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const ProductFromDifferentVendors()));
              },
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 180.w,
                      height: 140.h,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/b.png',
                            ),
                            fit: BoxFit.cover,
                          )),
                    ),
                    SizedBox(
                      width: 180.w,
                      child: Text(
                        'Bricks',
                        style: TextStyle(fontSize: 20.sp, color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      width: 180.w,
                      child: Text(
                        'Pak Bricks Work',
                        style: TextStyle(color: Colors.black, fontSize: 20.sp),
                      ),
                    ),
                    SizedBox(
                      width: 180.w,
                      child: Row(
                        children: [
                          Text(
                            'Rs. ',
                            style: TextStyle(
                                color: const Color.fromARGB(255, 255, 81, 0),
                                fontSize: 20.sp),
                          ),
                          Text(
                            '11',
                            style: TextStyle(
                                color: const Color.fromARGB(255, 255, 81, 0),
                                fontSize: 20.sp),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const ProductFromDifferentVendors()));
              },
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 180.w,
                      height: 140.h,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/b.png',
                            ),
                            fit: BoxFit.cover,
                          )),
                    ),
                    SizedBox(
                      width: 180.w,
                      child: Text(
                        'Bricks',
                        style: TextStyle(fontSize: 20.sp, color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      width: 180.w,
                      child: Text(
                        'Pak Bricks Work',
                        style: TextStyle(color: Colors.black, fontSize: 20.sp),
                      ),
                    ),
                    SizedBox(
                      width: 180.w,
                      child: Row(
                        children: [
                          Text(
                            'Rs. ',
                            style: TextStyle(
                                color: const Color.fromARGB(255, 255, 81, 0),
                                fontSize: 20.sp),
                          ),
                          Text(
                            '9',
                            style: TextStyle(
                                color: const Color.fromARGB(255, 255, 81, 0),
                                fontSize: 20.sp),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
          SizedBox(
            height: 7.h,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const ProductFromDifferentVendors()));
              },
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 180.w,
                      height: 140.h,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/b.png',
                            ),
                            fit: BoxFit.cover,
                          )),
                    ),
                    SizedBox(
                      width: 180.w,
                      child: Text(
                        'Bricks',
                        style: TextStyle(fontSize: 20.sp, color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      width: 180.w,
                      child: Text(
                        'Rwp Brick Store',
                        style: TextStyle(color: Colors.black, fontSize: 20.sp),
                      ),
                    ),
                    SizedBox(
                      width: 180.w,
                      child: Row(
                        children: [
                          Text(
                            'Rs. ',
                            style: TextStyle(
                                color: const Color.fromARGB(255, 255, 81, 0),
                                fontSize: 20.sp),
                          ),
                          Text(
                            '11',
                            style: TextStyle(
                                color: const Color.fromARGB(255, 255, 81, 0),
                                fontSize: 20.sp),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const ProductFromDifferentVendors()));
              },
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 180.w,
                      height: 140.h,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/b.png',
                            ),
                            fit: BoxFit.cover,
                          )),
                    ),
                    SizedBox(
                      width: 180.w,
                      child: Text(
                        'Bricks',
                        style: TextStyle(fontSize: 20.sp, color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      width: 180.w,
                      child: Text(
                        'Rwp Bricks Store',
                        style: TextStyle(color: Colors.black, fontSize: 20.sp),
                      ),
                    ),
                    SizedBox(
                      width: 180.w,
                      child: Row(
                        children: [
                          Text(
                            'Rs. ',
                            style: TextStyle(
                                color: const Color.fromARGB(255, 255, 81, 0),
                                fontSize: 20.sp),
                          ),
                          Text(
                            '9',
                            style: TextStyle(
                                color: const Color.fromARGB(255, 255, 81, 0),
                                fontSize: 20.sp),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
          SizedBox(
            height: 7.h,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const ProductFromDifferentVendors()));
              },
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 180.w,
                      height: 140.h,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/b.png',
                            ),
                            fit: BoxFit.cover,
                          )),
                    ),
                    SizedBox(
                      width: 180.w,
                      child: Text(
                        'Bricks',
                        style: TextStyle(fontSize: 20.sp, color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      width: 180.w,
                      child: Text(
                        'MJ Buiding Material',
                        style: TextStyle(color: Colors.black, fontSize: 20.sp),
                      ),
                    ),
                    SizedBox(
                      width: 180.w,
                      child: Row(
                        children: [
                          Text(
                            'Rs. ',
                            style: TextStyle(
                                color: const Color.fromARGB(255, 255, 81, 0),
                                fontSize: 20.sp),
                          ),
                          Text(
                            '8',
                            style: TextStyle(
                                color: const Color.fromARGB(255, 255, 81, 0),
                                fontSize: 20.sp),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const ProductFromDifferentVendors()));
              },
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 180.w,
                      height: 140.h,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/b.png',
                            ),
                            fit: BoxFit.cover,
                          )),
                    ),
                    SizedBox(
                      width: 180.w,
                      child: Text(
                        'Bricks',
                        style: TextStyle(fontSize: 20.sp, color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      width: 180.w,
                      child: Text(
                        'Ali Construction',
                        style: TextStyle(color: Colors.black, fontSize: 20.sp),
                      ),
                    ),
                    SizedBox(
                      width: 180.w,
                      child: Row(
                        children: [
                          Text(
                            'Rs. ',
                            style: TextStyle(
                                color: const Color.fromARGB(255, 255, 81, 0),
                                fontSize: 20.sp),
                          ),
                          Text(
                            '8',
                            style: TextStyle(
                                color: const Color.fromARGB(255, 255, 81, 0),
                                fontSize: 20.sp),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
          SizedBox(
            height: 7.h,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const ProductFromDifferentVendors()));
              },
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 180.w,
                      height: 140.h,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/b.png',
                            ),
                            fit: BoxFit.cover,
                          )),
                    ),
                    SizedBox(
                      width: 180.w,
                      child: Text(
                        'Bricks',
                        style: TextStyle(fontSize: 20.sp, color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      width: 180.w,
                      child: Text(
                        'MJ Building Material',
                        style: TextStyle(color: Colors.black, fontSize: 20.sp),
                      ),
                    ),
                    SizedBox(
                      width: 180.w,
                      child: Row(
                        children: [
                          Text(
                            'Rs. ',
                            style: TextStyle(
                                color: const Color.fromARGB(255, 255, 81, 0),
                                fontSize: 20.sp),
                          ),
                          Text(
                            '10',
                            style: TextStyle(
                                color: const Color.fromARGB(255, 255, 81, 0),
                                fontSize: 20.sp),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const ProductFromDifferentVendors()));
              },
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 180.w,
                      height: 140.h,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/b.png',
                            ),
                            fit: BoxFit.cover,
                          )),
                    ),
                    SizedBox(
                      width: 180.w,
                      child: Text(
                        'Bricks',
                        style: TextStyle(fontSize: 20.sp, color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      width: 180.w,
                      child: Text(
                        'ALi Constructions',
                        style: TextStyle(color: Colors.black, fontSize: 20.sp),
                      ),
                    ),
                    SizedBox(
                      width: 180.w,
                      child: Row(
                        children: [
                          Text(
                            'Rs. ',
                            style: TextStyle(
                                color: const Color.fromARGB(255, 255, 81, 0),
                                fontSize: 20.sp),
                          ),
                          Text(
                            '9',
                            style: TextStyle(
                                color: const Color.fromARGB(255, 255, 81, 0),
                                fontSize: 20.sp),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
          SizedBox(
            height: 7.h,
          ),
        ],
      ),
    );
  }
}
