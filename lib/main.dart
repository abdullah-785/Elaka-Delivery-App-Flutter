import 'package:elaka_delivery_app/pages/progress_bar.dart';
import 'package:elaka_delivery_app/pages/google_maping.dart';
import 'package:elaka_delivery_app/pages/login.dart';
import 'package:elaka_delivery_app/pages/maping.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


String? email;
Future main() async {                                         

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp( MaterialApp(
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

  getData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      email = prefs.getString('email');
      print(email);
    });
    

  }



  @override
  Widget build(BuildContext context) {
    return email == "AlreadyLogedIn" ? ProgressBar(): Login();
    // return Login();
  }
}

