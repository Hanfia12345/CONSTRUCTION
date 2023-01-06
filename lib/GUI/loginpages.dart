// ignore_for_file: camel_case_types, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'package:the_builders/API/api.dart';
import 'package:the_builders/GUI/CustomerScreens/HomePage.dart';
import 'package:the_builders/GUI/DeliveryBoy/HomePage.dart';
import 'package:the_builders/GUI/RegistrationPages.dart';
import 'package:http/http.dart' as http;
import 'package:the_builders/GUI/globalApi.dart' as global;
import 'package:the_builders/Global/global.dart';
import 'VendorScreens/vendorHome.dart';
import 'package:get/get.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  dynamic id;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  // ignore: non_constant_identifier_names
  Future<void> UserLogin() async {
    if (username.text.isNotEmpty && password.text.isNotEmpty) {
      var response = await http.get(Uri.parse(
        "${global.url}/UserLogin?email=${username.text}&pass=${password.text}",
      ));

      //print(response.body);
      if (response.statusCode == 200) {
        var res = jsonDecode(response.body) as Map<String, dynamic>;
        var type = res['user_ctg'];
        var vid = res['id'].toString();
        login_user_id = vid;
        //id = vid;
        //print(id);

        if (type == "vendor") {
          Get.off(() => const VendorHome(), arguments: vid);
        } else if (type == "customer") {
          Get.off(const CustomerHome());
        } else if (type == "deliveryboy") {
          Get.off(const HomePage());
        } else {}
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Invalid Credentials')));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Blank Fields not Allowed')));
    }
  }

  TextField textfield(TextEditingController cntrlr, String htxt) {
    return TextField(
        controller: cntrlr, decoration: InputDecoration(hintText: htxt));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 255, 81, 0),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 20.h,
          ),
          Center(
            child: Text(
              'Welcome to The Builders!',
              style: TextStyle(
                fontSize: 24.sp,
                color: Colors.white,
              ),
            ),
          ),
          Text(
            'Please Login.',
            style: TextStyle(
              fontSize: 24.sp,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 70.h,
          ),
          SizedBox(
            width: 280.w,
            child: TextField(
                controller: username,
                style: TextStyle(fontSize: 16.sp, color: Colors.white),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.account_circle),
                  prefixIconColor: Colors.white,
                  hintText: "Enter Username",
                  hintStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(80))),
                )),
          ),
          SizedBox(
            width: 280.w,
            child: TextField(
                cursorColor: Colors.white,
                controller: password,
                obscureText: true,
                style: TextStyle(fontSize: 16.sp, color: Colors.white),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.account_circle),
                  prefixIconColor: Colors.red,
                  hintText: "Enter Password",
                  hintStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(80.0)),
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                )),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.h, left: 210.w),
            child: FloatingActionButton(
              backgroundColor: Colors.green[400],
              onPressed: () async {
                UserLogin();
                username.clear();
                password.clear();
                // String? body =
                //     await APIHandler.userLogin(username.text, password.text);
                // if (body == null) {
                // } else {
                //   dynamic data = jsonDecode(body);
                //   int id = data["id"];
                //   String category = data["user_ctg"];
                //   print(id);
                //   if (category == "vendor") {
                //     print("id =" + id.toString());
                //     Get.to(VendorHome(), arguments: "${id}");
                //   } else if (category == "customer") {
                //     Get.to(CustomerHome());
                //   } else if (category == "deliveryboy") {
                //     Get.to(HomePage());
                //   } else {
                //     print("body is null or empty");
                //   }
                // }
              },
              child: const Icon(
                Icons.login,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 30.h),
          Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 60.w)),
              const Text(
                'New Member ?',
                style: TextStyle(color: Colors.white),
              ),
              TextButton(
                onPressed: () {
                  Get.to(RegisterAsCustomer());
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const RegisterAsCustomer()));
                },
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.green[400]),
                ),
              ),
              const Text('here.', style: TextStyle(color: Colors.white)),
            ],
          ),
          SizedBox(
            height: 40.h,
          ),
          // Column(children: [
          //   Row(
          //     mainAxisAlignment: MainAxisAlignment.end,
          //     children: [
          //       TextButton(
          //         onPressed: () {
          //           Navigator.push(
          //               context,
          //               MaterialPageRoute(
          //                   builder: (context) => loginAsVendor()));
          //         },
          //         child: Text(
          //           'Login As Vendor',
          //           style: TextStyle(
          //             color: Colors.green[400],
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          //   Row(
          //     mainAxisAlignment: MainAxisAlignment.end,
          //     children: [
          //       TextButton(
          //         onPressed: () {
          //           Navigator.push(
          //               context,
          //               MaterialPageRoute(
          //                   builder: (context) => loginAsDelivery()));
          //         },
          //         child: Text(
          //           'Login As Delivery Boy',
          //           style: TextStyle(
          //             color: Colors.green[400],
          //           ),
          //         ),
          //       ),
          //     ],
          //   )
          // ]),
        ],
      ),
    );
  }
}

// class loginAsVendor extends StatefulWidget {
//   const loginAsVendor({Key? key}) : super(key: key);

//   @override
//   State<loginAsVendor> createState() => _loginAsVendorState();
// }

// class _loginAsVendorState extends State<loginAsVendor> {
// //   Future<void> loginvendor() async {
// //     if (username.text.isNotEmpty && password.text.isNotEmpty) {
// //       var response = await http.post(Uri.parse(
// //           "http://192.168.43.117/apii/api/apii/vendorlogin?email=${username.text}&pass=${password.text}"));
// //       print(response.body);
// //       if (response.statusCode == 200) {
// //         // Navigator.push(context,
// //         //     MaterialPageRoute(builder: (context) => const VendorHome()));
// //       } else {
// //         ScaffoldMessenger.of(context)
// //             .showSnackBar(SnackBar(content: Text('Invalid Credentials')));
// //       }
// //     } else {
// //       ScaffoldMessenger.of(context)
// //           .showSnackBar(SnackBar(content: Text('Blank Fields not Allowed')));
// //     }
// //   }

//   Future<void> loginvendor() async {
//     if (username.text.isNotEmpty && password.text.isNotEmpty) {
//       var response = await http.post(Uri.parse(
//           "http://192.168.43.117/apii/api/apii/vendorlogin?email=${username.text}&pass=${password.text}"));
//       print(response.body);
//       dynamic res = jsonDecode(response.body);
//       if (response.statusCode == 200) {
//         var id = res['vid'];
//         print(id);

//         // Navigator.pushNamed(context,VendorHome.vendorhome()
//         //     arguments: VendorHome.vendorhome(id));
//         Get.to(VendorHome(), arguments: "${id}");
//       } else {
//         ScaffoldMessenger.of(context)
//             .showSnackBar(SnackBar(content: Text('Invalid Credentials')));
//       }
//     } else {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text('Blank Fields not Allowed')));
//     }
//   }

//   @override
//   TextEditingController username = TextEditingController();
//   TextEditingController password = TextEditingController();

//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: Color.fromRGBO(255, 81, 0, 1),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           SizedBox(
//             height: 20.h,
//           ),
//           Center(
//             child: Text(
//               'Welcome to The Builders!',
//               style: TextStyle(
//                 fontSize: 24.sp,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//           Text(
//             'Please Login.',
//             style: TextStyle(
//               fontSize: 24.sp,
//               color: Colors.white,
//             ),
//           ),
//           SizedBox(
//             height: 70.h,
//           ),
//           SizedBox(
//             width: 280.w,
//             child: TextField(
//                 controller: username,
//                 style: TextStyle(fontSize: 16.sp, color: Colors.white),
//                 decoration: const InputDecoration(
//                   prefixIcon: Icon(Icons.account_circle),
//                   prefixIconColor: Colors.white,
//                   hintText: "Enter Username",
//                   hintStyle: TextStyle(color: Colors.white),
//                   border: OutlineInputBorder(
//                       borderRadius:
//                           BorderRadius.only(topRight: Radius.circular(80))),
//                 )),
//           ),
//           SizedBox(
//             width: 280.w,
//             child: TextField(
//                 cursorColor: Colors.white,
//                 controller: password,
//                 style: TextStyle(fontSize: 16.sp, color: Colors.white),
//                 decoration: const InputDecoration(
//                   prefixIcon: Icon(Icons.account_circle),
//                   prefixIconColor: Colors.red,
//                   hintText: "Enter Password",
//                   hintStyle: TextStyle(color: Colors.white),
//                   border: OutlineInputBorder(
//                     borderRadius:
//                         BorderRadius.only(bottomRight: Radius.circular(80.0)),
//                     borderSide: BorderSide(
//                       color: Colors.white,
//                     ),
//                   ),
//                 )),
//           ),
//           Padding(
//             padding: EdgeInsets.only(top: 20.h, left: 210.w),
//             child: FloatingActionButton(
//                 child: const Icon(
//                   Icons.login,
//                   color: Colors.white,
//                 ),
//                 backgroundColor: Colors.green[400],
//                 onPressed: () {
//                   Get.to(VendorHome());
//                   //loginvendor();
//                   username.clear();
//                   password.clear();
//                 }),
//           ),

//           SizedBox(height: 30.h),
//           Row(
//             children: [
//               Padding(padding: EdgeInsets.only(left: 60.w)),
//               const Text(
//                 'New Member ?',
//                 style: TextStyle(color: Colors.white),
//               ),
//               TextButton(
//                 onPressed: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => const RegisterAsVendor()));
//                 },
//                 child: Text(
//                   'Register',
//                   style: TextStyle(color: Colors.green[400]),
//                 ),
//               ),
//               const Text('here.', style: TextStyle(color: Colors.white)),
//             ],
//           ),
//           SizedBox(
//             height: 40.h,
//           ),
//           Column(children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 TextButton(
//                   onPressed: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => const login()));
//                   },
//                   child: Text(
//                     'Login As Customer',
//                     style: TextStyle(
//                       color: Colors.green[400],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 TextButton(
//                   onPressed: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => const loginAsDelivery()));
//                   },
//                   child: Text(
//                     'Login As Delivery Boy',
//                     style: TextStyle(
//                       color: Colors.green[400],
//                     ),
//                   ),
//                 ),
//               ],
//             )
//           ]),
//           // SizedBox(
//           //   height: 90,
//           // )
//         ],
//       ),
//     );
//   }
// }

// class loginAsDelivery extends StatefulWidget {
//   const loginAsDelivery({Key? key}) : super(key: key);

//   @override
//   State<loginAsDelivery> createState() => _loginAsDeliveryState();
// }

// class _loginAsDeliveryState extends State<loginAsDelivery> {
//   @override
//   TextEditingController username = TextEditingController();
//   TextEditingController password = TextEditingController();

//   Future<void> logindelivery() async {
//     if (username.text.isNotEmpty && password.text.isNotEmpty) {
//       var response = await http.post(Uri.parse(
//           "http://192.168.43.117/apii/api/apii/deliveryboyLogin?email=${username.text}&pass=${password.text}"));
//       print(response.body);
//       if (response.statusCode == 200) {
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => const HomePage()));
//       } else {
//         ScaffoldMessenger.of(context)
//             .showSnackBar(SnackBar(content: Text('Invalid Credentials')));
//       }
//     } else {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text('Blank Fields not Allowed')));
//     }
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: const Color.fromRGBO(255, 81, 0, 1),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           SizedBox(
//             height: 20.h,
//           ),
//           Center(
//             child: Text(
//               'Welcome to The Builders!',
//               style: TextStyle(
//                 fontSize: 24.sp,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//           Text(
//             'Please Login.',
//             style: TextStyle(
//               fontSize: 24.sp,
//               color: Colors.white,
//             ),
//           ),
//           SizedBox(
//             height: 70.h,
//           ),
//           SizedBox(
//             width: 280.w,
//             child: TextField(
//                 controller: username,
//                 style: TextStyle(fontSize: 16.sp, color: Colors.white),
//                 decoration: InputDecoration(
//                   prefixIcon: Icon(Icons.account_circle),
//                   prefixIconColor: Colors.white,
//                   hintText: "Enter Username",
//                   hintStyle: TextStyle(color: Colors.white),
//                   border: OutlineInputBorder(
//                       borderRadius:
//                           BorderRadius.only(topRight: Radius.circular(80.0))),
//                 )),
//           ),
//           SizedBox(
//             width: 280.w,
//             child: TextField(
//                 cursorColor: Colors.white,
//                 controller: password,
//                 style: TextStyle(fontSize: 16.sp, color: Colors.white),
//                 decoration: InputDecoration(
//                   prefixIcon: Icon(Icons.account_circle),
//                   prefixIconColor: Colors.red,
//                   hintText: "Enter Password",
//                   hintStyle: TextStyle(color: Colors.white),
//                   border: OutlineInputBorder(
//                     borderRadius:
//                         BorderRadius.only(bottomRight: Radius.circular(80.0)),
//                     borderSide: BorderSide(
//                       color: Colors.white,
//                     ),
//                   ),
//                 )),
//           ),

//           Padding(
//             padding: EdgeInsets.only(top: 20.h, left: 210.w),
//             child: FloatingActionButton(
//               child: const Icon(
//                 Icons.login,
//                 color: Colors.white,
//               ),
//               backgroundColor: Colors.green[400],
//               onPressed: () {
//                 Get.to(HomePage());
//                 //logindelivery();
//                 username.clear();
//                 password.clear();
//               },
//             ),
//           ),
//           SizedBox(height: 30.h),
//           Row(
//             children: [
//               Padding(padding: EdgeInsets.only(left: 60.w)),
//               Text(
//                 'New Member ?',
//                 style: TextStyle(color: Colors.white),
//               ),
//               TextButton(
//                 onPressed: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => RegisterAsDeliveryBoy()));
//                 },
//                 child: Text(
//                   'Register',
//                   style: TextStyle(color: Colors.green[400]),
//                 ),
//               ),
//               Text('here.', style: TextStyle(color: Colors.white)),
//             ],
//           ),
//           SizedBox(
//             height: 40.h,
//           ),
//           Column(children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 TextButton(
//                   onPressed: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => login()));
//                   },
//                   child: Text(
//                     'Login As Customer',
//                     style: TextStyle(
//                       color: Colors.green[400],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 TextButton(
//                   onPressed: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => loginAsVendor()));
//                   },
//                   child: Text(
//                     'Login As Vendor',
//                     style: TextStyle(
//                       color: Colors.green[400],
//                     ),
//                   ),
//                 ),
//               ],
//             )
//           ]),
//           // SizedBox(
//           //   height: 90,
//           // )
//         ],
//       ),
//     );
//   }
// }
