import 'package:flutter/material.dart';
import 'package:medicare/screens/doctor_detail.dart';
import 'package:medicare/screens/home.dart';
import 'package:medicare/screens/login_page.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/': (context) => LoginPage(),
  '/home': (context) => Home(),
  '/detail': (context) => SliverDoctorDetail(),
};
