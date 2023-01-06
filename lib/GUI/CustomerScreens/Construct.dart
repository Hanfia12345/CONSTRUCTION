//import 'dart:html';

// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:the_builders/Construction_Estimation/HouseEstimation.dart';

class Estimate extends StatefulWidget {
  const Estimate({Key? key}) : super(key: key);

  @override
  State<Estimate> createState() => _EstimateState();
}

class _EstimateState extends State<Estimate> {
  String DropdownValue = 'Wall';
  var items = ['Wall', 'Roof', 'wall Paster', 'Floor'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
            height: 200.h,
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/est1.jpg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(132, 229, 255, 0),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      )),
                  child: Text(
                    'Contruction Material Estimation ',
                    style: TextStyle(
                        color: const Color.fromARGB(255, 255, 81, 0),
                        fontSize: 20.sp),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 35),
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(100, 0, 0, 0),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      )),
                  child: Text(
                    'Estimate All Building Materials ',
                    style: TextStyle(
                        color: const Color.fromARGB(255, 229, 255, 0),
                        fontSize: 20.sp),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
                color: Color.fromARGB(132, 229, 255, 0),
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DropdownButtonHideUnderline(
                      child: DropdownButton(
                          value: DropdownValue,
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: Color.fromARGB(255, 255, 81, 0),
                          ),
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(
                                items,
                                style: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 255, 81, 0),
                                    fontSize: 22.sp),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              DropdownValue = newValue!;
                            });
                          }),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (DropdownValue == 'Wall') {
                          Get.to(() => const EstimateButton());
                        }
                        if (DropdownValue == 'Roof') {
                          Get.to(() => const RoofEstimate());
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[400],
                      ),
                      child: Text(
                        'Estimate >',
                        style: TextStyle(
                            fontSize: 18.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const fiveMarlaHouse()));
            },
            child: Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                    color: Color.fromARGB(132, 229, 255, 0),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    )),
                child: Center(
                  child: Column(
                    children: [
                      Icon(
                        Icons.house,
                        size: 55.r,
                        color: Colors.green,
                      ),
                      Text(
                        '3 Marla House Estimate',
                        style: TextStyle(
                            fontSize: 22.sp,
                            color: const Color.fromARGB(255, 255, 81, 0),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const fiveMarlaHouse()));
            },
            child: Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                    color: Color.fromARGB(132, 229, 255, 0),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    )),
                child: Center(
                  child: Column(
                    children: [
                      Icon(
                        Icons.house,
                        size: 55.r,
                        color: Colors.green,
                      ),
                      Text(
                        '5 Marla House Estimate',
                        style: TextStyle(
                            fontSize: 22.sp,
                            color: const Color.fromARGB(255, 255, 81, 0),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const fiveMarlaHouse()));
            },
            child: Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                    color: Color.fromARGB(132, 229, 255, 0),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    )),
                child: Center(
                  child: Column(
                    children: [
                      Icon(
                        Icons.house,
                        size: 55.r,
                        color: Colors.green,
                      ),
                      Text(
                        '10 Marla House Estimate',
                        style: TextStyle(
                            fontSize: 22.sp,
                            color: const Color.fromARGB(255, 255, 81, 0),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

class EstimateButton extends StatefulWidget {
  const EstimateButton({Key? key}) : super(key: key);

  @override
  State<EstimateButton> createState() => _EstimateButtonState();
}

class _EstimateButtonState extends State<EstimateButton> {
  String DropdownValue = '9"';
  var items = ['9"', '4.5"', '13"'];

  TextEditingController wallheight = TextEditingController();
  TextEditingController wallLength = TextEditingController();
  TextEditingController bricksrequired = TextEditingController();
  TextEditingController cementrequired = TextEditingController();
  TextEditingController sandrequired = TextEditingController();
  bool isvisible = false;
  bool visible = false;
  void wallEstimate() {
    if (DropdownValue == '9"') {
      int length = int.parse(wallLength.text);
      int height = int.parse(wallheight.text);
      var total_sqft = length * height;
      var bricks_sqft = 12;
      var cement_sqft = 0.0194444444;
      var sand_sqft = 0.071875;
      var totalsand = (total_sqft * sand_sqft).toStringAsFixed(2);
      var totalcement = (total_sqft * cement_sqft).toStringAsFixed(2);
      var totalbricks = bricks_sqft * total_sqft;
      bricksrequired.text = "$totalbricks Pieces";
      cementrequired.text = "$totalcement bags";
      sandrequired.text = "$totalsand cuft";
    }
    if (DropdownValue == '4.5"') {
      int length = int.parse(wallLength.text);
      int height = int.parse(wallheight.text);
      var total_sqft = length * height;
      var bricks_sqft = 12 / 2;
      var cement_sqft = 0.0194444444 / 2;
      var sand_sqft = 0.071875 / 2;
      var totalsand = (total_sqft * sand_sqft).toStringAsFixed(2);
      var totalcement = (total_sqft * cement_sqft).toStringAsFixed(2);
      var totalbricks = bricks_sqft * total_sqft;
      bricksrequired.text = "$totalbricks Pieces";
      cementrequired.text = "$totalcement bags";
      sandrequired.text = "$totalsand cuft";
    }
    if (DropdownValue == '13"') {
      int length = int.parse(wallLength.text);
      int height = int.parse(wallheight.text);
      var total_sqft = length * height;
      var bricks_sqft = 12 * 1.5;
      var cement_sqft = 0.0194444444 * 1.5;
      var sand_sqft = 0.071875 * 1.5;
      var totalsand = (total_sqft * sand_sqft).toStringAsFixed(2);
      var totalcement = (total_sqft * cement_sqft).toStringAsFixed(2);
      var totalbricks = bricks_sqft * total_sqft;
      bricksrequired.text = "$totalbricks Pieces";
      cementrequired.text = "$totalcement bags";
      sandrequired.text = "$totalsand cuft";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 81, 0),
        title: Text(
          'Wall',
          style: TextStyle(color: Colors.white, fontSize: 38.sp),
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: 300.h,
            margin: const EdgeInsets.fromLTRB(10, 30, 10, 20),
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
                  children: [
                    Text(
                      'Walls Dimensions',
                      style: TextStyle(
                          color: const Color.fromARGB(255, 255, 81, 0),
                          fontSize: 28.sp),
                    )
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 55.h,
                      width: 340.w,
                      child: TextField(
                          controller: wallheight,
                          style: TextStyle(
                            fontSize: 16.sp,
                          ),
                          decoration: InputDecoration(
                            hintText: "Walls Height (Feet)",
                            // hintStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.white,
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 55.h,
                      width: 340.w,
                      child: TextField(
                          controller: wallLength,
                          style: TextStyle(
                            fontSize: 16.sp,
                          ),
                          decoration: InputDecoration(
                            hintText: "Walls Length (Feet)",
                            //hintStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.white,
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 55.h,
                  width: 340.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Thickness In Inches",
                          style: TextStyle(fontSize: 22.sp)),
                      DropdownButton(
                          borderRadius: BorderRadius.circular(5),
                          value: DropdownValue,
                          icon: const Icon(
                            Icons.arrow_drop_down_outlined,
                            color: Color.fromARGB(255, 255, 81, 0),
                          ),
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(
                                items,
                                style: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 255, 81, 0),
                                    fontSize: 22.sp),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              DropdownValue = newValue!;
                            });
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                wallEstimate();
                isvisible = !isvisible;
                setState(() {});
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32)),
                backgroundColor: const Color.fromARGB(255, 255, 81, 0),
                //maximumSize: Size(100.w, 40.h),
                padding: const EdgeInsets.all(20),
              ),
              child: Text(
                'Calculate',
                style: TextStyle(
                  fontSize: 22.sp,
                  color: Colors.white,
                  //fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          Visibility(
            visible: isvisible,
            child: Container(
              height: 450.h,
              margin: const EdgeInsets.fromLTRB(10, 30, 10, 20),
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
                    children: [
                      Text(
                        'Walls Requirements',
                        style: TextStyle(
                            color: const Color.fromARGB(255, 255, 81, 0),
                            fontSize: 28.sp),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Bricks Required',
                        style: TextStyle(
                            color: const Color.fromARGB(255, 255, 81, 0),
                            fontSize: 20.sp),
                      ),
                      SizedBox(
                        height: 50.h,
                        width: 180.w,
                        child: TextField(
                            readOnly: true,
                            controller: bricksrequired,
                            style: TextStyle(
                              color: const Color.fromARGB(255, 255, 81, 0),
                              fontSize: 16.sp,
                            ),
                            decoration: InputDecoration(
                              //hintText: "1728",
                              //hintStyle: TextStyle(
                              // color: Color.fromARGB(255, 255, 81, 0),
                              //),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                            )),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Cement Required',
                        style: TextStyle(
                            color: const Color.fromARGB(255, 255, 81, 0),
                            fontSize: 20.sp),
                      ),
                      SizedBox(
                        height: 50.h,
                        width: 180.w,
                        child: TextField(
                            readOnly: true,
                            controller: cementrequired,
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: const Color.fromARGB(255, 255, 81, 0),
                            ),
                            decoration: InputDecoration(
                              hintText: "2.8 bags",
                              hintStyle: const TextStyle(
                                  color: Color.fromARGB(255, 255, 81, 0)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                            )),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Sand Required',
                        style: TextStyle(
                            color: const Color.fromARGB(255, 255, 81, 0),
                            fontSize: 20.sp),
                      ),
                      SizedBox(
                        height: 50.h,
                        width: 180.w,
                        child: TextField(
                            readOnly: true,
                            controller: sandrequired,
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: const Color.fromARGB(255, 255, 81, 0),
                            ),
                            decoration: InputDecoration(
                              hintText: "10.35 cft",
                              hintStyle: const TextStyle(
                                  color: Color.fromARGB(255, 255, 81, 0)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                            )),
                      ),
                    ],
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        visible = !visible;
                        setState(() {});
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32)),
                        backgroundColor: const Color.fromARGB(255, 255, 81, 0),
                        //maximumSize: Size(100.w, 40.h),
                        padding: const EdgeInsets.all(20),
                      ),
                      child: Text(
                        'Calculate Cost',
                        style: TextStyle(
                          fontSize: 22.sp,
                          color: Colors.white,
                          //fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: visible,
            child: Container(
              height: 450.h,
              margin: const EdgeInsets.fromLTRB(10, 30, 10, 20),
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
                    children: [
                      Text(
                        'Walls Cost',
                        style: TextStyle(
                            color: const Color.fromARGB(255, 255, 81, 0),
                            fontSize: 28.sp),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Bricks Cost',
                        style: TextStyle(
                            color: const Color.fromARGB(255, 255, 81, 0),
                            fontSize: 20.sp),
                      ),
                      SizedBox(
                        height: 50.h,
                        width: 180.w,
                        child: TextField(
                            readOnly: true,
                            controller: bricksrequired,
                            style: TextStyle(
                              color: const Color.fromARGB(255, 255, 81, 0),
                              fontSize: 16.sp,
                            ),
                            decoration: InputDecoration(
                              hintText: "17280 Rs",
                              hintStyle: const TextStyle(
                                  color: Color.fromARGB(255, 255, 81, 0)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                            )),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Cement Cost',
                        style: TextStyle(
                            color: const Color.fromARGB(255, 255, 81, 0),
                            fontSize: 20.sp),
                      ),
                      SizedBox(
                        height: 50.h,
                        width: 180.w,
                        child: TextField(
                            readOnly: true,
                            controller: cementrequired,
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: const Color.fromARGB(255, 255, 81, 0),
                            ),
                            decoration: InputDecoration(
                              hintText: "2160 Rs",
                              hintStyle: const TextStyle(
                                  color: Color.fromARGB(255, 255, 81, 0)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                            )),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Sand Cost',
                        style: TextStyle(
                            color: const Color.fromARGB(255, 255, 81, 0),
                            fontSize: 20.sp),
                      ),
                      SizedBox(
                        height: 50.h,
                        width: 180.w,
                        child: TextField(
                            readOnly: true,
                            controller: sandrequired,
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: const Color.fromARGB(255, 255, 81, 0),
                            ),
                            decoration: InputDecoration(
                              hintText: "207 Rs",
                              hintStyle: const TextStyle(
                                  color: Color.fromARGB(255, 255, 81, 0)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                            )),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Cost',
                        style: TextStyle(
                            color: const Color.fromARGB(255, 255, 81, 0),
                            fontSize: 20.sp),
                      ),
                      SizedBox(
                        height: 50.h,
                        width: 180.w,
                        child: TextField(
                            readOnly: true,
                            controller: sandrequired,
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: const Color.fromARGB(255, 255, 81, 0),
                            ),
                            decoration: InputDecoration(
                              hintText: "19647 Rs",
                              hintStyle: const TextStyle(
                                  color: Color.fromARGB(255, 255, 81, 0)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RoofEstimate extends StatefulWidget {
  const RoofEstimate({super.key});

  @override
  State<RoofEstimate> createState() => _RoofEstimateState();
}

class _RoofEstimateState extends State<RoofEstimate> {
  String DropdownValue = '4"';
  var items = ['4"', '5"', '6"'];
  TextEditingController RoofWidth = TextEditingController();
  TextEditingController RoofLength = TextEditingController();
  TextEditingController crushrequired = TextEditingController();
  TextEditingController cementrequired = TextEditingController();
  TextEditingController sandrequired = TextEditingController();
  TextEditingController steelrequired = TextEditingController();
  bool isvisible = false;
  bool visible = false;
  void RoofEstimate() {
    if (DropdownValue == '4"') {
      int length = int.parse(RoofLength.text);
      int Width = int.parse(RoofWidth.text);
      var total_sqft = length * Width;
      var steel_sqft = 0.0023809524;
      var cement_sqft = 0.08648;
      var sand_sqft = 0.141;
      var crush_sqft = 0.2486742857;
      var total_steel = (steel_sqft * total_sqft).toStringAsFixed(2);
      //print(total_steel);
      var total_crush = (crush_sqft * total_sqft).toStringAsFixed(2);
      var totalsand = (total_sqft * sand_sqft).toStringAsFixed(2);
      var totalcement = (total_sqft * cement_sqft).toStringAsFixed(2);
      steelrequired.text = "$total_steel ton";
      crushrequired.text = "$total_crush cuft";
      cementrequired.text = "$totalcement bags";
      sandrequired.text = "$totalsand cuft";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 255, 81, 0),
          title: Text(
            'Roof',
            style: TextStyle(color: Colors.white, fontSize: 38.sp),
          ),
        ),
        body: ListView(children: [
          Container(
            height: 300.h,
            margin: const EdgeInsets.fromLTRB(10, 30, 10, 20),
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
                  children: [
                    Text(
                      'Roof Dimensions',
                      style: TextStyle(
                          color: const Color.fromARGB(255, 255, 81, 0),
                          fontSize: 28.sp),
                    )
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 55.h,
                      width: 340.w,
                      child: TextField(
                          controller: RoofLength,
                          style: TextStyle(
                            fontSize: 16.sp,
                          ),
                          decoration: InputDecoration(
                            hintText: "Roof Length (Feet)",
                            // hintStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.white,
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 55.h,
                      width: 340.w,
                      child: TextField(
                          controller: RoofWidth,
                          style: TextStyle(
                            fontSize: 16.sp,
                          ),
                          decoration: InputDecoration(
                            hintText: "Roof Width (Feet)",
                            //hintStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.white,
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 55.h,
                  width: 340.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Thickness In Inches",
                          style: TextStyle(fontSize: 22.sp)),
                      DropdownButton(
                          borderRadius: BorderRadius.circular(5),
                          value: DropdownValue,
                          icon: const Icon(
                            Icons.arrow_drop_down_outlined,
                            color: Color.fromARGB(255, 255, 81, 0),
                          ),
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(
                                items,
                                style: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 255, 81, 0),
                                    fontSize: 22.sp),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              DropdownValue = newValue!;
                            });
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                RoofEstimate();
                isvisible = !isvisible;
                setState(() {});
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32)),
                backgroundColor: const Color.fromARGB(255, 255, 81, 0),
                //maximumSize: Size(100.w, 40.h),
                padding: const EdgeInsets.all(20),
              ),
              child: Text(
                'Calculate',
                style: TextStyle(
                  fontSize: 22.sp,
                  color: Colors.white,
                  //fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          Visibility(
              visible: isvisible,
              child: Container(
                  height: 450.h,
                  margin: const EdgeInsets.fromLTRB(10, 30, 10, 20),
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
                          children: [
                            Text(
                              'Roof Requirements',
                              style: TextStyle(
                                  color: const Color.fromARGB(255, 255, 81, 0),
                                  fontSize: 28.sp),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'cement Required',
                              style: TextStyle(
                                  color: const Color.fromARGB(255, 255, 81, 0),
                                  fontSize: 20.sp),
                            ),
                            SizedBox(
                              height: 50.h,
                              width: 180.w,
                              child: TextField(
                                  readOnly: true,
                                  controller: cementrequired,
                                  style: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 255, 81, 0),
                                    fontSize: 16.sp,
                                  ),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'steel Required',
                              style: TextStyle(
                                  color: const Color.fromARGB(255, 255, 81, 0),
                                  fontSize: 20.sp),
                            ),
                            SizedBox(
                              height: 50.h,
                              width: 180.w,
                              child: TextField(
                                  readOnly: true,
                                  controller: steelrequired,
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color:
                                        const Color.fromARGB(255, 255, 81, 0),
                                  ),
                                  decoration: InputDecoration(
                                    //hintText: "2.8 bags",
                                    hintStyle: const TextStyle(
                                        color: Color.fromARGB(255, 255, 81, 0)),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Sand Required',
                              style: TextStyle(
                                  color: const Color.fromARGB(255, 255, 81, 0),
                                  fontSize: 20.sp),
                            ),
                            SizedBox(
                              height: 50.h,
                              width: 180.w,
                              child: TextField(
                                  readOnly: true,
                                  controller: sandrequired,
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color:
                                        const Color.fromARGB(255, 255, 81, 0),
                                  ),
                                  decoration: InputDecoration(
                                    //hintText: "10.35 cft",
                                    hintStyle: const TextStyle(
                                        color: Color.fromARGB(255, 255, 81, 0)),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'crush Required',
                              style: TextStyle(
                                  color: const Color.fromARGB(255, 255, 81, 0),
                                  fontSize: 20.sp),
                            ),
                            SizedBox(
                              height: 50.h,
                              width: 180.w,
                              child: TextField(
                                  readOnly: true,
                                  controller: crushrequired,
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color:
                                        const Color.fromARGB(255, 255, 81, 0),
                                  ),
                                  decoration: InputDecoration(
                                    hintText: "10.35 cft",
                                    hintStyle: const TextStyle(
                                        color: Color.fromARGB(255, 255, 81, 0)),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ])))
        ]));
  }
}
