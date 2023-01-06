// ignore_for_file: unnecessary_brace_in_string_interps, file_names, use_build_context_synchronously

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_builders/GUI/VendorScreens/vendorHome.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:the_builders/GUI/globalApi.dart' as global;
import 'package:image_picker/image_picker.dart';
import 'package:the_builders/Global/global.dart';

class AddNewProduct extends StatefulWidget {
  const AddNewProduct({Key? key}) : super(key: key);

  @override
  State<AddNewProduct> createState() => _AddNewProductState();
}

class _AddNewProductState extends State<AddNewProduct> {
  var vid = Get.arguments;
  TextEditingController pname = TextEditingController();
  TextEditingController pCategory = TextEditingController();
  TextEditingController pUnit = TextEditingController();
  TextEditingController pUnitPrice = TextEditingController();
  TextEditingController pStock = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  File? _imageFIle;

  Future<void> addProductss(File f) async {
    String uri = "${global.url}/addproducttt";
    var request = http.MultipartRequest(
      'Post',
      Uri.parse(uri),
    );

    request.headers.addAll({'Content-type': 'multipart/form-data'});
    request.files.add(await http.MultipartFile.fromPath("", f.path));
    request.fields.addAll({
      "p_desc": pname.text.toString(),
      "p_ctg": pCategory.text.toString(),
      "p_unit": pUnit.text.toString(),
      "vid": login_user_id.toString(),
      "unitcost": pUnitPrice.text.toString(),
      "stock": pStock.text.toString(),
    });
    var response = await request.send();
    //print(response.statusCode);
    if (response.statusCode == 200) {
      Get.snackbar("Message", "Product  added");
      Get.to(const VendorHome());
      //Get.back();
    } else {
      Get.snackbar("Message", "Product not added");
      Get.to(const VendorHome());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 81, 0),
        title: Text(
          ' Add product',
          style: TextStyle(color: Colors.white, fontSize: 38.sp),
        ),
      ),
      backgroundColor: Colors.orangeAccent[200],
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
            SizedBox(
              height: 50.h,
            ),
            SizedBox(
              width: 300.w,
              child: TextField(
                  cursorColor: Colors.white,
                  controller: pname,
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
                  controller: pCategory,
                  style: TextStyle(fontSize: 16.sp, color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Enter Product Category",
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
                  controller: pUnit,
                  style: TextStyle(fontSize: 16.sp, color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Enter Unit",
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
              height: 20.h,
            ),
            SizedBox(
              width: 300.w,
              child: TextField(
                  cursorColor: Colors.white,
                  controller: pStock,
                  style: TextStyle(fontSize: 16.sp, color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Enter Stock",
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
                    //addProducts();
                    //print(_imageFIle);
                    addProductss(_imageFIle!);
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[400],
                ),
                child: Text(
                  'ADD',
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
