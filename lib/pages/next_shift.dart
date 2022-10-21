import 'package:elaka_delivery_app/pages/available_shift.dart';
import 'package:elaka_delivery_app/pages/current_no_order.dart';
import 'package:elaka_delivery_app/pages/setting.dart';
import 'package:elaka_delivery_app/pages/start_shift.dart';
import 'package:elaka_delivery_app/pages/wallet.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

class NextShift extends StatefulWidget {
  const NextShift({Key? key}) : super(key: key);

  // final String userId;
  // Shift(this.userId);

  @override
  State<NextShift> createState() => _NextShiftState();
}

class _NextShiftState extends State<NextShift> {
  int currentIndex = 0;
  bool isChecked1 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              // mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.menu,
                  size: 30,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 40),
                  child: Text(
                    "Next Shift",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
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
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 25, left: 25, bottom: 20),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 214, 219, 251),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text(
                                "Not working",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 134, 131, 131)),
                              ),
                            ),
                          )),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 25, top: 10),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Next Shift",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const HeightBox(30),
                    Container(
                      width: MediaQuery.of(context).size.width * .9,
                      height: MediaQuery.of(context).size.height * 0.2,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 10,
                            offset: const Offset(
                                0, 10), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 30, left: 10),
                          child: Row(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 239, 235, 233),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 16, bottom: 16, left: 12, right: 12),
                                  child: Column(
                                    children: const [
                                      Text(
                                        "Oct",
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      Text(
                                        "19",
                                        style: TextStyle(
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "We",
                                        style: TextStyle(fontSize: 18),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const WidthBox(15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("10:00 - 15:15 (5h 15m)",
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  const Text("Sialkot",
                                      style: TextStyle(
                                        fontSize: 18,
                                      )),
                                      const HeightBox(10),
                                  Row(
                                    children: const [
                                      Icon(Icons.badge, color:
                                            Color.fromARGB(255, 78, 206, 113),),
                                      WidthBox(10),
                                      Text("Booked",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        
                                      ))
                                    ]
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        
                        
                      ]),
                    )
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Setting()));
                },
                child: const Icon(Icons.settings)),
            label: 'Setting',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => StartShift()));
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Wallet()));
                },
                child: const Icon(Icons.account_balance_wallet)),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>  AvailableShift()));
                },
                child: const Icon(Icons.shuffle)),
            label: 'Shift',
          ),
        ],
      ),
    );
  }
}
