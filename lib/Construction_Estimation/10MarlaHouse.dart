import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:the_builders/Construction_Estimation/showestimation.dart';

import '../GUI/CustomerScreens/HomePage.dart';
import 'estimationModel.dart';
import 'package:the_builders/GUI/globalApi.dart' as global;
import 'package:the_builders/Global/global.dart';

class tenMarlaHouse extends StatefulWidget {
  const tenMarlaHouse({Key? key}) : super(key: key);

  @override
  State<tenMarlaHouse> createState() => _tenMarlaHouseState();
}

class _tenMarlaHouseState extends State<tenMarlaHouse> {
  TextEditingController coveredarea = TextEditingController();
  TextEditingController wallLength = TextEditingController();
  TextEditingController wallHeight = TextEditingController();
  TextEditingController sandrequired = TextEditingController();
  TextEditingController bricksrequired = TextEditingController();
  TextEditingController cementrequired = TextEditingController();
  TextEditingController steelrequired = TextEditingController();
  TextEditingController crushrequired = TextEditingController();
  TextEditingController labourcostpersqft = TextEditingController();

  TextEditingController labourcost = TextEditingController();
  TextEditingController roricost = TextEditingController();
  TextEditingController cementcost = TextEditingController();
  TextEditingController crushcost = TextEditingController();
  TextEditingController sandcost = TextEditingController();
  TextEditingController steelcost = TextEditingController();
  TextEditingController totalcost = TextEditingController();
  TextEditingController brickscost = TextEditingController();

  bool isvisible = false;
  bool visible = false;


  void storeestimation(double qty,String mat)async{
    var httprequest =GetConnect();
    var response = await httprequest.post(
        '${global.url}/addConstructionbrick?cid=${int.parse(login_user_id!)}&name=${schemeName}&material=${mat}&qty=${qty.toString()}',
        {});
    if (response.statusCode == 200) {
      Get.snackbar("Message", " Added ");
      print(response.statusCode);
      //Get.off(login());
    }
    else{
      Get.snackbar("Message", "${response.statusCode}");
      print(response.body);
    }
  }

  void storeestimationsand(double qty,String mat)async{
    var httprequest =GetConnect();
    var response = await httprequest.post(
        '${global.url}/addConstructionsand?cid=${int.parse(login_user_id!)}&name=${schemeName}&material=${mat}&qty=${qty.toString()}',
        {});
    if (response.statusCode == 200) {
      Get.snackbar("Message", " Added ");
      print(response.statusCode);
      //Get.off(login());
    }

  }
  void storeestimationcrush(double qty,String mat)async{
    var httprequest =GetConnect();
    var response = await httprequest.post(
        '${global.url}/addConstructioncrush?cid=${int.parse(login_user_id!)}&name=${schemeName}&material=${mat}&qty=${qty.toString()}',
        {});
    if (response.statusCode == 200) {
      Get.snackbar("Message", " Added ");
      print(response.statusCode);
      //Get.off(login());
    }

  }


  void storeestimationsteel(double qty,String mat)async{
    var httprequest =GetConnect();
    var response = await httprequest.post(
        '${global.url}/addConstructionsteel?cid=${int.parse(login_user_id!)}&name=${schemeName}&material=${mat}&qty=${qty.toString()}',
        {});
    if (response.statusCode == 200) {
      Get.snackbar("Message", " Added ");
      print(response.statusCode);
      //Get.off(login());
    }

  }
  void storeestimationcement(double qty,String mat)async{
    var httprequest =GetConnect();
    var response = await httprequest.post(
        '${global.url}/addConstructioncement?cid=${int.parse(login_user_id!)}&name=${schemeName}&material=${mat}&qty=${qty.toString()}',
        {});
    if (response.statusCode == 200) {
      Get.snackbar("Message", " Added ");
      print(response.statusCode);
      //Get.off(login());
    }

  }





  List<estimatematerial> listtt=[];

  var schemeName;
  var cementreq;
  var sandreq;
  var steelreq;
  var brickreq;
  var crushreq;
  var sandinplaster;
  var cementinplaster;




  String label = "";
  void RequiredMatrialForHouse() {

    var coveredArea = int.parse(coveredarea.text);
    //if (coveredArea <= 1250 && coveredArea > 0) {
    var totalWall_in_sqft =
        int.parse(wallLength.text) * int.parse(wallHeight.text);
    //print(totalWall_in_sqft);
    var bricks_sqft = 12;
    //var cement_sqft = 0.0194444444;
    var cement_sqft = 0.015;
    //var sand_sqft = 0.071875;
    var sand_sqft = 0.0993377483;

    var totalsand = totalWall_in_sqft * sand_sqft;
    var totalcement = totalWall_in_sqft * cement_sqft;
    var totalbricks = bricks_sqft * totalWall_in_sqft;

    //Roof Estimation For House :
    var totalRoof_in_sqft = coveredArea;
    //var roofThickness = 4;
    var steel_sqft_for_Roof = 0.0023809524;
    var cement_sqft_for_Roof = 0.08648;
    var sand_sqft_for_Roof = 0.141;
    var crush_sqft_for_Roof = 0.2486742857;
    var total_steel_for_Roof = steel_sqft_for_Roof * totalRoof_in_sqft;
    var total_crush_for_Roof = crush_sqft_for_Roof * totalRoof_in_sqft;
    var totalsand_for_Roof = totalRoof_in_sqft * sand_sqft_for_Roof;
    var totalcement_for_Roof = totalRoof_in_sqft * cement_sqft_for_Roof;

    //Foundation Material Requirements for 3 feet

    //for 22.5" inch wall 1 feet height
    var bricks_persqft_in_22_inch=bricks_sqft*2.5;
    var cement_persqft_in_22_inch=cement_sqft*2.5;
    var sand_persqft_in_22_inch=sand_sqft*2.5;
    var total_bricks_in_22_inch=bricks_persqft_in_22_inch*int.parse(wallLength.text);
    var total_cement_in_22_inch=cement_persqft_in_22_inch*int.parse(wallLength.text);
    var total_sand_in_22_inch=sand_persqft_in_22_inch*int.parse(wallLength.text);

    //for 18" inch wall 1 feet height
    var bricks_persqft_in_18_inch=bricks_sqft*2;
    var cement_persqft_in_18_inch=cement_sqft*2;
    var sand_persqft_in_18_inch = sand_sqft*2;
    var total_bricks_in_18_inch=bricks_persqft_in_18_inch*int.parse(wallLength.text);
    var total_cement_in_18_inch=cement_persqft_in_18_inch*int.parse(wallLength.text);
    var total_sand_in_18_inch=sand_persqft_in_18_inch*int.parse(wallLength.text);

    //for 13.5" inch wall 1 feet height
    var bricks_persqft_in_13_inch=bricks_sqft*1.5;
    var cement_persqft_in_13_inch=cement_sqft*1.5;
    var sand_persqft_in_13_inch=sand_sqft*1.5;
    var total_sand_in_13_inch=sand_persqft_in_13_inch*int.parse(wallLength.text);
    var total_bricks_in_13_inch=bricks_persqft_in_13_inch*int.parse(wallLength.text);
    var total_cement_in_13_inch=cement_persqft_in_13_inch*int.parse(wallLength.text);
    var total_bricks_in_foundation=total_bricks_in_22_inch+total_bricks_in_18_inch+total_bricks_in_13_inch;
    var total_cement_in_foundation=total_cement_in_22_inch+total_cement_in_18_inch+total_cement_in_13_inch;
    var total_sand_in_foundation=total_sand_in_22_inch+total_sand_in_18_inch+total_sand_in_13_inch;



    //Total Requirements For House

    var total_Steel_Required = total_steel_for_Roof.toStringAsFixed(2);
    var total_Sand_Required =
    (totalsand_for_Roof + totalsand+total_sand_in_foundation).toStringAsFixed(2);
    var total_Crush_Required = total_crush_for_Roof.toStringAsFixed(2);
    var total_Bricks_Required = totalbricks+total_bricks_in_foundation;
    var total_Cement_Required =
    (totalcement_for_Roof + totalcement+total_cement_in_foundation).toStringAsFixed(2);
    print(total_Bricks_Required);
    print(total_Sand_Required);
    print(total_Cement_Required);
    bricksrequired.text = "${total_Bricks_Required.toString()} Pieces";
    cementrequired.text = "$total_Cement_Required bags";
    sandrequired.text = "$total_Sand_Required Cft";
    steelrequired.text = "$total_Steel_Required Tons";
    crushrequired.text = "$total_Crush_Required Cft";

    var cement_sand_inPlaster=1+6;
    var thicknessintfoot=0.5/12;
    var wetVolumeincft= int.parse(wallLength.text)*int.parse(wallHeight.text)*thicknessintfoot;
    var dryVolumeincft=wetVolumeincft*1.33;
    var cementtotal=dryVolumeincft*1/cement_sand_inPlaster;
    var sandtotal= dryVolumeincft*6/cement_sand_inPlaster;


    cementinplaster=cementtotal/1.22;
    sandinplaster=sandtotal;
    var sandplaster=sandinplaster;
    sandreq=total_Sand_Required;
    cementreq=total_Cement_Required;
    steelreq=total_Steel_Required;
    crushreq= total_Crush_Required;
    brickreq=total_Bricks_Required;
    schemeName="Covered Area : ${coveredArea} Wall Length : ${wallLength.text} Wall Height: ${wallHeight.text}";
    listtt.clear();
    if(listtt.isEmpty){
      listtt.add(estimatematerial(schemename: schemeName,pDesc:"bricks" ,qty: brickreq));
      listtt.add(estimatematerial(schemename: schemeName,pDesc:"cement" ,qty:cementreq ));
      listtt.add(estimatematerial(schemename: schemeName,pDesc:"Thin Ravi sand" ,qty:sandreq ));
      listtt.add(estimatematerial(schemename: schemeName,pDesc:"crush" ,qty: crushreq ));
      listtt.add(estimatematerial(schemename: schemeName,pDesc:"steel" ,qty: steelreq ));
      listtt.add(estimatematerial(schemename: schemeName,pDesc:"Thick Ravi Sand" , qty:sandplaster));
    }

    for(var i in listtt){
      print(i.schemename);
      print(i.pDesc);
      print(i.qty);

    }
    // print(listtt);



    // } else if (coveredArea > 1250) {
    //   label = "Covered Aread Should be less than 1250";
    // }
    //wall Estimation Of House :
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 81, 0),
        title: Text(
          'House Estimate',
          style: TextStyle(color: Colors.white, fontSize: 38.sp),
        ),
      ),
      body: ListView(
        children: [
          Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(5),
              height: 50.h,
              color: Colors.green,
              child: Center(
                  child: Text('Gray Structure Cost - 10 Marla House',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                      )))),
          Container(
            height: 280.h,
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
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
                      'Covered Area ',
                      style: TextStyle(
                          color: const Color.fromARGB(255, 255, 81, 0),
                          fontSize: 28.sp),
                    ),
                  ],
                ),
                Text(
                  label,
                  style: TextStyle(
                      color: const Color.fromARGB(255, 255, 81, 0),
                      fontSize: 14.sp),
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 55.h,
                      width: 340.w,
                      child: TextField(
                          keyboardType: TextInputType.number,
                          controller: coveredarea,
                          style: TextStyle(
                            fontSize: 16.sp,
                          ),
                          decoration: InputDecoration(
                            hintText: "Total Covered Area (Square Feet))",
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
                          keyboardType: TextInputType.number,
                          controller: wallLength,
                          style: TextStyle(
                            fontSize: 16.sp,
                          ),
                          decoration: InputDecoration(
                            hintText: "Wall Length (Foot)",
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
                          keyboardType: TextInputType.number,
                          controller: wallHeight,
                          style: TextStyle(
                            fontSize: 16.sp,
                          ),
                          decoration: InputDecoration(
                            hintText: "Wall Height (Foot)",
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
              ],
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                int coveredArea = int.parse(coveredarea.text);
                if (coveredArea < 2500 && coveredArea > 0) {
                  RequiredMatrialForHouse();
                  isvisible = !isvisible;
                  setState(() {});
                } else if (coveredArea > 2500) {
                  label = "Covered Aread Should be less than 2500";
                  setState(() {});
                } else if (coveredArea < 0) {
                  label = "Covered Aread Should not be less than 0";
                  setState(() {});
                }
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
              height: 750.h,
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
                        'Grey Structure 10 Marla House',
                        style: TextStyle(
                            color: const Color.fromARGB(255, 255, 81, 0),
                            fontSize: 22.sp),
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
                              hintText: "50000",
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
                              hintText: "525 bags",
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
                              hintText: "3850 cft",
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
                        'Steel Required',
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
                              color: const Color.fromARGB(255, 255, 81, 0),
                            ),
                            decoration: InputDecoration(
                              hintText: "1125 kg",
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
                        'Crush Required',
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
                              color: const Color.fromARGB(255, 255, 81, 0),
                            ),
                            decoration: InputDecoration(
                              hintText: "1500 cft",
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
                        //visible = !visible;
                        // setState(() {});
                        Get.to(const CustomerHome());
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32)),
                        backgroundColor: const Color.fromARGB(255, 255, 81, 0),
                        //maximumSize: Size(100.w, 40.h),
                        padding: const EdgeInsets.all(20),
                      ),
                      child: Text(
                        'Go To Shop',
                        style: TextStyle(
                          fontSize: 22.sp,
                          color: Colors.white,
                          //fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        print(brickreq);
                        storeestimation(brickreq ,"brick");
                        storeestimationsand(double.parse(sandreq) ,"sand");
                        storeestimationcrush(double.parse(crushreq) ,"crush");
                        storeestimationsteel(double.parse(crushreq),"steel");
                        storeestimationcement(double.parse(cementreq),"cement");


                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32)),
                        backgroundColor: const Color.fromARGB(255, 255, 81, 0),
                        //maximumSize: Size(100.w, 40.h),
                        padding: const EdgeInsets.all(20),
                      ),
                      child: Text(
                        'Save Requirements',
                        style: TextStyle(
                          fontSize: 22.sp,
                          color: Colors.white,
                          //fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(ShowEstimation());
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32)),
                        backgroundColor: const Color.fromARGB(255, 255, 81, 0),
                        //maximumSize: Size(100.w, 40.h),
                        padding: const EdgeInsets.all(20),
                      ),
                      child: Text(
                        'Save Requirements',
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
        ],
      ),
    );
  }
}
