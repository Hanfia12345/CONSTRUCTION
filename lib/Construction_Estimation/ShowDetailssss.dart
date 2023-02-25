import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'ConstructionDetails.dart';

class Showdetailllsss extends StatefulWidget {
  const Showdetailllsss({Key? key}) : super(key: key);

  @override
  State<Showdetailllsss> createState() => _ShowdetailllsssState();
}

class _ShowdetailllsssState extends State<Showdetailllsss> {
  var vid = Get.arguments;

  List<dynamic> materialname = List.empty(growable: true);
  List<dynamic> ItemsQty = List.empty(growable: true);
  List<dynamic> ItemsCost = List.empty(growable: true);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 255, 81, 0),
          title: Text(
            'Details',
            style: TextStyle(color: Colors.white, fontSize: 38.sp),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 20.h,
              ),
              FutureBuilder<List<schemeDetails>>(
                future: getSchemeDetails(vid[0]),
                builder: (context, snapshot) {

                  if (snapshot.hasData) {

                    List<schemeDetails> Order =
                    snapshot.data as List<schemeDetails>;
                    if (materialname.isEmpty) {
                      for (var i in Order) {
                        materialname.add(i.material);
                        //OrderItems.add(i.pQty);
                      }
                    }
                    if (ItemsQty.isEmpty) {
                      for (var i in Order) {
                        ItemsQty.add(i.quantity);
                        //OrderItems.add(i.pQty);
                      }
                    }
                    if (ItemsCost.isEmpty) {
                      for (var i in Order) {
                        ItemsCost.add(i.cost);
                        //OrderItems.add(i.pQty);
                      }
                    }

                    //print(snapshot.data);

                    //print(snapshot.data![0].name.toString());
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        ListView.builder(

                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            //print(vid[1]);
                            // status=snapshot.data![index].orderstatus
                            // .toString();
                            return Column(
                              children: [
                                Row(
                                  children: [

                                    Text(
                                      vid[0].toString(),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 14.sp),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Container(
                                  height: 80.h,
                                                                 ),
                                SizedBox(
                                  height: 10.h,
                                ),

                                                              ],

                            );
                          },
                        ),
                        const Divider(
                          height: 3,
                          color: Colors.white,
                        ),

                        Center(
                          child: Text(' Items & Quantity and cost',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 25.sp)),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        SizedBox(
                          height: 520.h,
                          child: ListView.builder(
                              itemCount: materialname.length,
                              itemBuilder: (context, index) {
                                return SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              ">${materialname[index].toString()} : ",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 22.sp),
                                            ),
//SizedBox(width: 10.w,),
                                            Text(
                                              "${ItemsQty[index].toString()} ",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 22.sp),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "${ItemsCost[index].toString()} ",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16.sp),
                                        ),
                                        const Divider(
                                          height: 2,
                                          color: Colors.white,
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return const CircularProgressIndicator();
                },
              ),



            ],
          ),
        ));
  }
}
