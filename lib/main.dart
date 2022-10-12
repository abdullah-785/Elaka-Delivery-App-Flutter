import 'package:elaka_delivery_app/pages/completed_order.dart';
import 'package:elaka_delivery_app/pages/current_order_details.dart';
import 'package:elaka_delivery_app/pages/deliver_order.dart';
import 'package:elaka_delivery_app/pages/earning.dart';
import 'package:elaka_delivery_app/pages/language.dart';
import 'package:elaka_delivery_app/pages/notification_details_page.dart';
import 'package:elaka_delivery_app/pages/notification_page.dart';
import 'package:elaka_delivery_app/pages/opt_verification.dart';
import 'package:elaka_delivery_app/pages/profile.dart';
import 'package:elaka_delivery_app/pages/progress_bar.dart';
import 'package:elaka_delivery_app/pages/login.dart';
import 'package:elaka_delivery_app/pages/wallet.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? email;
Future main() async {

  runApp(MaterialApp(
    theme: ThemeData(fontFamily: 'Releway'),
    debugShowCheckedModeBanner: false,
    title: "Ealaka",
    home: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      email = prefs.getString('email');
      print(email);
    });
  }

  @override
  Widget build(BuildContext context) {
    return email == "AlreadyLogedIn" ? const ProgressBar() : const Login();
    // return CompletedOrder();
  }
}
