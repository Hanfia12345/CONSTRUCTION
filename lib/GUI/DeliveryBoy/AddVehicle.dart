import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:the_builders/GUI/globalApi.dart' as global;
import 'package:the_builders/Global/global.dart';
import 'package:the_builders/GUI/DeliveryBoy/HomePage.dart';

class AddVehicle extends StatefulWidget {
  const AddVehicle({Key? key}) : super(key: key);

  @override
  State<AddVehicle> createState() => _AddVehicleState();
}

class _AddVehicleState extends State<AddVehicle> {
  TextEditingController vname = TextEditingController();
  TextEditingController vregno = TextEditingController();
  TextEditingController vmodno = TextEditingController();
  int fare=0;
  String inititalValue = 'Loader';
  var items = ['Loader', 'Suzuki', 'Shehzore','Tractor Trolley','Dumper'];

  void addVehicle()async{
    print(fare);
    print(login_user_id);
    var httprequest=GetConnect();
    var response=await httprequest.post("${global.url}/AddVehicle?dbid=${int.parse(login_user_id!)}&name=$inititalValue&tno=${vregno.text}&modNo=${vmodno.text}&fare=$fare",{});
    if(response.statusCode==200){
      Get.snackbar("Message", response.body);
      Get.off(()=>const HomePage());
    }else{
      Get.snackbar("Message", "not added");}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: const Color.fromRGBO(245, 240, 246, 1.0),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(102, 103, 171, 1.0),
        centerTitle: true,
        title: const Text("Add Vehicle"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(width: 350.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(
                  height: 50.h,
                ),
                Text("Please Provide Your Vehicle Details",
            style: TextStyle(fontSize: 21.sp, color: const Color.fromRGBO(204, 41, 54, 1.0),fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 50.h,
                ),
                Text("Select Type",style: TextStyle(fontSize: 18.sp,
                    color: const Color.fromRGBO(204, 41, 54, 1.0))),
                SizedBox(
                  height: 3.h,
                ),
                Container(

                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 0.4),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8,0,8,0),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                          //borderRadius: BorderRadius.circular(5),
                          value: inititalValue,
                          icon: const Icon(
                            Icons.arrow_drop_down_outlined,
                            color: Color.fromRGBO(204, 41, 54, 1.0),
                          ),

                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(
                                items,
                                style: TextStyle(
                                    color:
                                    const Color.fromRGBO(204, 41, 54, 1.0),
                                    fontSize: 22.sp),
                              ),

                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              inititalValue = newValue!;
                            });
                          }
                          ),
                    ),
                  ),
                ),


                SizedBox(
                  height: 20.h,
                ),
                Text("Registration Number ",style: TextStyle(fontSize: 18.sp,
                    color: const Color.fromRGBO(204, 41, 54, 1.0))),
                SizedBox(
                  height: 3.h,
                ),
                TextField(
                    //cursorColor: Colors.white,
                    controller: vregno,
                    style: TextStyle(fontSize: 16.sp, color: const Color.fromRGBO(204, 41, 54, 1.0)),
                    decoration: InputDecoration(
                      hintText:" e.g  XYZ-0000" ,
                      fillColor: Colors.white,
                      filled: true,
                      //hintStyle: const TextStyle(color:Color.fromRGBO(204, 41, 54, 0.2)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                    )),
                SizedBox(
                  height: 20.h,
                ),
                Text("Model Number ",style: TextStyle(fontSize: 18.sp,
                    color: const Color.fromRGBO(204, 41, 54, 1.0))),
                SizedBox(
                  height: 3.h,
                ),
                TextField(
                    cursorColor: Colors.white,
                    controller: vmodno,
                    style: TextStyle(fontSize: 16.sp,  color: const Color.fromRGBO(204, 41, 54, 1.0)),
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText:"e.g  2022" ,
                      //hintStyle: const TextStyle(color:Color.fromRGBO(204, 41, 54, 1.0)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                    )),

                SizedBox(
                  height: 70.h,
                ),
                SizedBox(width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if(inititalValue=="Loader"){
                        fare=80;
                      }
                      else if(inititalValue=="Suzuki"){
                        fare=100;
                      }
                      else if(inititalValue=="Shehzore"){
                        fare=150;
                      }
                      else if(inititalValue=="Tractor Trolley"){
                        fare=190;
                      }
                      else if(inititalValue=="Dumper"){
                        fare=300;
                      }


                      addVehicle();

                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(102, 103, 171, 1.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'ADD',
                        style: TextStyle(
                            fontSize: 22.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
