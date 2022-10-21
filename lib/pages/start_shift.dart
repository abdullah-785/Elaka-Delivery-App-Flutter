import 'package:elaka_delivery_app/pages/available_shift.dart';
import 'package:elaka_delivery_app/pages/current_no_order.dart';
import 'package:elaka_delivery_app/pages/setting.dart';
import 'package:elaka_delivery_app/pages/wallet.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

class StartShift extends StatefulWidget {
  const StartShift({Key? key}) : super(key: key);

  // final String userId;
  // Shift(this.userId);

  @override
  State<StartShift> createState() => _StartShiftState();
}

class _StartShiftState extends State<StartShift> {
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Start Shift",
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
                    const Padding(
                      padding: EdgeInsets.only(top: 25, left: 25, bottom: 20),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text("PickUp Type",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(children: [
                        Container(
                            width: MediaQuery.of(context).size.width * 0.37,
                            height: MediaQuery.of(context).size.height * 0.13,
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 214, 219, 251),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.motorcycle_sharp,
                                  size: 35,
                                  color: Color.fromARGB(255, 23, 68, 100),
                                ),
                                Text("MoterBike",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 23, 68, 100),
                                      // fontSize: 18,
                                    ))
                              ],
                            )),
                        const Spacer(),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.37,
                          height: MediaQuery.of(context).size.height * 0.13,
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 214, 219, 251),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.fire_truck_outlined,
                                size: 35,
                                color: Color.fromARGB(255, 23, 68, 100),
                              ),
                              Text("Truck",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 23, 68, 100),
                                  ))
                            ],
                          ),
                        ),
                      ]),
                    ),
                    const Divider(),
                    const Padding(
                      padding: EdgeInsets.only(top: 25, left: 25, bottom: 20),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text("Bag Type",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(children: [
                        Container(
                            width: MediaQuery.of(context).size.width * 0.37,
                            height: MediaQuery.of(context).size.height * 0.13,
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 214, 219, 251),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.badge_rounded,
                                  size: 35,
                                  color: Color.fromARGB(255, 23, 68, 100),
                                ),
                                Text("Standard Box",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 23, 68, 100),
                                      // fontSize: 18,
                                    ))
                              ],
                            )),
                        const Spacer(),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.37,
                          height: MediaQuery.of(context).size.height * 0.13,
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 214, 219, 251),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.badge_rounded,
                                size: 35,
                                color: Color.fromARGB(255, 23, 68, 100),
                              ),
                              Text("Large Box",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 23, 68, 100),
                                  ))
                            ],
                          ),
                        ),
                      ]),
                    ),
                    const Divider(),
                    HeightBox(20),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Row(
                        children: [
                          Checkbox(
                              value: isChecked1,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked1 = value!;
                                });
                              }),
                          const Text(
                            "I agree to the Privacy Policy",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    HeightBox(35),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.82,
                        height: MediaQuery.of(context).size.height * 0.045,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: const Color.fromARGB(255, 78, 206, 113),
                              onPrimary: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => CurrentNoOrder("") ));
                            },
                            child: Text("Start",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)))
                                    ),
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
                        builder: (context) => CurrentNoOrder("")));
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
