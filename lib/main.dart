import 'package:elaka_delivery_app/pages/circularProgress.dart';
import 'package:elaka_delivery_app/pages/current_no_order.dart';
import 'package:elaka_delivery_app/pages/current_order.dart';
import 'package:elaka_delivery_app/pages/language.dart';
import 'package:elaka_delivery_app/pages/login.dart';
import 'package:elaka_delivery_app/pages/new_password.dart';
import 'package:elaka_delivery_app/pages/privcy_policy.dart';
import 'package:elaka_delivery_app/pages/profile.dart';
import 'package:elaka_delivery_app/pages/setting.dart';
import 'package:elaka_delivery_app/pages/term_and_condition.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Login();
  }
}