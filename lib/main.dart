import 'package:appointment_manager/screens/splashScreen/splash_screen.dart';
import 'package:appointment_manager/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        builder: (context, child) {
          return GetMaterialApp(
            title: 'Shop M8',
            getPages: Routes.routes,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primarySwatch: Colors.blue,
                fontFamily: 'Poppins',
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent),
            home: const SplashScreenPage(),
          );
        });
  }
}
