// ignore_for_file: file_names, non_constant_identifier_names
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:the_builders/GUI/VendorScreens/vendorHome.dart';
import 'package:the_builders/GUI/globalApi.dart' as global;
import 'package:http/http.dart' as http;
import 'package:the_builders/Global/global.dart';
// ignore: library_prefixes
import 'package:the_builders/API/vendorApi.dart' as vendorApi;

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  String data = Get.arguments;

  Future<List<vendorApi.ProductDetail>>? pdetails;

  @override
  void initState() {
    super.initState();
    //print(vendor_product_id);
    pdetails = vendorApi.ViewDetails(vendor_product_id);
  }

  Future<void> RemoveProduct() async {
    if (vendor_product_id != null) {
      var response = await http.delete(Uri.parse(
        "${global.url}/deleteVendorProduct?pid=$vendor_product_id",
      ));
      //print(response.body);
      if (response.statusCode == 200) {
        //print(response.body);
        //print(response.statusCode);
        Get.snackbar("Message", "Product Removed");
        Get.to(() => const VendorHome());
        //Get.back();
      } else {
        Get.snackbar("Message", "Product not Removed");
        Get.to(const VendorHome());
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Product id is Null')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orangeAccent[200],
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 255, 81, 0),
          title: Text(
            'Details',
            style: TextStyle(color: Colors.white, fontSize: 38.sp),
          ),
        ),
        body: Center(
          child: FutureBuilder<List<vendorApi.ProductDetail>>(
            future: pdetails,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView(
                  children: [
                    SizedBox(
                      height: 30.h,
                    ),
                    Center(
                      child: Text(
                        snapshot.data![0].pDesc.toString(),
                        style: TextStyle(
                            color: const Color.fromARGB(255, 228, 200, 150),
                            fontSize: 38.sp),
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Category :',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 22.sp),
                            ),
                            SizedBox(
                              width: 30.w,
                            ),
                            Text(
                              snapshot.data![0].pCtg.toString(),
                              style: TextStyle(
                                  color: Colors.white, fontSize: 22.sp),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Available Stock :',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 22.sp),
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            Text(
                              snapshot.data![0].stock.toString(),
                              style: TextStyle(
                                  color: Colors.white, fontSize: 22.sp),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              snapshot.data![0].pUnit.toString(),
                              style: TextStyle(
                                  color: Colors.white, fontSize: 22.sp),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Price Per Unit :',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 22.sp),
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            Text(
                              snapshot.data![0].unitcost.toString(),
                              style: TextStyle(
                                  color: Colors.white, fontSize: 22.sp),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Get.to(
                                  () => const EditProduct(),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green[400],
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
                                RemoveProduct();
                                dispose();
                                //setState(() {});
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green[400],
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
                  ],
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ));
  }
}

class EditProduct extends StatefulWidget {
  const EditProduct({Key? key}) : super(key: key);

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  final ImagePicker _picker = ImagePicker();
  TextEditingController pDesc = TextEditingController();
  TextEditingController pUnitPrice = TextEditingController();
  TextEditingController AvailableStock = TextEditingController();
  File? _imageFIle;
  Future<void> UpdateProduct(File f) async {
    String uri = "${global.url}/updateproduct";
    var request = http.MultipartRequest(
      'Patch',
      Uri.parse(uri),
    );
    request.headers.addAll({'Content-type': 'multipart/form-data'});
    //print(image.path);
    request.files.add(await http.MultipartFile.fromPath("", f.path));
    request.fields.addAll({
      "pid": vendor_product_id.toString(),
      "p_desc": pDesc.text.toString(),
      "unitcost": pUnitPrice.text.toString(),
      "stock": AvailableStock.text.toString(),
    });
    var response = await request.send();
    if (response.statusCode == 200) {
      Get.snackbar("Message", "Product  Updated");
      Get.to(const VendorHome());
      //Get.back();
    } else {
      //print(response.statusCode);
      Get.snackbar("Message", "Product not Updated");
      Get.to(const VendorHome());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent[200],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 81, 0),
        title: Text(
          '',
          style: TextStyle(color: Colors.white, fontSize: 38.sp),
        ),
      ),
      //backgroundColor: const Color.fromARGB(255, 255, 110, 43),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 180.h,
                width: 180.w,
                color: Colors.white,
                child: _imageFIle == null
                    ? const Center(child: Text('NO Image'))
                    : Image.file(
                        _imageFIle!,
                        fit: BoxFit.fill,
                      ),
              ),
            ),
            Center(
                child: ElevatedButton(
              onPressed: () async {
                await showDialog(
                    context: context,
                    builder: (builder) {
                      return AlertDialog(
                        title: const Text("Choose your source"),
                        actions: [
                          TextButton(
                            onPressed: () async {
                              final XFile? image = await _picker.pickImage(
                                  source: ImageSource.gallery);

                              if (image != null) {
                                _imageFIle = File(image.path);
                                //await addProductss(_imageFIle!);
                              }
                              // ignore: use_build_context_synchronously
                              Navigator.of(context).pop();
                            },
                            child: const Text("Gallery"),
                          ),
                          TextButton(
                            onPressed: () async {
                              final XFile? image = await _picker.pickImage(
                                  source: ImageSource.camera);
                              if (image != null) {
                                _imageFIle = File(image.path);
                              }
                              // ignore: use_build_context_synchronously
                              Navigator.of(context).pop();
                            },
                            child: const Text("Camera"),
                          )
                        ],
                      );
                    });
                setState(() {});
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[400],
              ),
              child: const Text(
                'Pick Image',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            )),
            SizedBox(height: 60.h),
            Center(
              child: Text(
                'Edit Product',
                style: TextStyle(color: Colors.white, fontSize: 38.sp),
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            SizedBox(
              width: 300.w,
              child: TextField(
                  cursorColor: Colors.white,
                  controller: pDesc,
                  style: TextStyle(fontSize: 16.sp, color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Enter Product Name",
                    hintStyle: const TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                    ),
                  )),
            ),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              width: 300.w,
              child: TextField(
                  cursorColor: Colors.white,
                  controller: AvailableStock,
                  style: TextStyle(fontSize: 16.sp, color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Enter Available Stock",
                    hintStyle: const TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                    ),
                  )),
            ),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              width: 300.w,
              child: TextField(
                  cursorColor: Colors.white,
                  controller: pUnitPrice,
                  style: TextStyle(fontSize: 16.sp, color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Enter Price/unit",
                    hintStyle: const TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                    ),
                  )),
            ),
            SizedBox(
              height: 100.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 210.w),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    UpdateProduct(_imageFIle!);
                  });

                  Get.to(
                    () => const ProductDetails(),
                    arguments: vendor_product_id,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[400],
                ),
                child: Text(
                  'Done',
                  style: TextStyle(
                      fontSize: 22.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
