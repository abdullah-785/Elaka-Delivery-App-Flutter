import 'dart:async';

import 'package:elaka_delivery_app/main.dart';
import 'package:elaka_delivery_app/models/ordermodel.dart';
import 'package:elaka_delivery_app/pages/available_shift.dart';
import 'package:elaka_delivery_app/pages/setting.dart';
import 'package:elaka_delivery_app/pages/start_shift.dart';
import 'package:elaka_delivery_app/pages/start_routing.dart';
import 'package:elaka_delivery_app/pages/wallet.dart';
import 'package:elaka_delivery_app/services/Auth.dart';
import 'package:elaka_delivery_app/widgets/product_detail_widget.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';

class CurrentOrder extends StatefulWidget {
  const CurrentOrder({Key? key}) : super(key: key);

  @override
  State<CurrentOrder> createState() => _CurrentOrderState();
}

class _CurrentOrderState extends State<CurrentOrder> {
  int currentIndex = 0;
  bool isLoading = false;

  Order? order;
  Timer? timer;
  //Location location = new Location();

  bool _serviceEnabled = false;
  // PermissionStatus? _permissionGranted;
  // LocationData? _locationData;

  double lat = 0;
  double lng = 0;

  int? id;

  @override
  void initState() {
    super.initState();
    setLocationPermission();
    timer = Timer.periodic(Duration(seconds: 5), (Timer t) => updateLocation());
    _setupNotif();
    getUserID();
  }

  @override
  Widget build(BuildContext context) {
    Datum? data = order?.data?.first;
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
              children: [
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
          isLoading
              ? const SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(
                    color: Colors.green,
                    strokeWidth: 2,
                  ))
              : data == null
                  ? noOrderView()
                  : Expanded(
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
                                offset: const Offset(
                                    0, 10), // changes position of shadow
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
                                  padding: const EdgeInsets.only(
                                      left: 40, bottom: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Order Date : ",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(255, 78, 206, 113),
                                        ),
                                      ),
                                      WidthBox(20),
                                      Text(
                                        data.orderDate ?? "",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(255, 78, 206, 113),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 40),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Order No : ",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(255, 78, 206, 113),
                                        ),
                                      ),
                                      WidthBox(33),
                                      Text(
                                        data.orderNumber,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(255, 78, 206, 113),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                HeightBox(30),
                                ProductDetailWidget(order),
                                const SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.85,
                                    height: 50,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: const Color.fromARGB(
                                              255, 78, 206, 113),
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      StartRounting(order)));
                                        },
                                        child: const Text(
                                          "Start Route",
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ))),
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
          BottomNavigationBarItem(
            icon: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AvailableShift()));
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

  ///

  Widget noOrderView() {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width * 1,
        // height: MediaQuery.of(context).size.height * 0.7,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40)),
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
          child: Text(
            "No Current Order",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  ///

  void callAPi(int id) async {
    setState(() {
      isLoading = true;
    });
    var res = await getCurrentOrders(id).then((resp) => {
          //    print(resp)
          handleResp(resp)
        });
  }

  void handleResp(Order? user) {
    setState(() {
      isLoading = false;
    });
    // _showLocalNot();
    if (user?.status == "true") {
      Fluttertoast.showToast(msg: user?.message ?? "");
      setState(() {
        this.order = user;
      });
    } else {
      Fluttertoast.showToast(msg: user?.message ?? "");
    }
  }

  void getUserID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      id = prefs.getInt("userId");
      callAPi(id ?? 0);
    });
  }

  void _showLocalNot() {
    // flutterLocalNotificationsPlugin.show(
    //     4,
    //     "title",
    //     "body",
    //     NotificationDetails(
    //         android: AndroidNotificationDetails(channel.id, channel.name,
    //             playSound: true, color: Colors.blue)));
  }

  void _setupNotif() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      // if (notification != null && android != null) {
      //   flutterLocalNotificationsPlugin.show(
      //       notification.hashCode,
      //       notification.title,
      //       notification.body,
      //       NotificationDetails(
      //         android: AndroidNotificationDetails(
      //           channel.id,
      //           channel.name,
      //           channelDescription: channel.description,
      //           color: Colors.blue,
      //           playSound: true,
      //           icon: '@mipmap/ic_launcher',
      //         ),
      //       ));
      // }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text(notification.title!),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(notification.body!)],
                  ),
                ),
              );
            });
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void setLocationPermission() async {
    LocationPermission permission = await Geolocator.requestPermission();

    if (permission != LocationPermission.denied) {
      var position = await GeolocatorPlatform.instance.getCurrentPosition();

      setState(() {
        lat = position.latitude;
        lng = position.longitude;
      });
    } else {
      LocationPermission permission = await Geolocator.requestPermission();
      await GeolocatorPlatform.instance.getCurrentPosition();
      setLocationPermission();
    }
  }

  void updateLocation() async {
    if (lat != 0) {
       var res = await updateLocationApi(id ?? 0, lat, lng)
         .then((resp) => {print(resp)});
    }
  }
}
