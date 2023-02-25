// final response = await http.get(Uri.parse("${global.url}/ShowOrdersIdToDeliveryBoy?dbid=${int.parse(login_user_id!)}"));
// import 'package:flutter/material.dart';
//
// class NewTest extends StatefulWidget {
//   const NewTest({Key? key}) : super(key: key);
//
//   @override
//   State<NewTest> createState() => _NewTestState();
// }
//
// class _NewTestState extends State<NewTest> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
//


//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
 import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_builders/GUI/globalApi.dart' as global;
 import 'package:the_builders/Global/global.dart';
//
// class OrderHistory extends StatefulWidget {
//   @override
//   _OrderHistoryState createState() => _OrderHistoryState();
// }
//
// class _OrderHistoryState extends State<OrderHistory> {
//   List orderIds = [];
//   bool loading = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _getOrderIds();
//   }
//
//   _getOrderIds() async {
//     setState(() {
//       loading = true;
//     });
//     try {
//       final response = await http.get(Uri.parse("${global.url}/ShowOrdersIdToDeliveryBoy?dbid=${int.parse(login_user_id!)}"));
//       if (response.statusCode == 200) {
//         List data = jsonDecode(response.body);
//         setState(() {
//           orderIds = data;
//           loading = false;
//         });
//       } else {
//         throw Exception('Failed to load order IDs');
//       }
//     } catch (e) {
//       setState(() {
//         loading = false;
//       });
//       print(e);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Order History"),
//       ),
//       body: loading
//           ? Center(child: CircularProgressIndicator())
//           : ListView.builder(
//         itemCount: orderIds.length,
//         itemBuilder: (BuildContext context, int index) {
//           return Card(
//             child: ListTile(
//               title: Text("Order Id: ${orderIds[index]["oid"]}"),
//               onTap: () {
//                 _getOrderDetails(orderIds[index]["oid"]);
//               },
//               leading: ListView.builder(
//                 itemCount: orderIds.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return Card(
//                     child: ListTile(
//                       title: Text("Order Id: ${orderIds[index]["oid"]}"),
//                       onTap: () {
//                         _getOrderDetails(orderIds[index]["oid"]);
//                       },
//
//                     ),
//
//                   );
//                 },
//               ),
//             ),
//
//           );
//         },
//       ),
//     );
//   }
//
//   _getOrderDetails(oid) async {
//     try {
//       final response = await http.get(Uri.parse("${global.url}/ShowOrderDetailsToDeliveryBoy?oid=$oid"));
//       if (response.statusCode == 200) {
//         List data = jsonDecode(response.body);
//         // do something with the order details
//       } else {
//         throw Exception('Failed to load order details');
//       }
//     } catch (e) {
//       print(e);
//     }}
// }

// ================================================================================================
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// class OrderHistory extends StatefulWidget {
//   @override
//   _OrderHistoryState createState() => _OrderHistoryState();
// }
//
// class _OrderHistoryState extends State<OrderHistory> {
//   List orderIds = [];
//   String error = "";
//
//   @override
//   void initState() {
//     super.initState();
//     fetchOrderIds();
//   }
//
//   Future<void> fetchOrderIds() async {
//     try {
//       final response = await http.get(Uri.parse("${global.url}/ShowOrdersIdToDeliveryBoy?dbid=${int.parse(login_user_id!)}"));
//       if (response.statusCode == 200) {
//         setState(() {
//           orderIds = json.decode(response.body);
//         });
//       } else {
//         throw Exception("Failed to load order IDs");
//       }
//     } catch (e) {
//       setState(() {
//         error = e.toString();
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: <Widget>[
//           Text("Order History Detail"),
//           Expanded(
//             child: ListView.builder(
//               itemCount: orderIds.length,
//               itemBuilder: (context, index) {
//                 return FutureBuilder(
//                   future: fetchOrderDetails(orderIds[index]["oid"]),
//                   builder: (context, snapshot) {
//                     if (snapshot.hasData) {
//                       return Column(
//                         children: <Widget>[
//                           Text("Order Id: ${orderIds[index]["oid"]}"),
//                           DataTable(
//                             columns: [
//                               DataColumn(label: Text("Product Name")),
//                               DataColumn(label: Text("Product Category")),
//                               DataColumn(label: Text("Product Quantity")),
//                               DataColumn(label: Text("Vendor Name")),
//                               DataColumn(label: Text("Order Status")),
//                             ],
//                             rows: snapshot.data
//                                 ?.map((orderDetail) => DataRow(
//                               cells: [
//                                 DataCell(Text(orderDetail["productname"])),
//                                 DataCell(Text(orderDetail["productctg"])),
//                                 DataCell(Text(orderDetail["pqty"].toString())),
//                                 DataCell(Text(orderDetail["vendorname"])),
//                                 DataCell(Text(orderDetail["orderstatus"])),
//                               ],
//                             ))
//                                 .toList(),
//                           ),
//                         ],
//                       );
//                     } else if (snapshot.hasError) {
//                       return Text(snapshot.error.toString());
//                     }
//                     return CircularProgressIndicator();
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//  Future<List> fetchOrderDetails(oid) async {
//       final response = await http.get(Uri.parse("${global.url}/ShowOrderDetailsToDeliveryBoy?oid=$oid"));
//       if (response.statusCode == 200) {
//         List data = jsonDecode(response.body);
//         return data;
//         // do something with the order details
//       } else {
//         throw Exception('Failed to load order details');
//       }
//
// }}






//=============================================================================



import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../API/TransporterApi/ShowOrdersForDeliveryBoy.dart';

class OrderHistory extends StatefulWidget {
  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  List orderIds = [];
  String error = '';

  @override
  void initState() {
    super.initState();
    getOrderIds();
  }

 Future<List<OrdersForDelivery>> getOrderIds() async {
    var response = await http.get(Uri.parse("${global.url}/ShowOrdersIdToDeliveryBoy?dbid=${int.parse(login_user_id!)}"));
        var d = json.decode(response.body);
     return d;
  }

Future <List<OrderDetailsForDelivery>> getOrderDetails(oid) async {
    var response =
    await http.get(Uri.parse("${global.url}/ShowOrderDetailsToDeliveryBoy?oid=$oid"));
    if (response.statusCode == 200) {
      var d = orderDetailsForDeliveryFromJson(response.body);
      return d;
    } else {
      return [];
    }
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
                Expanded(
                  child:ListView.builder(
                    itemCount: orderIds.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 200.h,
                        child: Column(
                          children: [
                            Container(

                              color: Colors.blue[300],
                              child: Text(
                                'Order Id = ${orderIds[index]['oid']}',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            FutureBuilder<List<OrderDetailsForDelivery>>(
                              future: getOrderDetails(orderIds[index]['oid']),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  List<OrderDetailsForDelivery>? orderDetails = snapshot.data;
                                  return Container(
                                    child: Column(
                                      children: [
                                        for (var orderDetail in orderDetails!)
                                          Container(

                                            color: Colors.grey[300],
                                            child: Column(mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Product Name: ${orderDetail.productname}',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                      ],
                                    ),
                                  );
                                } else if (snapshot.hasError) {
                                  return Text('${snapshot.error}');
                                }
                                return CircularProgressIndicator();
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            ),
        );
    }
}







