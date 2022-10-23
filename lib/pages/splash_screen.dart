import 'package:elaka_delivery_app/main.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    _navigateToHome();
  }

  _navigateToHome() async{
    await Future.delayed(Duration(milliseconds: 2000), (){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyApp()));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 90),
            child: Center(
              child: Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          // height: 30,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(150),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    blurRadius: 35,
                                    spreadRadius: 30,
                                    offset: const Offset(3, 3))
                              ]),
                          child: const Image(
                            image: AssetImage("images/logo.png"),
                          ),
                        ),
            ),
          ),
          HeightBox(15),
          const Text("Ealaka", style: TextStyle(
            color: Color.fromARGB(255, 11,16,92),
            fontSize: 36.0,
            fontWeight: FontWeight.bold,
          ),),

          HeightBox(50),
          const Text("Have a Happy Journey With Ealaka", style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 11,16,92),
          ),),

         
              HeightBox(330),
          const Text("Developed and maintain by webtricsol.com", style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),),
          const Text("Email: webtrixsol2@gmail.com", style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
            
          ),),
          

          // Developed and maintain by webtricsol.com
// Email: webtrixsol2@gmail.com
        ],
      )
    );
  }
}