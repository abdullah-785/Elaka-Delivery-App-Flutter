import 'package:elaka_delivery_app/pages/splash_screen.dart';
import 'package:elaka_delivery_app/pages/progress_bar.dart';
import 'package:elaka_delivery_app/pages/current_order.dart';
import 'package:elaka_delivery_app/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:elaka_delivery_app/services/constants.dart';
import 'package:elaka_delivery_app/pages/current_no_order.dart';

String? email;
int? id = 0;
Future main() async {
  runApp(MaterialApp(
    theme: ThemeData(fontFamily: 'Releway'),
    debugShowCheckedModeBanner: false,
    title: "Ealaka",
    home: const SplashScreen(),
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
      id = prefs.getInt(userId);
      print(email);
    });
  }

  @override
  Widget build(BuildContext context) {
    // return id == 0 ? const Login() : CurrentNoOrder(id.toString());
    return CurrentOrder();
  }
}
