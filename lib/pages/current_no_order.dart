// import 'dart:html';

import 'package:badges/badges.dart';
import 'package:elaka_delivery_app/pages/setting.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CurrentNoOrder extends StatefulWidget {
  const CurrentNoOrder({Key? key}) : super(key: key);

  @override
  State<CurrentNoOrder> createState() => _CurrentNoOrderState();
}

class _CurrentNoOrderState extends State<CurrentNoOrder> {
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
              child: const Center(
                child: Text("No Current Order", style: TextStyle(
                 fontSize: 25,
                 fontWeight: FontWeight.bold
                ),),
              ),
            ),
          ),
      
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(()=>  currentIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor:const Color.fromARGB(255, 23, 69, 103),
        unselectedItemColor: const Color.fromARGB(255, 23, 69, 103),
        iconSize: 30,
        
        
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Setting()));
              },
              child: const Icon(Icons.settings)),
            label: 'Setting',
            
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context)=> Dashboard()));
              },
              child: const FaIcon(FontAwesomeIcons.gift, size: 26,), ),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: (){
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
