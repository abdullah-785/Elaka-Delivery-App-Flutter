import 'package:elaka_delivery_app/pages/current_order.dart';
import 'package:elaka_delivery_app/pages/setting.dart';
import 'package:elaka_delivery_app/pages/start_routing.dart';
import 'package:elaka_delivery_app/pages/wallet.dart';
import 'package:elaka_delivery_app/widgets/product_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

class NotificationDetailPage extends StatefulWidget {
  const NotificationDetailPage({Key? key}) : super(key: key);

  @override
  State<NotificationDetailPage> createState() => _NotificationDetailPageState();
}

class _NotificationDetailPageState extends State<NotificationDetailPage> {
  int currentIndex = 0;
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
                  "Order Detail",
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
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40, bottom: 10),
                        child: Row(
                          children: const [
                            Text(
                              "Vender Name : ",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 78, 206, 113),
                              ),
                            ),
                            WidthBox(20),
                            Text(
                              "John",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 78, 206, 113),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Row(
                          children: const [
                            Text(
                              "Order No : ",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 78, 206, 113),
                              ),
                            ),
                            WidthBox(20),
                            Text(
                              "20",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 78, 206, 113),
                              ),
                            ),
                          ],
                        ),
                      ),
                      HeightBox(30),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          children: const [
                            Text(
                              "Supplier 1",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 78, 206, 113),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const HeightBox(10),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 38,
                        decoration: const BoxDecoration(
                          // 12,21,100
                          color: Color.fromARGB(255, 12, 21, 100),
                        ),
                      ),
                      ProductDetailWidget(),
                      ProductDetailWidget(),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 38,
                        decoration: const BoxDecoration(
                          // 12,21,100
                          color: Color.fromARGB(255, 12, 21, 100),
                        ),
                      ),
                      ProductDetailWidget(),
                      ProductDetailWidget(),
                      ProductDetailWidget(),
                      const SizedBox(
                        height: 20,
                      ),
                      // SizedBox(
                      //     width: MediaQuery.of(context).size.width * 0.85,
                      //     height: 50,
                      //     child: ElevatedButton(
                      //         style: ElevatedButton.styleFrom(
                      //           primary:
                      //               const Color.fromARGB(255, 78, 206, 113),
                      //         ),
                      //         onPressed: () {
                      //           Navigator.push(
                      //               context,
                      //               MaterialPageRoute(
                      //                   builder: (context) =>
                      //                       const StartRounting()));
                      //         },
                      //         child: const Text(
                      //           "Start Route",
                      //           style: TextStyle(
                      //             fontSize: 22,
                      //             fontWeight: FontWeight.bold,
                      //           ),
                      //         ))),
                    ],
                  ),
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
                        builder: (context) => const CurrentOrder()));
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
        ],
        // currentIndex: _selectedIndex,
        // selectedItemColor: Colors.amber[800],
        // onTap: _onItemTapped,
      ),
    );
  }
}
