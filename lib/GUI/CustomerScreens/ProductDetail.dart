// ignore_for_file: file_names, library_prefixes, non_constant_identifier_names

//import 'dart:html';
//import 'dart:io';

import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:the_builders/GUI/CustomerScreens/AllProduct.dart';
import 'package:the_builders/GUI/CustomerScreens/Cart.dart';
import 'package:the_builders/GUI/CustomerScreens/Construct.dart';
import 'package:the_builders/GUI/CustomerScreens/HomePage.dart';
import 'package:the_builders/GUI/loginpages.dart';
import 'package:the_builders/API/CustomerApis/productDetails.dart'
    as CustomerApi;
import 'package:the_builders/Global/global.dart';
import 'package:the_builders/GUI/globalApi.dart' as global;
//import 'package:http/http.dart' as http;

//String? pid_for_cartItem;
//List<dynamic> CartItems = List.empty(growable: true);

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  TextEditingController quantity =TextEditingController();
  var pid = Get.arguments;
  late String pname;
  late String pimage;
  late int unitcost;

  Future<void> addtocart() async {
    var httprequest=GetConnect();
    var response =
        await httprequest.post("${global.url}/addCartItem?pid=${Customer_product_id.toString()}&p_desc=$pname&p_image=$pimage&cid=${login_user_id.toString()}&unitprice=${unitcost.toString()}&vid=${Vendor_product_id_in_customer.toString()}&qty=${quantity.text}",{});
    if (response.statusCode == 200) {
      Get.snackbar("Message", "Product  added");
    } else {
      Get.snackbar("Message", "Product not added");
    }
  }

  Future<List<CustomerApi.ProductDetail>>? pdetails;

  @override
  void initState() {
    super.initState();
    //print(Customer_product_id);
    pdetails = CustomerApi.viewProductDetails(Customer_product_id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent[200],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 81, 0),
        title: Text(
          'Product Details',
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
              onTap: () {
                Get.to(const Estimate());
              },
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
      body: FutureBuilder<List<CustomerApi.ProductDetail>>(
        future: pdetails,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            pimage = snapshot.data![0].pImage!;
            pname = snapshot.data![0].pDesc!;
            unitcost = snapshot.data![0].unitcost!;
            return Column(
              children: [
                Expanded(
                  flex: 8,
                  child: ListView(scrollDirection: Axis.vertical, children: [
                    Container(
                      height: 400.h,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: NetworkImage(
                          global.pImagesUrl +
                              snapshot.data![0].pImage.toString(),
                        ),
                        fit: BoxFit.fill,
                      )),
                    ),
                    Container(
                      color: Colors.white,
                      height: 130.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                Text(
                                  'Rs. ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color:
                                          const Color.fromARGB(255, 255, 81, 0),
                                      fontSize: 18.sp),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      snapshot.data![0].unitcost.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: const Color.fromARGB(
                                              255, 255, 81, 0),
                                          fontSize: 20.sp),
                                    ),
                                    SizedBox(width: 70.w),
                                    const Text("Quantity :  "),
                                    SizedBox(width: 100.w,height: 30.h,
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                          controller:  quantity  ,
                                          style: TextStyle(fontSize: 16.sp),
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                color: Colors.white,
                                              ),
                                            ),
                                          )
                                      ),
                                    ),
                                    // ElevatedButton(
                                    //     onPressed: () {},
                                    //     child: const Text('cart'))
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              snapshot.data![0].pDesc.toString(),
                              style: TextStyle(
                                  //fontWeight: FontWeight.bold,
                                  //color: Color.fromARGB(255, 255, 81, 0),
                                  fontSize: 28.sp),
                            ),

                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              snapshot.data![0].pCtg.toString(),
                              style: TextStyle(
                                //fontWeight: FontWeight.bold,
                                //color: Color.fromARGB(255, 255, 81, 0),
                                  fontSize: 28.sp),
                            ),

                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      height: 1.5,
                      color: Colors.white,
                    ),
                    Container(
                      color: Colors.white,
                      height: 120.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              snapshot.data![0].name.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  //color: Color.fromARGB(255, 255, 81, 0),
                                  fontSize: 28.sp),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Location ',
                              style: TextStyle(
                                  //fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(255, 255, 81, 0),
                                  fontSize: 18.sp),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              snapshot.data![0].location.toString(),
                              style: TextStyle(
                                  //fontWeight: FontWeight.bold,
                                  //color: Color.fromARGB(255, 255, 81, 0),
                                  fontSize: 28.sp),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      height: 215.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              'Rocommended For You',
                              style: TextStyle(
                                  //fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(255, 255, 81, 0),
                                  fontSize: 20.sp),
                            ),
                          ),
                          // SizedBox(
                          //   height: 15.h,
                          // ),
                          Expanded(
                            flex: 5,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.to(const ProductFromDifferentVendors());
                                  },
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      // borderRadius:
                                      //     BorderRadius.all(Radius.circular(10)),
                                    ),
                                    child: Column(
                                      children: [
                                        Expanded(
                                          flex: 4,
                                          child: Container(
                                            width: 180.w,
                                            height: 140.h,
                                            decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                    'assets/sand.png',
                                                  ),
                                                  fit: BoxFit.cover,
                                                )),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Center(
                                              child: Text(
                                            'Sand',
                                            style: TextStyle(
                                                fontSize: 22.sp,
                                                color: Colors.black),
                                          )),
                                        )
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
                                      // borderRadius:
                                      //     BorderRadius.all(Radius.circular(10)),
                                    ),
                                    child: Column(
                                      children: [
                                        Expanded(
                                          flex: 4,
                                          child: Container(
                                            width: 180.w,
                                            height: 140.h,
                                            decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                    'assets/cc.png',
                                                  ),
                                                  fit: BoxFit.cover,
                                                )),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Center(
                                              child: Text(
                                            'Cement',
                                            style: TextStyle(
                                                fontSize: 22.sp,
                                                color: Colors.black),
                                          )),
                                        )
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
                                      // borderRadius:
                                      //     BorderRadius.all(Radius.circular(10)),
                                    ),
                                    child: Column(
                                      children: [
                                        Expanded(
                                          flex: 4,
                                          child: Container(
                                            width: 180.w,
                                            height: 140.h,
                                            decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                    'assets/tiles.png',
                                                  ),
                                                  fit: BoxFit.cover,
                                                )),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Center(
                                              child: Text(
                                            'Tiles',
                                            style: TextStyle(
                                                fontSize: 22.sp,
                                                color: Colors.black),
                                          )),
                                        )
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
                                      // borderRadius:
                                      //     BorderRadius.all(Radius.circular(10)),
                                    ),
                                    child: Column(
                                      children: [
                                        Expanded(
                                          flex: 4,
                                          child: Container(
                                            width: 180.w,
                                            height: 140.h,
                                            decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                    'assets/marble.png',
                                                  ),
                                                  fit: BoxFit.cover,
                                                )),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Center(
                                              child: Text(
                                            'Marble',
                                            style: TextStyle(
                                                fontSize: 22.sp,
                                                color: Colors.black),
                                          )),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              ],
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 0.sp,

          //backgroundColor: Colors.orangeAccent[200],
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              label: 'Buy Now',
              icon: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(20),
                  backgroundColor: const Color.fromARGB(255, 253, 166, 3),
                ),
                child: Text(
                  'Buy Now ',
                  style: TextStyle(
                    fontSize: 22.sp,
                    color: Colors.white,
                    // fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            BottomNavigationBarItem(
              label: 'Add To Cart',
              icon: ElevatedButton(
                onPressed: () {
                  //CartItems.add(Customer_product_id);
                  //cart.list();
                  // for (var i in CartItems) {
                  //print(i);
                  // }
                  //Get.to(const AddToCart(), arguments: CartItems);
                  Get.to(const AddToCart());
                  addtocart();
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(20),
                  backgroundColor: const Color.fromARGB(255, 255, 81, 0),
                ),
                child: Text(
                  'Add to Cart',
                  style: TextStyle(
                    fontSize: 22.sp,
                    color: Colors.white,
                    //fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
          ]),
    );
  }
}
