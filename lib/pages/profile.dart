// import 'dart:html';

import 'package:badges/badges.dart';
import 'package:elaka_delivery_app/models/LoginModel.dart';
import 'package:elaka_delivery_app/pages/current_no_order.dart';
import 'package:elaka_delivery_app/pages/progress_bar.dart';
import 'package:elaka_delivery_app/pages/current_order.dart';
import 'package:elaka_delivery_app/pages/eidt_profile.dart';
import 'package:elaka_delivery_app/pages/setting.dart';
import 'package:elaka_delivery_app/pages/wallet.dart';
import 'package:elaka_delivery_app/resources/global_variable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:elaka_delivery_app/services/Auth.dart';

class Profile extends StatefulWidget {
  final String userId;
  Profile(this.userId);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int currentIndex = 0;
  LoginUser? user;

  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }

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
              children: [
                SizedBox(
                  width: 15,
                ),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: Colors.white,
                          width: 5.0,
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              blurRadius: 35,
                              spreadRadius: 30,
                              offset: const Offset(3, 3))
                        ]),
                    child: const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Image(image: AssetImage("images/logo.png")),
                    )),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  user?.data?.firstName ?? "",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
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
                    // Padding(
                    //   padding: const EdgeInsets.only(right: 16),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.end,
                    //     children: [
                    //       GestureDetector(
                    //         onTap: () {
                    //           Navigator.push(
                    //               context,
                    //               MaterialPageRoute(
                    //                   builder: (context) => EditProfile(user)));
                    //         },
                    //         child: Container(
                    //           width: 44,
                    //           height: 44,
                    //           decoration: BoxDecoration(
                    //               color: Color.fromARGB(255, 223, 230, 243)
                    //                   .withOpacity(0.85),
                    //               borderRadius: BorderRadius.circular(50),
                    //               boxShadow: [
                    //                 BoxShadow(
                    //                     color: Colors.grey.withOpacity(0.1),
                    //                     blurRadius: 35,
                    //                     spreadRadius: 30,
                    //                     offset: const Offset(3, 3))
                    //               ]),
                    //           child: const Icon(
                    //             Icons.edit,
                    //             color: Colors.blueAccent,
                    //           ),
                    //         ),
                    //       )
                    //     ],
                    //   ),
                    // ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              Icon(
                                Icons.email,
                                color: Color.fromARGB(255, 78, 206, 113),
                                size: 28,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                "Email",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 18, 22, 24),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 44),
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  user?.data?.email ?? "",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                )),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              Icon(
                                Icons.phone,
                                color: Color.fromARGB(255, 78, 206, 113),
                                size: 28,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                "Phone Number",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 18, 22, 24),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 44),
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  user?.data?.phoneNumber ?? "",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                )),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              Icon(
                                Icons.insert_drive_file,
                                color: Color.fromARGB(255, 78, 206, 113),
                                size: 28,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                "Driving License",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 18, 22, 24),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 44),
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  user?.data?.drivingLicense ?? "",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                )),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              Icon(
                                Icons.calendar_view_week_rounded,
                                color: Color.fromARGB(255, 78, 206, 113),
                                size: 28,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                "Vehicle Number",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 18, 22, 24),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 44),
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  user?.data?.vehicalNumber ?? "",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                )),
                          ),
                        ],
                      ),
                    ),
                    (isLoading)
                        ? const SizedBox(
                            width: 50,
                            height: 50,
                            child: CircularProgressIndicator(
                              color: Colors.green,
                              strokeWidth: 2,
                            ))
                        : Text("")
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
                            : CurrentNoOrder(widget.userId)));
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

  getUser() async {
    String id = await SharedPrefUtils.readPrefStr("userId");

    setState(() {
      isLoading = true;
    });

    await getUserById(id).then((value) => {
          if (value!.status == "true")
            {
              setState(() {
                isLoading = false;
                user = value;
              })
            }
        });
  }
}
