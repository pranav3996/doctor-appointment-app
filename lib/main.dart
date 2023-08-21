import 'package:flutter/material.dart';
import 'package:medicare/routes/router.dart';
import 'package:medicare/utils/textscale.dart';

import 'screens/doctor_detail.dart';
import 'screens/home.dart';
import 'screens/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: fixTextScale,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      // routes: {
      //   '/home': (context) => Home(),
      //    '/detail': (context) => SliverDoctorDetail(),
      // },
      // home: LoginPage(),
      routes: routes,
    );
  }
}
