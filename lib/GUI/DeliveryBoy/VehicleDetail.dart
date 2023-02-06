import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:the_builders/API/TransporterApi/VehicleDetailss.dart';
import 'package:the_builders/Global/global.dart';
import 'package:the_builders/GUI/globalApi.dart' as global;

class VehicleDetails extends StatefulWidget {
  const VehicleDetails({Key? key}) : super(key: key);

  @override
  State<VehicleDetails> createState() => _VehicleDetailsState();
}

class _VehicleDetailsState extends State<VehicleDetails> {

  bool check=true;

  Future<List<VehicleDetail>> vehicledetail(int dbid)async{
    var httprequest =GetConnect();
    var response= await httprequest.get("${global.url}/VehicleDetail?dbid=$dbid");
    var res=vehicleDetailFromJson(response.bodyString!);
    if(res.isEmpty){
      check=false;
    };

    setState(() {
    });

    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(245, 240, 246, 1.0),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromRGBO(102, 103, 171, 1.0),
          title: Text(
            'Details',
            style: TextStyle(color: Colors.white, fontSize: 38.sp),
          ),
        ),
        body: check ? Center(
          child: FutureBuilder<List<VehicleDetail>>(
            future: vehicledetail(int.parse(login_user_id!)),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView(
                  children: [

                    SizedBox(height: 60.h,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      //mainAxisSize: MainAxisSize.max,

                      children: [
                        Text(
                          snapshot.data![0].tType.toString(),
                          style: TextStyle(
                              color: const Color.fromRGBO(204, 41, 54, 1.0),
                              fontSize: 38.sp),
                        ),
                        SizedBox(height: 30.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Registration No :',
                              style: TextStyle(
                                  color: const Color.fromRGBO(204, 41, 54, 1.0),
                                   fontSize: 22.sp),
                            ),
                            SizedBox(
                              width: 30.w,
                            ),
                            Text(
                              snapshot.data![0].tNo.toString(),
                              style: TextStyle(
                                  color: const Color.fromRGBO(204, 41, 54, 1.0),
                                  fontSize: 22.sp),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Model No :',
                              style: TextStyle(
                                  color: const Color.fromRGBO(204, 41, 54, 1.0),
                                  fontSize: 22.sp),
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            Text(
                              snapshot.data![0].modelNo.toString(),
                              style: TextStyle(
                                  color: const Color.fromRGBO(204, 41, 54, 1.0),
                                  fontSize: 22.sp),
                            ),

                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Status :',
                              style: TextStyle(
                                  color: const Color.fromRGBO(204, 41, 54, 1.0),
                                  fontSize: 22.sp),
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            Text(
                              snapshot.data![0].tStatus.toString(),
                              style: TextStyle(
                                  color: const Color.fromRGBO(204, 41, 54, 1.0),
                                  fontSize: 22.sp),
                            ),
                          ],
                        ),
                        SizedBox(height: 40.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // Get.to(
                                //         () => const EditProduct(),
                                //     arguments: [snapshot.data![0].pImage,
                                //       snapshot.data![0].pDesc,
                                //       snapshot.data![0].stock,
                                //       snapshot.data![0].unitcost]
                                // );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromRGBO(102, 103, 171, 1.0),
                              ),
                              child: Text(
                                'Edit',
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // RemoveProduct();
                                // dispose();
                                //setState(() {});
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromRGBO(102, 103, 171, 1.0),
                              ),
                              child: Text(
                                'Remove',
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),

                  ],
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ): const Center(child: Text("No Vehicle Added")));
  }
}
