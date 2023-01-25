import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:the_builders/API/CustomerApis/homepageViewAllProducts.dart' as homeapi;
import 'package:the_builders/GUI/globalApi.dart' as global;
import 'package:the_builders/GUI/CustomerScreens/ProductDetail.dart';
import '../../Global/global.dart';

class searchProducts extends SearchDelegate{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: TextField(
          decoration: const InputDecoration(
              hintText: "Search Products...",
              border: InputBorder.none
          ),
          onChanged: (value) {
            query = value;
            showResults(context);
          },
        ),
        actions: [
          IconButton(
              onPressed: () {
                query = '';
                showResults(context);
              },
              icon: const Icon(Icons.close))
        ],
      ),
      body: buildResults(context),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {

    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.close),
        color: Colors.orangeAccent[200],
      )
    ];

  }

  @override
  Widget? buildLeading(BuildContext context) {
   return IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.pop(context);
      },
     color: Colors.orangeAccent[200],
    );
  }

  @override
  Widget buildResults(BuildContext context) {
   return Scaffold(
       backgroundColor: Colors.grey,
     body:FutureBuilder<List<homeapi.ViewAllProducts>>(
       future: homeapi.GetAllProducts(query:  query),
       builder: (context, snapshot) {
         if (snapshot.hasData) {
           return GridView.builder(
               padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
               itemCount: snapshot.data!.length,
               gridDelegate:
               const SliverGridDelegateWithFixedCrossAxisCount(
                   childAspectRatio: 0.9,
                   crossAxisCount: 2,
                   crossAxisSpacing: 10,
                   mainAxisSpacing: 10),
               itemBuilder: (context, index) {
                 return GestureDetector(
                   onTap: () {
                     Customer_product_id =
                         snapshot.data![index].pid.toString();
                     Vendor_product_id_in_customer=snapshot.data![index].id.toString();
                     //print(Customer_product_id);
                     Get.to(const ProductDetail(),
                         arguments: [snapshot.data![index].pid,snapshot.data![index].id ] );
                   },
                   child: Container(
                     decoration: const BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.all(Radius.circular(10)),
                     ),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Expanded(
                           flex: 5,
                           child: Container(
                             width: 180.w,
                             height: 140.h,
                             decoration: BoxDecoration(
                                 borderRadius: const BorderRadius.all(
                                     Radius.circular(10)),
                                 //border: Border.all(width: 1.w),
                                 image: DecorationImage(
                                   image: NetworkImage(global.pImagesUrl +
                                       snapshot.data![index].pImage
                                           .toString()),
                                   fit: BoxFit.cover,
                                 )),
                           ),
                         ),
                         Expanded(
                           flex: 1,
                           child: Text(
                             snapshot.data![index].pDesc.toString(),
                             style: TextStyle(
                                 fontSize: 20.sp, color: Colors.black),
                           ),
                         ),
                         Expanded(
                           flex: 1,
                           child: Text(
                             snapshot.data![index].name.toString(),
                             style: TextStyle(
                                 color: Colors.black, fontSize: 20.sp),
                           ),
                         ),
                         Expanded(
                           flex: 1,
                           child: Row(
                             children: [
                               Text(
                                 'Rs. ',
                                 style: TextStyle(
                                     color: const Color.fromARGB(
                                         255, 255, 81, 0),
                                     fontSize: 20.sp),
                               ),
                               Text(
                                 snapshot.data![index].unitcost.toString(),
                                 style: TextStyle(
                                     color: const Color.fromARGB(
                                         255, 255, 81, 0),
                                     fontSize: 20.sp),
                               ),
                             ],
                           ),
                         ),
                       ],
                     ),
                   ),
                 );
               });
         }
         return const Center(child: CircularProgressIndicator());
       },
     ) ,
   );


  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body:FutureBuilder<List<homeapi.ViewAllProducts>>(
        future: homeapi.GetAllProducts(query:  query),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                itemCount: snapshot.data!.length,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.9,
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Customer_product_id =
                          snapshot.data![index].pid.toString();
                      Vendor_product_id_in_customer=snapshot.data![index].id.toString();
                      //print(Customer_product_id);
                      Get.to(const ProductDetail(),
                          arguments: [snapshot.data![index].pid,snapshot.data![index].id ] );
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 5,
                            child: Container(
                              width: 180.w,
                              height: 140.h,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  //border: Border.all(width: 1.w),
                                  image: DecorationImage(
                                    image: NetworkImage(global.pImagesUrl +
                                        snapshot.data![index].pImage
                                            .toString()),
                                    fit: BoxFit.cover,
                                  )),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              snapshot.data![index].pDesc.toString(),
                              style: TextStyle(
                                  fontSize: 20.sp, color: Colors.black),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              snapshot.data![index].name.toString(),
                              style: TextStyle(
                                  color: Colors.black, fontSize: 20.sp),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Row(
                              children: [
                                Text(
                                  'Rs. ',
                                  style: TextStyle(
                                      color: const Color.fromARGB(
                                          255, 255, 81, 0),
                                      fontSize: 20.sp),
                                ),
                                Text(
                                  snapshot.data![index].unitcost.toString(),
                                  style: TextStyle(
                                      color: const Color.fromARGB(
                                          255, 255, 81, 0),
                                      fontSize: 20.sp),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          }
          return const Center(child: CircularProgressIndicator());
        },
      ) ,
    );
  }
}