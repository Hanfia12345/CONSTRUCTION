// ignore_for_file: file_names, library_prefixes, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:the_builders/API/CustomerApis/cartitems.dart';
import 'package:the_builders/GUI/CustomerScreens/HomePage.dart';
import 'package:the_builders/API/CustomerApis/cartitems.dart' as CustomerApi;
import 'package:the_builders/GUI/globalApi.dart' as global;
import 'package:the_builders/Global/global.dart';


//List<dynamic>? CartItemss;

class AddToCart extends StatefulWidget {
  const AddToCart({Key? key}) : super(key: key);

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {

  void reload()async{
    await Future.delayed(const Duration(milliseconds: 50));
    setState(() {});
  }


  //var label="";
  Future<void> RemoveProductfromcart(var id) async {
    var httprequest = GetConnect();
    var response = await httprequest.delete(
      "${global.url}/removefromcart?pid=$id",
    );
    if (response.statusCode == 200) {
      Get.snackbar("Message", "Product Removed");
    } else {
      Get.snackbar("Message", "Product not Removed");
    }
  }

  //Future<List<CustomerApi.CartItems>>? pdetails;
  // @override
  // void initState() {
  //   super.initState();
  //   cartitemdetails(int.parse(login_user_id!));
  //   reload();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent[200],
      appBar: AppBar(
        foregroundColor: Colors.white,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 81, 0),
        title: Text(
          'My Cart',
          style: TextStyle(fontSize: 30.sp),
        ),
        actions: [TextButton(onPressed: (){
          Get.to(CustomerHome());
        }, child: Text("Add More >",style: TextStyle(
          color:  Colors.white
        )))],
      ),
      body: FutureBuilder<List<CustomerApi.CartItems>>(
        future: cartitemdetails(int.parse(login_user_id!)),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, int index) {
                  return Column(
                    children: [
                      Container(
                        color: Colors.white,
                        height: 130.h,
                        child: Row(
                          children: [
                            SizedBox(
                              height: 130.h,
                              width: 130.w,
                              child: Image.network(
                                global.pImagesUrl +
                                    snapshot.data![index].pImage.toString(),
                              ),
                            ),
                            SizedBox(
                              width: 260.w,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          SizedBox(
                                            //height: 50.h,
                                            width: 180.w,
                                            child: Text(
                                              snapshot.data![index].pDesc
                                                  .toString(),
                                              style: TextStyle(fontSize: 18.sp),
                                              maxLines: 2,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          TextButton(
                                              style: TextButton.styleFrom(
                                                  foregroundColor:
                                                      const Color.fromARGB(
                                                          255, 255, 81, 0),
                                                  textStyle: const TextStyle(
                                                      decoration: TextDecoration
                                                          .underline)),
                                              onPressed: () {
                                                setState(() {
                                                  RemoveProductfromcart(snapshot
                                                      .data![index].pid);
                                                });
                                                  setState(() {

                                                  });
                                                //reload();
                                              },
                                              child: const Text('Remove')),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Rs. ',
                                            style: TextStyle(
                                                //fontWeight: FontWeight.bold,
                                                color: const Color.fromARGB(
                                                    255, 255, 81, 0),
                                                fontSize: 18.sp),
                                          ),
                                          Text(
                                            snapshot.data![index].unitprice
                                                .toString(),
                                            style: TextStyle(
                                                //fontWeight: FontWeight.bold,
                                                color: const Color.fromARGB(
                                                    255, 255, 81, 0),
                                                fontSize: 18.sp),
                                          ),
                                        ],
                                      ),

                                      // SizedBox(
                                      //   height: 10.h,
                                      // ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        //crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          IconButton(
                                              onPressed: () {},
                                              icon: const Icon(Icons.remove)),
                                          Text(snapshot.data![index].qty
                                              .toString(),style: TextStyle(fontSize: 14.sp)),
                                          // Text(
                                          //   '2',
                                          //   style: TextStyle(fontSize: 18.sp),
                                          // ),
                                          IconButton(
                                              onPressed: () {},
                                              icon: const Icon(Icons.add)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                });
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 0.sp,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                label: 'Total',
                icon: Row(
                  children: [
                    Text(
                      'Total: : ',
                      style: TextStyle(
                        fontSize: 22.sp,
                      ),
                    ),
                    Text(
                      'Rs. ',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 255, 81, 0),
                        fontSize: 22.sp,
                      ),
                    ),
                    Text(
                      '3173',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 255, 81, 0),
                        fontSize: 22.sp,
                      ),
                    ),
                  ],
                )),
            BottomNavigationBarItem(
              label: 'Check Out',
              icon: ElevatedButton(
                onPressed: () {
                  //cartitemmsss();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CheckOut()));
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(20),
                  backgroundColor: const Color.fromARGB(255, 255, 81, 0),
                ),
                child: Text(
                  'Check Out',
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

class CheckOut extends StatefulWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent[200],
      appBar: AppBar(
        foregroundColor: Colors.white,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 81, 0),
        title: Text(
          'Checkout',
          style: TextStyle(fontSize: 30.sp),
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: 100.h,
            color: Colors.white,
          ),
          Container(
            color: Colors.white,
            height: 100.h,
            child: Row(
              children: [
                SizedBox(
                  height: 100.h,
                  width: 130.w,
                  child: Image.asset(
                    'assets/b.png',
                  ),
                ),
                SizedBox(
                  width: 260.w,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                //height: 50.h,
                                width: 190.w,
                                child: Text(
                                  'Sand Lime Bricks  ',
                                  style: TextStyle(fontSize: 18.sp),
                                  maxLines: 2,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Rs. ',
                                style: TextStyle(
                                    //fontWeight: FontWeight.bold,
                                    color:
                                        const Color.fromARGB(255, 255, 81, 0),
                                    fontSize: 18.sp),
                              ),
                              Text(
                                '13',
                                style: TextStyle(
                                    //fontWeight: FontWeight.bold,
                                    color:
                                        const Color.fromARGB(255, 255, 81, 0),
                                    fontSize: 18.sp),
                              ),
                            ],
                          ),

                          // SizedBox(
                          //   height: 10.h,
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            //crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Qty: ',
                                style: TextStyle(fontSize: 18.sp),
                              ),
                              Text(
                                '1',
                                style: TextStyle(fontSize: 18.sp),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            height: 100.h,
            child: Row(
              children: [
                SizedBox(
                  height: 100.h,
                  width: 130.w,
                  child: Image.asset(
                    'assets/sand.png',
                  ),
                ),
                SizedBox(
                  width: 260.w,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                //height: 50.h,
                                width: 190.w,
                                child: Text(
                                  'Sand ',
                                  style: TextStyle(fontSize: 18.sp),
                                  maxLines: 2,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Rs. ',
                                style: TextStyle(
                                    //fontWeight: FontWeight.bold,
                                    color:
                                        const Color.fromARGB(255, 255, 81, 0),
                                    fontSize: 18.sp),
                              ),
                              Text(
                                '800',
                                style: TextStyle(
                                    //fontWeight: FontWeight.bold,
                                    color:
                                        const Color.fromARGB(255, 255, 81, 0),
                                    fontSize: 18.sp),
                              ),
                            ],
                          ),

                          // SizedBox(
                          //   height: 10.h,
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            //crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Qty: ',
                                style: TextStyle(fontSize: 18.sp),
                              ),
                              Text(
                                '1',
                                style: TextStyle(fontSize: 18.sp),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            height: 100.h,
            child: Row(
              children: [
                SizedBox(
                  height: 100.h,
                  width: 130.w,
                  child: Image.asset(
                    'assets/cc.png',
                  ),
                ),
                SizedBox(
                  width: 260.w,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            //height: 50.h,
                            width: 190.w,
                            child: Text(
                              'Mapple Leaf Cement ',
                              style: TextStyle(fontSize: 18.sp),
                              maxLines: 2,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Rs. ',
                                style: TextStyle(
                                    //fontWeight: FontWeight.bold,
                                    color:
                                        const Color.fromARGB(255, 255, 81, 0),
                                    fontSize: 18.sp),
                              ),
                              Text(
                                '780',
                                style: TextStyle(
                                    //fontWeight: FontWeight.bold,
                                    color:
                                        const Color.fromARGB(255, 255, 81, 0),
                                    fontSize: 18.sp),
                              ),
                            ],
                          ),

                          // SizedBox(
                          //   height: 10.h,
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            //crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Qty: ',
                                style: TextStyle(fontSize: 18.sp),
                              ),
                              Text(
                                '2',
                                style: TextStyle(fontSize: 18.sp),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            height: 100.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Delivery Charges: : ',
                  style: TextStyle(
                    fontSize: 22.sp,
                  ),
                ),
                Text(
                  'Rs. ',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 255, 81, 0),
                    fontSize: 22.sp,
                  ),
                ),
                Text(
                  '800',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 255, 81, 0),
                    fontSize: 22.sp,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 0.sp,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                label: 'Total',
                icon: Row(
                  children: [
                    Text(
                      'Total: : ',
                      style: TextStyle(
                        fontSize: 22.sp,
                      ),
                    ),
                    Text(
                      'Rs. ',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 255, 81, 0),
                        fontSize: 22.sp,
                      ),
                    ),
                    Text(
                      '3173',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 255, 81, 0),
                        fontSize: 22.sp,
                      ),
                    ),
                  ],
                )),
            BottomNavigationBarItem(
              label: 'Place Order',
              icon: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OrderPlaced()));
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(20),
                  backgroundColor: const Color.fromARGB(255, 255, 81, 0),
                ),
                child: Text(
                  'Place Order',
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

class OrderPlaced extends StatefulWidget {
  const OrderPlaced({Key? key}) : super(key: key);

  @override
  State<OrderPlaced> createState() => _OrderPlacedState();
}

class _OrderPlacedState extends State<OrderPlaced> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Order Placed Successfully",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 50.sp,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(207, 241, 82, 9)),
          ),
          SizedBox(
            height: 50.h,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 40.h,
                width: 70.w,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CustomerHome()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[400],
                  ),
                  child: Text(
                    'Ok',
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
