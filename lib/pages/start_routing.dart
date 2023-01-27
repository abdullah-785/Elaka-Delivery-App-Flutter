import 'dart:async';

import 'package:elaka_delivery_app/models/ordermodel.dart';
import 'package:elaka_delivery_app/pages/available_shift.dart';
import 'package:elaka_delivery_app/pages/current_no_order.dart';
import 'package:elaka_delivery_app/pages/current_order.dart';
import 'package:elaka_delivery_app/pages/deliver_order.dart';
import 'package:elaka_delivery_app/pages/google_maping.dart';
import 'package:elaka_delivery_app/pages/maping.dart';
import 'package:elaka_delivery_app/pages/setting.dart';
import 'package:elaka_delivery_app/pages/start_shift.dart';
import 'package:elaka_delivery_app/pages/wallet.dart';
import 'package:elaka_delivery_app/resources/global_variable.dart';
import 'package:elaka_delivery_app/services/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:dio/dio.dart';

class StartRounting extends StatefulWidget {
  Order? order;

  StartRounting(this.order);

  @override
  State<StartRounting> createState() => _StartRountingState();
}

class _StartRountingState extends State<StartRounting> {
  int currentIndex = 0;
  final Completer<GoogleMapController> _controller = Completer();

  LatLng? sourceLocation; //= LatLng(37.33500926, -122.03272188);
  static const LatLng destination = LatLng(37.33429383, -122.06600055);
  LatLng? currentPostion;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getUserLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 247, 255),
      body: Column(
        children: [
          Expanded(
            child: Image(
              image: AssetImage("images/map_picture1.png"),
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
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 20,
                        blurRadius: 15,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: widget.order?.data?.length ?? 0,
                      physics: ScrollPhysics(),
                      itemBuilder: (context, index) {
                        var sup = widget.order?.data![index];
                        //getTime(sup!);
                        return Column(
                          children: [
                            const HeightBox(10),
                            Padding(
                              padding: const EdgeInsets.only(top: 25, left: 18),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    size: 45,
                                    color: Color.fromARGB(255, 10, 39, 109),
                                  ),
                                  WidthBox(15),
                                  Text(
                                    sup?.supplierData?.businessAddress ?? "",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(255, 142, 148, 162)),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, left: 70, right: 30),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.speed,
                                    size: 30,
                                    color: Color.fromARGB(255, 10, 39, 109),
                                  ),
                                  Text(
                                    getDistance(sup!),
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  //  Spacer(),
                                  // Icon(
                                  //   Icons.timer_outlined,
                                  //   size: 30,
                                  //   color: Color.fromARGB(255, 10, 39, 109),
                                  // ),
                                  Text(
                                    "",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                            const HeightBox(40),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: 55,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary:
                                        const Color.fromARGB(255, 78, 206, 113),
                                    onPrimary: Colors.white,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => GoogleMapping(
                                                currentPostion,
                                                convertLocation(sup),
                                                widget.order?.data?.first.id ??
                                                    0)));
                                  },
                                  child: const Text(
                                    "Start Now",
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                          ],
                        );
                      })
                  // SingleChildScrollView(
                  //   child:
                  //   Column(
                  //     children: [

                  //       const HeightBox(10),
                  //       Padding(
                  //         padding: const EdgeInsets.only(top: 25, left: 18),
                  //         child: Row(
                  //           children: const [
                  //             Icon(
                  //               Icons.location_on,
                  //               size: 45,
                  //               color: Color.fromARGB(255, 10, 39, 109),
                  //             ),
                  //             WidthBox(15),
                  //             Text(
                  //               "RGMG+68P,Hadath, Lebanon",
                  //               style: TextStyle(
                  //                   fontSize: 18,
                  //                   fontWeight: FontWeight.bold,
                  //                   color: Color.fromARGB(255, 142, 148, 162)),
                  //             )
                  //           ],
                  //         ),
                  //       ),
                  //       Padding(
                  //         padding:
                  //             const EdgeInsets.only(top: 20, left: 70, right: 30),
                  //         child: Row(
                  //           children: const [
                  //             Icon(
                  //               Icons.speed,
                  //               size: 30,
                  //               color: Color.fromARGB(255, 10, 39, 109),
                  //             ),
                  //             Text(
                  //               " 60mil / H",
                  //               style: TextStyle(
                  //                   fontSize: 16, fontWeight: FontWeight.bold),
                  //             ),
                  //             Spacer(),
                  //             Icon(
                  //               Icons.timer_outlined,
                  //               size: 30,
                  //               color: Color.fromARGB(255, 10, 39, 109),
                  //             ),
                  //             Text(
                  //               " 5:30 PM",
                  //               style: TextStyle(
                  //                   fontSize: 16, fontWeight: FontWeight.bold),
                  //             )
                  //           ],
                  //         ),
                  //       ),
                  //       const HeightBox(40),
                  //       SizedBox(
                  //         width: MediaQuery.of(context).size.width * 0.9,
                  //         height: 55,
                  //         child: ElevatedButton(
                  //             style: ElevatedButton.styleFrom(
                  //               primary: const Color.fromARGB(255, 78, 206, 113),
                  //               onPrimary: Colors.white,
                  //             ),
                  //             onPressed: () {
                  //               Navigator.push(
                  //                   context,
                  //                   MaterialPageRoute(
                  //                       builder: (context) => const GoogleMapping()));
                  //             },
                  //             child: const Text(
                  //               "Start Now",
                  //               style: TextStyle(
                  //                   fontSize: 22, fontWeight: FontWeight.bold),
                  //             )),
                  //       ),
                  //     ],
                  //   ),
                  // ),
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

  void _getUserLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();

    if (permission != LocationPermission.denied) {
      var position = await GeolocatorPlatform.instance.getCurrentPosition();

      setState(() {
        currentPostion = LatLng(position.latitude, position.longitude);
        sourceLocation = currentPostion;
      });
    } else {
      LocationPermission permission = await Geolocator.requestPermission();
      await GeolocatorPlatform.instance.getCurrentPosition();
      _getUserLocation();
    }
  }

  String getDistance(Datum data) {
    var sup = data.supplierData;
    String lat = sup?.lat ?? "";
    String lng = sup?.lng ?? "";

    double latDouble = double.parse(lat);
    double lngDouble = double.parse(lng);

    if (currentPostion != null) {
      var dis = Geolocator.distanceBetween(latDouble, lngDouble,
          currentPostion!.latitude, currentPostion!.longitude);
      var mileFromMeter = dis / 1609.344;

      print(mileFromMeter);
      return mileFromMeter.toStringAsFixed(2) + "mil";
    }
    return "";
  }

  LatLng convertLocation(Datum data) {
    var sup = data.supplierData;
    String lat = sup?.lat ?? "";
    String lng = sup?.lng ?? "";

    double latDouble = double.parse(lat);
    double lngDouble = double.parse(lng);
    return LatLng(latDouble, lngDouble);
  }

  void getTime(Datum data) async {
    var sup = data.supplierData;
    String lat = sup?.lat ?? "";
    String lng = sup?.lng ?? "";

    String curLat = "";
    String curLng = "";

    String apiKey = google_map_key;

    if (currentPostion != null) {
      curLat = currentPostion!.latitude.toString();
      curLng = currentPostion!.longitude.toString();
    }

    Dio dio = new Dio();
    String url =
        "https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=$curLat,$curLng&destinations=$lat,$lng&key=$apiKey";
    Response response = await dio.get(url);
    print(response.data);
  }
}
