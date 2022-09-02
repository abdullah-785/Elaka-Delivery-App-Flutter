// import 'package:elaka_delivery_app/pages/circularProgress.dart';
// import 'package:elaka_delivery_app/pages/current_no_order.dart';
// import 'package:elaka_delivery_app/pages/current_order.dart';
// import 'package:elaka_delivery_app/pages/deliver_order.dart';
// import 'package:elaka_delivery_app/pages/language.dart';
import 'package:elaka_delivery_app/pages/login.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:elaka_delivery_app/pages/new_password.dart';
// import 'package:elaka_delivery_app/pages/notification_page.dart';
// import 'package:elaka_delivery_app/pages/privcy_policy.dart';
// import 'package:elaka_delivery_app/pages/profile.dart';
// import 'package:elaka_delivery_app/pages/setting.dart';
// import 'package:elaka_delivery_app/pages/start_routing.dart';
// import 'package:elaka_delivery_app/pages/term_and_condition.dart';
// import 'package:elaka_delivery_app/pages/wallet.dart';
import 'package:flutter/material.dart';

// void main() {
//   runApp(const MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: MyApp(),
//   ));
// }
Future main() async {                                         

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp( MaterialApp(
    theme: ThemeData(fontFamily: 'Releway'),
    debugShowCheckedModeBanner: false,
    title: "Ealaka",
    home: MyApp(),
    
    // initialRoute: '/',
    // routes: {
    //   '/': (context) => DetailPage()
    // },
  ));
}






class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Login();
  }
}


// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: 'Flutter Google Maps Demo',
//       home: MapSample(),
//     );
//   }
// }

// class MapSample extends StatefulWidget {
//   const MapSample({Key? key}) : super(key: key);

//   @override
//   State<MapSample> createState() => MapSampleState();
// }

// class MapSampleState extends State<MapSample> {
//   late final Completer<GoogleMapController> _controller = Completer();

//   static const CameraPosition _kGooglePlex = CameraPosition(
//     target: LatLng(37.42796133580664, -122.085749655962),
//     zoom: 14.4746,
//   );

//   static const CameraPosition _kLake = CameraPosition(
//       bearing: 192.8334901395799,
//       target: LatLng(37.43296265331129, -122.08832357078792),
//       tilt: 59.440717697143555,
//       zoom: 19.151926040649414);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GoogleMap(
//         mapType: MapType.normal,
//         initialCameraPosition: _kGooglePlex,
//         onMapCreated: (GoogleMapController controller) {
//           _controller.complete(controller);
//         },
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: _goToTheLake,
//         label: const Text('To the lake!'),
//         icon: const Icon(Icons.directions_boat),
//       ),
//     );
//   }

//   Future<void> _goToTheLake() async {
//     final GoogleMapController controller = await _controller.future;
//     controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
//   }
// }