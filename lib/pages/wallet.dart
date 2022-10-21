import 'package:badges/badges.dart';
import 'package:elaka_delivery_app/pages/available_shift.dart';
import 'package:elaka_delivery_app/pages/current_no_order.dart';
// import 'package:elaka_delivery_app/pages/circularProgress.dart';
import 'package:elaka_delivery_app/pages/current_order.dart';
// import 'package:elaka_delivery_app/pages/new_password.dart';
import 'package:elaka_delivery_app/pages/notification_page.dart';
// import 'package:elaka_delivery_app/pages/profile.dart';
import 'package:elaka_delivery_app/pages/setting.dart';
import 'package:elaka_delivery_app/pages/start_shift.dart';
import 'package:elaka_delivery_app/resources/global_variable.dart';
import 'package:elaka_delivery_app/widgets/recent_order_list.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

class Wallet extends StatefulWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  int currentIndex = 0;
  // bool isChecked = false;

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back_ios,
                        size: 28.0, color: Color.fromARGB(255, 23, 69, 103))),
                const SizedBox(
                    // width: 50,
                    ),
                const Spacer(),
                const Text(
                  "My Wallet",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Badge(
                    badgeColor: Color.fromARGB(255, 78, 206, 113),
                    animationType: BadgeAnimationType.slide,
                    badgeContent: const Padding(
                      padding: EdgeInsets.all(1.0),
                      child: Text(
                        "2",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NotificationPage()));
                      },
                      child: const Icon(Icons.notifications,
                          size: 30, color: Color.fromARGB(255, 23, 69, 103)),
                    )),
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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.14,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 78, 206, 113),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Column(
                        children: const [
                          HeightBox(10),
                          Text(
                            "Total Amount",
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 248, 245, 245),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          HeightBox(16),
                          Text(
                            "-\$2000",
                            style: TextStyle(
                              fontSize: 40,
                              color: Color.fromARGB(255, 248, 245, 245),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const HeightBox(30),
                    const Padding(
                      padding: EdgeInsets.only(left: 10, bottom: 15),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Recent Orders",
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const HeightBox(10),
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: const [
                            ListOfOrders(),
                            ListOfOrders(),
                            ListOfOrders(),
                            ListOfOrders(),
                            ListOfOrders(),
                            ListOfOrders(),
                            ListOfOrders(),
                            ListOfOrders(),
                            ListOfOrders(),
                            ListOfOrders(),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
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
                        builder: (context) => orderPage == true
                            ? CurrentOrder()
                            : CurrentNoOrder("")));
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
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=> const Wallet()));
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
        // currentIndex: _selectedIndex,
        // selectedItemColor: Colors.amber[800],
        // onTap: _onItemTapped,
      ),
    );
  }
}





