// ignore_for_file: camel_case_types, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:get/get.dart';
import 'GUI/loginpages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 851),
        builder: ((context, child) {
          return const GetMaterialApp(
            debugShowCheckedModeBanner: false,
            home: loadingscreen(),
          );
        }));
  }
}

class loadingscreen extends StatefulWidget {
  const loadingscreen({Key? key}) : super(key: key);

  @override
  State<loadingscreen> createState() => _loadingscreenState();
}

class _loadingscreenState extends State<loadingscreen> {
  @override
  void initState() {
    super.initState();
    _navigatetologin();
  }

  _navigatetologin() async {
    await Future.delayed(const Duration(milliseconds: 3000), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const login()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/img3.jpg'),
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 40.h,
              ),
              Text(
                "THE BUILDERS",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 70.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(207, 241, 82, 9)),
              ),
              SizedBox(
                height: 430.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LoadingAnimationWidget.threeArchedCircle(
                      color: const Color.fromARGB(207, 241, 82, 9), size: 25)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
