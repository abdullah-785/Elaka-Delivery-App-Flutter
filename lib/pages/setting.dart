// import 'dart:html';

import 'package:badges/badges.dart';
import 'package:elaka_delivery_app/pages/circularProgress.dart';
import 'package:elaka_delivery_app/pages/language.dart';
import 'package:elaka_delivery_app/pages/login.dart';
import 'package:elaka_delivery_app/pages/new_password.dart';
import 'package:elaka_delivery_app/pages/privcy_policy.dart';
import 'package:elaka_delivery_app/pages/profile.dart';
import 'package:elaka_delivery_app/pages/term_and_condition.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);
  

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  int currentIndex = 0;
  //   bool firstBuild = true;
  // // show Open Dialog method
  // _showOpenDialog(context) {
  //   showDialog(
  //       context: context,
  //       builder: (context) {
  //         return Dialog(
            
  //         );
  //       });
  // }



  @override
  Widget build(BuildContext context) {

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   if (firstBuild) {
    //     firstBuild = false;
    //     _showOpenDialog(context);
    //   }
    // });

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
                Spacer(),
                const Text(
                  "Setting",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Badge(
                    badgeColor: Colors.green,
                    animationType: BadgeAnimationType.slide,
                    badgeContent: const Padding(
                      padding: EdgeInsets.all(1.0),
                      child: Text(
                        "2",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    child: const Icon(Icons.notifications,
                        size: 30, color: Color.fromARGB(255, 23, 69, 103))),
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
                    SizedBox(height: 50,),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Profile() ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32,),
                          child: Row(
                            children: const [
                              Icon(Icons.person, size: 30, color: Colors.green,),
                              SizedBox(width: 20,),
                              Text("Profile", style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey
                              ),),
                              
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8,),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => NewPassword()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          child: Row(
                            children: const [
                              Icon(Icons.lock, size: 30, color: Colors.green,),
                              SizedBox(width: 20,),
                              Text("Change Password", style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey
                              ),),
                              
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8,),
                    
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Language()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          child: Row(
                            children: const [
                              Icon(Icons.g_translate, size: 30, color: Colors.green,),
                              SizedBox(width: 20,),
                              Text("Language", style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey
                              ),),
                            ],
                          ),
                        ),
                      ),
                    ),
                    
                    SizedBox(height: 8,),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => PrivacyPolice() ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          child: Row(
                            children: const [
                              Icon(Icons.policy, size: 30, color: Colors.green,),
                              SizedBox(width: 20,),
                              Text("Privacy Police", style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey
                              ),),
                            ],
                          ),
                        ),
                      ),
                    ),
                   
                    SizedBox(height: 8,),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => TermCondition()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          child: Row(
                            children: const [
                              Icon(Icons.insert_page_break_sharp, size: 30, color: Colors.green,),
                              SizedBox(width: 20,),
                              Text("Term & Condition", style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey
                              ),),
                            ],
                          ),
                        ),
                      ),
                    ),



                    SizedBox(height: 8,),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: GestureDetector(
                        onTap: (){
                          print("Clicked");
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          child: Row(
                            children: const [
                              
                              Icon(Icons.money, size: 30, color: Colors.green,),
                              SizedBox(width: 20,),
                              Text("Earning", style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey
                              ),),
                            ],
                          ),
                        ),
                      ),
                    ),
                    
                    SizedBox(height: 8,),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          child: Row(
                            children: const [
                              
                              Icon(Icons.logout_outlined, size: 30, color: Colors.green,),
                              SizedBox(width: 20,),
                              Text("Logout", style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey
                              ),),
                            ],
                          ),
                        ),
                      ),
                    ),
                    
                    SizedBox(height: 8,),
                    
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
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=> Setting()));
                },
                child: const Icon(Icons.settings)),
            label: 'Setting',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context)=> Setting()));
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
    );
  }
}
