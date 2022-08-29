import 'package:elaka_delivery_app/pages/current_no_order.dart';
import 'package:elaka_delivery_app/pages/current_order.dart';
import 'package:elaka_delivery_app/pages/setting.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:percent_indicator/percent_indicator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

class ProgressBar extends StatefulWidget {
  const ProgressBar({Key? key}) : super(key: key);

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  int currentIndex = 0;
  int _timecounter = 40;

  // void _startCounterDown() {
  //   Timer.periodic(Duration(seconds: 40), (timer) {
  //     setState(() {
  //       _timecounter--;
  //     });
  //   });
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 247, 255),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 70,
              left: 16,
              right: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Current Order",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Expanded(
            child: Container(
                width: MediaQuery.of(context).size.width * 1,
                // height: MediaQuery.of(context).size.height * 0.7,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 20,
                      blurRadius: 15,
                      offset: const Offset(0, 10), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const HeightBox(50),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 64, vertical: 25),
                      child: Text(
                        "Hy John you just received new order request it will be auto accepted within given time.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    ),
                    CircularPercentIndicator(
                        // fillColor: Colors.green,
                        backgroundColor: Colors.green,
                        progressColor: Colors.grey,
                        // arcBackgroundColor: Colors.green,
                        radius: 60.0,
                        lineWidth: 15.0,
                        percent: 100 / 100,
                        animation: true,
                        animationDuration: 40000,
                        center: Text("$_timecounter",
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.green,
                            ))),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 64, vertical: 25),
                      child: Text(
                        "Specify a reason for rejection",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    ),
                    const HeightBox(100),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const CurrentOrder()));
                            },
                            child: const Text("Accept"))),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const CurrentNoOrder()));
                            },
                            child: const Text("Reject"))),
                  ],
                )),
          ),
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Setting()));
                },
                child: const Icon(Icons.settings)),
            label: 'Setting',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context)=> Dashboard()));
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
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfilePage()));
                },
                child: const Icon(Icons.account_balance_wallet)),
            label: 'Wallet',
          ),
        ],
        // currentIndex: _selectedIndex,
        // selectedItemColor: Colors.amber[800],
        // onTap: _onItemTapped,
      ),
    ));
  }
}
