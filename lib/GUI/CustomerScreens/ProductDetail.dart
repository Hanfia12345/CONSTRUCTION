// ignore_for_file: file_names, library_prefixes, non_constant_identifier_names

//import 'dart:html';
//import 'dart:io';

import 'dart:convert';

import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:the_builders/GUI/CustomerScreens/Cart.dart';
import 'package:the_builders/GUI/CustomerScreens/Construct.dart';
import 'package:the_builders/GUI/CustomerScreens/HomePage.dart';
import 'package:the_builders/GUI/loginpages.dart';
import 'package:the_builders/API/CustomerApis/productDetails.dart'
    as CustomerApi;
import 'package:the_builders/Global/global.dart';
import 'package:the_builders/GUI/globalApi.dart' as global;
//import 'package:flutter_rating_bar/flutter_rating_bar.dart';




class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  TextEditingController quantity =TextEditingController(text: "1");
  var pid = Get.arguments;
  late String pname;
  late String pimage;
  late int unitcost;
  late int stock;
 // var ratingss=3.0;
  Future<void> addtocart() async {
    var httprequest=GetConnect();
    var response =
        await httprequest.post("${global.url}/addCartItem?pid=${int.parse(Customer_product_id!)}&p_desc=$pname&p_image=$pimage&cid=${int.parse(login_user_id!)}&unitprice=${unitcost.toString()}&vid=${Vendor_product_id_in_customer.toString()}&qty=${quantity.text}",{});
    if (response.statusCode == 200) {
      Get.snackbar("Message", response.body);
    } else {
      print(response.statusCode);
      Get.snackbar("Message", response.body);
    }
  }

//   void avgRating() async {
//     var request=GetConnect();
//     var response = await request.get(
//       "${global.url}/averageRating?vid=$Vendor_product_id_in_customer",
//     );
//    var rat=jsonDecode(response.bodyString!);
//    //print(rat);
//    var ratt= rat["avg_stars"];
// if(ratt!=null){
//   ratingss=ratt;
// }
//
//
//    print(ratingss);
//    setState(() {
//
// });
//   }






  Future<List<CustomerApi.ProductDetail>>? pdetails;
  Future<List<CustomerApi.ProductDetail>>? Suggestions;


  @override
  void initState() {
    super.initState();
    //print(Customer_product_id);

    pdetails = CustomerApi.viewProductDetails(Customer_product_id);
    Suggestions = CustomerApi.SuggestionList(Customer_product_id);
   // avgRating();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        centerTitle: true,
        //123
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
            stock=snapshot.data![0].stock;
            //print(stock);
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
                            child: Row(
                              //mainAxisAlignment: MainAxisAlignment.,
                              children: [
                                Text(
                                  snapshot.data![0].pCtg.toString(),
                                  style: TextStyle(
                                    //fontWeight: FontWeight.bold,
                                    //color: Color.fromARGB(255, 255, 81, 0),
                                      fontSize: 28.sp),
                                ),
                                SizedBox(width: 55.w,),
                                ElevatedButton(
                                  onPressed: () {
                                    //CartItems.add(Customer_product_id);
                                    //cart.list();
                                    // for (var i in CartItems) {
                                    //print(i);
                                    // }
                                    //Get.to(const AddToCart(), arguments: CartItems);
                                    int a =int.parse(quantity.text);
                                    print(a);
                                    if(a>stock){
                                      Get.defaultDialog(title: 'Cannot proceed' ,middleText: 'Out Of Stock' );
                                    }
                                    else if(a>0  && a<= stock){
                                      Get.off(const AddToCart());
                                      addtocart();
                                    }


                                    // Get.snackbar("", "message");



                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(32)),
                                    elevation: 5,
                                    //padding: const EdgeInsets.all(20),
                                    backgroundColor: const Color.fromARGB(255, 255, 81, 0),
                                  ),
                                  child: Text(
                                    'Add to Cart',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Colors.white,
                                      //fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                              ],
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
                      height: 140.h,
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
                          // Expanded(
                          //   flex: 1,
                          //   child: RatingBarIndicator(
                          //     rating: ratingss,
                          //     itemBuilder: (context, index) => const Icon(
                          //       Icons.star,
                          //       color: Colors.amber,
                          //     ),
                          //     itemCount: 5,
                          //     itemSize: 20.0,
                          //     direction: Axis.horizontal,
                          //   ),
                          // ),
                          Expanded(
                            flex: 1,
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
                    FutureBuilder<List<CustomerApi.ProductDetail>>(
                      future:Suggestions,
                      builder: (context,snapshot) {
                        if(snapshot.hasData){
                        return Container(
                          color: Colors.white,
                          height: 215.h,
                          child: Column(
                            //mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex:1,
                                child: Text(
                                  'Recommended For You',
                                  style: TextStyle(
                                    //fontWeight: FontWeight.bold,
                                      color: const Color.fromARGB(255, 255, 81, 0),
                                      fontSize: 20.sp),
                                ),
                              ),
                              Expanded(
                                  flex:5,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemCount: snapshot.data!.length,
                                    itemBuilder:(context, int index){
                                      return GestureDetector(
                                        onTap: () {
                                          pdetails=CustomerApi.viewProductDetails(snapshot.data![index].Pid.toString());
                                         Suggestions=CustomerApi.SuggestionList(snapshot.data![index].Pid.toString());
                                          setState(() {

                                          });

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
                                                  decoration:  BoxDecoration(
                                                      borderRadius: const BorderRadius.all(
                                                          Radius.circular(10)),
                                                      image: DecorationImage(
                                                        image: NetworkImage(
                                                          global.pImagesUrl +
                                                              snapshot.data![index].pImage.toString(),
                                                        ),
                                                        fit: BoxFit.cover,
                                                      )),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Center(
                                                    child: Text(
                                                      snapshot.data![index].pCtg.toString(),
                                                      style: TextStyle(
                                                          fontSize: 22.sp,
                                                          color: Colors.black),
                                                    )),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    }

                                ),
                              ),
                            ],
                          ),
                        );
                        }
                        return const Center(child: CircularProgressIndicator());
                      },
                    ),
                  // ElevatedButton(
                  //             onPressed: () {
                  //               //CartItems.add(Customer_product_id);
                  //               //cart.list();
                  //               // for (var i in CartItems) {
                  //               //print(i);
                  //               // }
                  //               //Get.to(const AddToCart(), arguments: CartItems);
                  //               int a =int.parse(quantity.text);
                  //               print(a);
                  //               if(a>stock){
                  //                 Get.defaultDialog(title: 'Cannot proceed' ,middleText: 'Out Of Stock' );
                  //               }
                  //               else if(a>0  && a<= stock){
                  //                 Get.off(const AddToCart());
                  //                 addtocart();
                  //               }
                  //
                  //
                  //                // Get.snackbar("", "message");
                  //
                  //
                  //
                  //             },
                  //             style: ElevatedButton.styleFrom(
                  //               padding: const EdgeInsets.all(20),
                  //               backgroundColor: const Color.fromARGB(255, 255, 81, 0),
                  //             ),
                  //             child: Text(
                  //               'Add to Cart',
                  //               style: TextStyle(
                  //                 fontSize: 22.sp,
                  //                 color: Colors.white,
                  //                 //fontWeight: FontWeight.bold
                  //               ),
                  //             ),
                  //           ),


                  ]),
                ),
              ],
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),

    );
  }
}
