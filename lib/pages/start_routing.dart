import 'dart:async';

import 'package:elaka_delivery_app/pages/deliver_order.dart';
import 'package:elaka_delivery_app/pages/maping.dart';
import 'package:elaka_delivery_app/pages/setting.dart';
import 'package:elaka_delivery_app/pages/wallet.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

class StartRounting extends StatefulWidget {
  const StartRounting({Key? key}) : super(key: key);

  @override 
  State<StartRounting> createState() => _StartRountingState();
}

class _StartRountingState extends State<StartRounting> {
  int currentIndex = 0;
  final Completer<GoogleMapController> _controller =  Completer();

  static const LatLng sourceLocation = LatLng(37.33500926, -122.03272188);
  static const LatLng destination = LatLng(37.33429383, -122.06600055);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 247, 255),
      body: Column(
        children: [
          Expanded(
            child: Image(image: AssetImage("images/map_picture1.png"), 
            fit: BoxFit.cover,
            ),
          ),





          Expanded(
              child: Container(
            // height: 30,
            width: MediaQuery.of(context).size.width * 1,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 20,
                  blurRadius: 15,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                children:  [
                  Padding(
                    padding: const EdgeInsets.only(top: 25, left: 18),
                    child: Row(children: const [
                      Icon(Icons.location_on, 
                      size: 45, 
                      color: Color.fromARGB(255, 10,39,109),),
                      WidthBox(15),
                      Text("RGMG+68P,Hadath, Lebanon", style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 142,148,162)
                      ),)
                    ],),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 70, right: 30),
                    child: Row(children: const [
                      Icon(Icons.speed, size: 30, 
                        color: Color.fromARGB(255, 10,39,109),),
                      Text(" 60mil / H", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                      Spacer(),
                      Icon(Icons.timer_outlined, size: 30, 
                        color: Color.fromARGB(255, 10,39,109),),
                      Text(" 5:30 PM", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)
                    ],),
                  ),
                  const HeightBox(10),
                  Padding(
                    padding: const EdgeInsets.only(top: 25, left: 18),
                    child: Row(children: const [
                      Icon(Icons.location_on, 
                      size: 45, 
                      color: Color.fromARGB(255, 10,39,109),),
                      WidthBox(15),
                      Text("RGMG+68P,Hadath, Lebanon", style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 142,148,162)
                      ),)
                    ],),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 70, right: 30),
                    child: Row(children: const [
                      Icon(Icons.speed, size: 30, 
                        color: Color.fromARGB(255, 10,39,109),),
                      Text(" 60mil / H", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                      Spacer(),
                      Icon(Icons.timer_outlined, size: 30, 
                        color: Color.fromARGB(255, 10,39,109),),
                      Text(" 5:30 PM", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)
                    ],),
                  ),
                  const HeightBox(40),

                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 55,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 78,206,113),
                          onPrimary: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const Maping()));
                        },
                        child: const Text(
                          "Start Now",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        )),
                  ),
                ],
              ),
            ),
          ))
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color.fromARGB(255, 23, 69, 103),
        unselectedItemColor: const Color.fromARGB(255, 23, 69, 103),
        iconSize: 30,

        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const Setting()));
                },
                child: const Icon(Icons.settings)),
            label: 'Setting',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context)=> CurrentOrder()));
              },
              child: const FaIcon(
                FontAwesomeIcons.gift,
                size: 26,
              ),
            ),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const Wallet()));
                },
                child: const Icon(Icons.account_balance_wallet)),
            label: 'Wallet',
          ),
        ],
        // currentIndex: _selectedIndex,
        // selectedItemColor: Colors.amber[800],
        // onTap: _onItemTapped,
      ),
    );
  }
}




