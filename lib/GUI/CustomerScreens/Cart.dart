// ignore_for_file: file_names, library_prefixes, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:the_builders/API/CustomerApis/cartitems.dart';
import 'package:the_builders/API/CustomerApis/placeOrder.dart';
import 'package:the_builders/GUI/CustomerScreens/BookVehicle.dart';
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



  dynamic total=0;
  void reload()async{
    await Future.delayed(const Duration(milliseconds: 100));
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
   @override
   void initState() {
  //   super.initState();
  //   cartitemdetails(int.parse(login_user_id!));
     reload();
   }

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
          Get.to(const CustomerHome());
        }, child: const Text("Add More >",style: TextStyle(
          color:  Colors.white
        )))],
      ),
      body: Column(
        children: [
          FutureBuilder<List<CustomerApi.CartItems>>(
            future: cartitemdetails(int.parse(login_user_id!)),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<dynamic> pricee = List.empty(growable: true);
                List<CustomerApi.CartItems> totalprice =
                snapshot.data as List<CustomerApi.CartItems>;
                if(pricee.isEmpty){
                  total=0;
                  for(var i in totalprice){
                    var t=i.qty * i.unitprice;
                    pricee.add(t);
                  }
                  for(var j in pricee){
                    total=total+j;
                  }
                }
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
          SizedBox(
            height: 20.h,
          ),
          ElevatedButton(
            onPressed: () {
        Get.to(()=>BookVehicle());
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => const CheckOut()));
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.fromLTRB(20,15,20,15),
              backgroundColor: const Color.fromARGB(255, 255, 81, 0),
            ),
            child: Text(
              'Book Vehicle',
              style: TextStyle(
                fontSize: 22.sp,
                color: Colors.white,
                //fontWeight: FontWeight.bold
              ),
            ),
          ),
          SizedBox(height: 20,),
    Row(
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
            color:  Colors.white,
            fontSize: 22.sp,
          ),
        ),
        Text(
          '1300',
          style: TextStyle(
            color:  Colors.white,
            fontSize: 22.sp,
          ),
        ),
      ],
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
                      "${total+1300}",
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
                  Get.to(CheckOut(),arguments: [total]);
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
          ]
      ),

    );
  }
}

class CheckOut extends StatefulWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
var total=Get.arguments;


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
       body: Column(
         children: [
           FutureBuilder<List<CustomerApi.CartItems>>(
             future: cartitemdetails(int.parse(login_user_id!)),
             builder: (context, snapshot) {
               if (snapshot.hasData) {
                 // List<CustomerApi.CartItems> totalprice =
                 // snapshot.data as List<CustomerApi.CartItems>;
                 // for(var i in totalprice){
                 //   var t=i.qty * i.unitprice;
                 //   pricee.add(t);
                 //   //print(total);
                 // }
                 // total=pricee[0];
                 // print(total);
                 // print(pricee[0]);
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
                                     fit: BoxFit.cover,
                                   ),
                                 ),
                                 SizedBox(
                                   width: 260.w,
                                   child: Column(
                                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                           Row(mainAxisAlignment: MainAxisAlignment.end,

                                             children: [
                                             Text("Quantity ")
                                           ],)
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

                                           Row(
                                             mainAxisAlignment:
                                             MainAxisAlignment.end,
                                             children: [

                                               Padding(
                                                 padding: const EdgeInsets.fromLTRB(0,0,20,0),
                                                 child: Text(snapshot.data![index].qty
                                                     .toString(),style: TextStyle(fontSize: 14.sp,
                                                      color: const Color.fromARGB(
                                                     255, 255, 81, 0),),),
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
                         ],
                       );
                     });
               }
               return const Center(child: CircularProgressIndicator());
             },
           ),

           Container(color:Colors.white,
           height: 100,
             child: Column(mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 Row(
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
                         color:  Colors.white,
                         fontSize: 22.sp,
                       ),
                     ),
                     Text(
                       '1300',
                       style: TextStyle(
                         color:  Color.fromARGB(255, 255, 81, 0),
                         fontSize: 22.sp,
                       ),
                     ),
                   ],
                 )
             ],),
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
                      '${total[0]+1300}',
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
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const OrderPlaced()));
                  PlaceOrder(login_user_id);
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
