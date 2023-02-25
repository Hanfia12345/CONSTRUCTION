import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:the_builders/Construction_Estimation/schemenamesss.dart';
import 'package:the_builders/GUI/globalApi.dart' as global;

import '../Global/global.dart';
import 'ShowDetailssss.dart';

class ShowEstimation extends StatefulWidget {
  const ShowEstimation({Key? key}) : super(key: key);

  @override
  State<ShowEstimation> createState() => _ShowEstimationState();
}

class _ShowEstimationState extends State<ShowEstimation> {

  List schemenames = [];
  String error = '';

  @override
  void initState() {
    super.initState();
    getschemeNames();
  }


  Future<List<schemeName>> getschemeNames() async {
    var httprequest = GetConnect();
    var response =
    await httprequest.get("${global.url}/ShowConstructionScheme?cid=${int.parse(login_user_id!)}");

    var res = schemeNameFromJson(response.bodyString!);
    return res;
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order History'),
      ),
      body: Container(
        child: Column(
          children: [
            FutureBuilder<List<schemeName>>(
              future: getschemeNames(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SingleChildScrollView(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                            //contentPadding:
                            //EdgeInsets.fromLTRB(70.w, 0.h, 30.w, 0.h),
                            leading: Text(snapshot.data![index].schemename,
                                style: TextStyle(
                                     fontSize: 10.sp)),
                            trailing: TextButton(
                              onPressed: () {
                                Get.to(const Showdetailllsss(),
                                    arguments: [snapshot.data![index].schemename]);
                              },
                              child: Text('Show Details',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 18.sp,
                                      decoration: TextDecoration.underline)),
                            ));
                      },
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              },
            ),



          //   Expanded(
          //     child:ListView.builder(
          //       itemCount: schemenames.length,
          //       itemBuilder: (context, index) {
          //         return Container(
          //           height: 200.h,
          //           child: Column(
          //             children: [
          //               Container(
          //
          //                 color: Colors.blue[300],
          //                 child: Text(
          //                   'SchemeName = ${schemenames[index]['schemeName']}',
          //                   style: TextStyle(
          //                     color: Colors.white,
          //                   ),
          //                 ),
          //               ),
          //               // FutureBuilder<List<OrderDetailsForDelivery>>(
          //               //   future: getOrderDetails(orderIds[index]['oid']),
          //               //   builder: (context, snapshot) {
          //               //     if (snapshot.hasData) {
          //               //       List<OrderDetailsForDelivery>? orderDetails = snapshot.data;
          //               //       return Container(
          //               //         child: Column(
          //               //           children: [
          //               //             for (var orderDetail in orderDetails!)
          //               //               Container(
          //               //
          //               //                 color: Colors.grey[300],
          //               //                 child: Column(mainAxisAlignment: MainAxisAlignment.start,
          //               //                   children: [
          //               //                     Text(
          //               //                       'Product Name: ${orderDetail.productname}',
          //               //                       style: TextStyle(
          //               //                         color: Colors.black,
          //               //                       ),
          //               //                     ),
          //               //                   ],
          //               //                 ),
          //               //               ),
          //               //           ],
          //               //         ),
          //               //       );
          //               //     } else if (snapshot.hasError) {
          //               //       return Text('${snapshot.error}');
          //               //     }
          //               //     return CircularProgressIndicator();
          //               //   },
          //               // ),
          //             ],
          //           ),
          //         );
          //       },
          //     ),
          //   ),
           ],
        ),
      ),
    );
  }
}
