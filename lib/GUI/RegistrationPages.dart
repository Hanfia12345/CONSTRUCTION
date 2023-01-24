import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_builders/API/Registration/RegisterUser.dart' as register;
import 'package:get/get.dart';
import 'package:the_builders/GUI/VendorScreens/SetLocation.dart';
//import 'loginpages.dart';

class RegisterAsVendor extends StatefulWidget {
  const RegisterAsVendor({Key? key}) : super(key: key);

  @override
  State<RegisterAsVendor> createState() => _RegisterAsVendorState();
}

class _RegisterAsVendorState extends State<RegisterAsVendor> {
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  String label = "";
  // var arg=Get.arguments;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color.fromRGBO(255, 81, 0, 1),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            SizedBox(
              height: 50.h,
            ),
            Column(
              children: [
                Text(
                  "Create Your Seller Account!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  height: 55.h,
                  width: 280.w,
                  child: TextField(
                      cursorColor: Colors.white,
                      controller: name,
                      style: TextStyle(fontSize: 16.sp, color: Colors.white),
                      decoration: InputDecoration(
                        labelText:  "Enter Your Name" ,
                        hintText: "Enter Your Name",
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
                  height: 10.h,
                ),
                SizedBox(
                  height: 55.h,
                  width: 280.w,
                  child: TextField(
                      cursorColor: Colors.white,
                      controller: address,
                      style: TextStyle(fontSize: 16.sp, color: Colors.white),
                      decoration: InputDecoration(
                        labelText: "Enter Your Address",
                        hintText: "Enter Your Address",
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
                  height: 10.h,
                ),
                SizedBox(
                  height: 55.h,
                  width: 280.w,
                  child: TextField(
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.white,
                      controller: phone,
                      style: TextStyle(fontSize: 16.sp, color: Colors.white),
                      decoration: InputDecoration(
                        labelText:  "Enter Your Phone No" ,
                        hintText: "Enter Your Phone No",
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
                  height: 10.h,
                ),
                SizedBox(
                  height: 55.h,
                  width: 280.w,
                  child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.white,
                      controller: email,
                      style: TextStyle(fontSize: 16.sp, color: Colors.white),
                      decoration: InputDecoration(
                        labelText: "Enter Email",
                        hintText: "Enter Email",
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
                  height: 10.h,
                ),
                SizedBox(
                  height: 55.h,
                  width: 280.w,
                  child: TextField(
                      cursorColor: Colors.white,
                      controller: password,
                      style: TextStyle(fontSize: 16.sp, color: Colors.white),
                      decoration: InputDecoration(
                        labelText: "Enter password",
                        hintText: "Enter Password",
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
                  height: 10.h,
                ),
                SizedBox(
                  height: 55.h,
                  width: 280.w,
                  child: TextField(
                      cursorColor: Colors.white,
                      controller: confirmpassword,
                      style: TextStyle(fontSize: 16.sp, color: Colors.white),
                      decoration: InputDecoration(
                        labelText: "Confirm password",

                        labelStyle: const TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      )),
                ),
                Text(label),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  height: 40.h,
                  //width: 100.w,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Get.to(const SetLocation());
                    },
                    style: ElevatedButton.styleFrom(

                      backgroundColor: Colors.green[400],
                    ),
                    icon:const Icon(Icons.location_on_outlined),
                    label: Text(
                      'Set Shop Location',
                      style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                SizedBox(height: 40.h,),
                SizedBox(
                  height: 40.h,
                  width: 100.w,
                  child: ElevatedButton(
                    onPressed: () {

                      if (password.text == confirmpassword.text) {
                        register.RegistorUser(name.text, address.text,
                            phone.text, email.text, password.text, 'vendor');
                      } else {
                        label = 'Password did not Match';
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[400],
                    ),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      'Create Acount As',
                      style: TextStyle(color: Colors.white),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const RegisterAsCustomer()));
                        },
                        child: Text(
                          'Customer',
                          style: TextStyle(color: Colors.green[400]),
                        )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      'Create Acount As',
                      style: TextStyle(color: Colors.white),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const RegisterAsDeliveryBoy()));
                        },
                        child: Text('Delivery Boy',
                            style: TextStyle(color: Colors.green[400]))),
                  ],
                )
              ],
            ),
          ],
        ));
  }
}

class RegisterAsCustomer extends StatefulWidget {
  const RegisterAsCustomer({Key? key}) : super(key: key);

  @override
  State<RegisterAsCustomer> createState() => _RegisterAsCustomerState();
}

class _RegisterAsCustomerState extends State<RegisterAsCustomer> {
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  String label = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color.fromRGBO(255, 81, 0, 1),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            SizedBox(
              height: 50.h,
            ),
            Column(
              children: [
                Text(
                  "Create Your Account!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  height: 55.h,
                  width: 280.w,
                  child: TextField(
                      cursorColor: Colors.white,
                      controller: name,
                      style: TextStyle(fontSize: 16.sp, color: Colors.white),
                      decoration: InputDecoration(
                        labelText: "Enter Your Name",
                        hintText: "Enter Your Name",
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
                  height: 10.h,
                ),
                SizedBox(
                  height: 55.h,
                  width: 280.w,
                  child: TextField(
                      cursorColor: Colors.white,
                      controller: address,
                      style: TextStyle(fontSize: 16.sp, color: Colors.white),
                      decoration: InputDecoration(
                        labelText: "Enter Your Address" ,
                        hintText: "Enter Your Address",
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
                  height: 10.h,
                ),
                SizedBox(
                  height: 55.h,
                  width: 280.w,
                  child: TextField(
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.white,
                      controller: phone,
                      style: TextStyle(fontSize: 16.sp, color: Colors.white),
                      decoration: InputDecoration(
                        labelText: "Enter Your Phone No",
                        hintText: "Enter Your Phone No",
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
                  height: 10.h,
                ),
                SizedBox(
                  height: 55.h,
                  width: 280.w,
                  child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.white,
                      controller: email,
                      style: TextStyle(fontSize: 16.sp, color: Colors.white),
                      decoration: InputDecoration(
                        labelText:"Enter Email" ,
                        hintText: "Enter Email",
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
                  height: 10.h,
                ),
                SizedBox(
                  height: 55.h,
                  width: 280.w,
                  child: TextField(
                      cursorColor: Colors.white,
                      controller: password,
                      style: TextStyle(fontSize: 16.sp, color: Colors.white),
                      decoration: InputDecoration(
                        labelText: "Enter Password",
                        hintText: "Enter Password",
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
                  height: 10.h,
                ),
                SizedBox(
                  height: 55.h,
                  width: 280.w,
                  child: TextField(
                      cursorColor: Colors.white,
                      controller: confirmpassword,
                      style: TextStyle(fontSize: 16.sp, color: Colors.white),
                      decoration: InputDecoration(
                        labelText: "Confirm password",
                        hintText: "Confirm password",
                        hintStyle: const TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      )),
                ),
                Text(label),
                SizedBox(
                  height: 60.h,
                ),
                SizedBox(
                  height: 40.h,
                  width: 100.w,
                  child: ElevatedButton(
                    onPressed: () {
                      print(name.text);
                      print(address.text);
                      print(phone.text);
                      print(email.text);
                      print(password.text);
                      print(confirmpassword.text);
                      if (password.text == confirmpassword.text) {
                        register.RegistorUser(name.text, address.text,
                            phone.text, email.text, password.text, 'customer');
                      } else {
                        label = 'Password did not Match';
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[400],
                    ),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      'Create Acount As',
                      style: TextStyle(color: Colors.white),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const RegisterAsVendor()));
                        },
                        child: Text(
                          'Vendor',
                          style: TextStyle(color: Colors.green[400]),
                        )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      'Create Acount As',
                      style: TextStyle(color: Colors.white),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const RegisterAsDeliveryBoy()));
                        },
                        child: Text('Delivery Boy',
                            style: TextStyle(color: Colors.green[400]))),
                  ],
                )
              ],
            ),
          ],
        ));
  }
}

class RegisterAsDeliveryBoy extends StatefulWidget {
  const RegisterAsDeliveryBoy({Key? key}) : super(key: key);

  @override
  State<RegisterAsDeliveryBoy> createState() => _RegisterAsDeliveryBoyState();
}

class _RegisterAsDeliveryBoyState extends State<RegisterAsDeliveryBoy> {
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  String label = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color.fromRGBO(255, 81, 0, 1),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            SizedBox(
              height: 50.h,
            ),
            Column(
              children: [
                Text(
                  "Create Your Account!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  height: 55.w,
                  width: 280.w,
                  child: TextField(
                      cursorColor: Colors.white,
                      controller: name,
                      style: TextStyle(fontSize: 16.sp, color: Colors.white),
                      decoration: InputDecoration(
                        labelText: "Enter Your Name",
                        hintText: "Enter Your Name",
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
                  height: 10.h,
                ),
                SizedBox(
                  height: 55.h,
                  width: 280.w,
                  child: TextField(
                      cursorColor: Colors.white,
                      controller: address,
                      style: TextStyle(fontSize: 16.sp, color: Colors.white),
                      decoration: InputDecoration(
                        labelText: "Enter Your Address",
                        hintText: "Enter Your Address",
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
                  height: 10.h,
                ),
                SizedBox(
                  height: 55.h,
                  width: 280.w,
                  child: TextField(
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.white,
                      controller: phone,
                      style: TextStyle(fontSize: 16.sp, color: Colors.white),
                      decoration: InputDecoration(
                        labelText: "Enter Your Phone No",
                        hintText: "Enter Your Phone No",
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
                  height: 10.h,
                ),
                SizedBox(
                  height: 55.h,
                  width: 280.w,
                  child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.white,
                      controller: email,
                      style: TextStyle(fontSize: 16.sp, color: Colors.white),
                      decoration: InputDecoration(
                        labelText:"Enter Email" ,
                        hintText: "Enter Email",
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
                  height: 10.h,
                ),
                SizedBox(
                  height: 55.h,
                  width: 280.w,
                  child: TextField(
                      cursorColor: Colors.white,
                      controller: password,
                      style: TextStyle(fontSize: 16.sp, color: Colors.white),
                      decoration: InputDecoration(
                        labelText: "Enter Password",
                        hintText: "Enter Password",
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
                  height: 10.h,
                ),
                SizedBox(
                  height: 55.h,
                  width: 280.w,
                  child: TextField(
                      cursorColor: Colors.white,
                      controller: confirmpassword,
                      style: TextStyle(fontSize: 16.sp, color: Colors.white),
                      decoration: InputDecoration(
                        labelText: "Confirm password",
                        labelStyle: const TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      )),
                ),
                Text(label),
                SizedBox(
                  height: 60.h,
                ),
                SizedBox(
                  height: 40.h,
                  width: 100.w,
                  child: ElevatedButton(
                    onPressed: () {
                      print(name.text);
                      print(address.text);
                      print(phone.text);
                      print(email.text);
                      print(password.text);
                      print(confirmpassword.text);
                      if (password.text == confirmpassword.text) {
                        register.RegistorUser(
                            name.text,
                            address.text,
                            phone.text,
                            email.text,
                            password.text,
                            'deliveryboy');
                      } else {
                        label = 'Password did not Match';
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[400],
                    ),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      'Create Acount As',
                      style: TextStyle(color: Colors.white),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const RegisterAsVendor()));
                        },
                        child: Text(
                          'Vendor',
                          style: TextStyle(color: Colors.green[400]),
                        )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      'Create Acount As',
                      style: TextStyle(color: Colors.white),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const RegisterAsCustomer()));
                        },
                        child: Text('Customer',
                            style: TextStyle(color: Colors.green[400]))),
                  ],
                )
              ],
            ),
          ],
        ));
  }
}
