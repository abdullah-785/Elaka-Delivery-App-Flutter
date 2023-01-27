import 'package:elaka_delivery_app/pages/splash_screen.dart';
import 'package:elaka_delivery_app/pages/progress_bar.dart';
import 'package:elaka_delivery_app/pages/current_order.dart';
import 'package:elaka_delivery_app/pages/login.dart';
import 'package:elaka_delivery_app/services/Auth.dart';
import 'package:elaka_delivery_app/services/push_notification.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:elaka_delivery_app/services/constants.dart';
import 'package:elaka_delivery_app/pages/current_no_order.dart';
import 'firebase_options.dart';

String? email;
int? id;
const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.high,
    playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   // If you're going to use other Firebase services in the background, such as Firestore,
//   // make sure you call `initializeApp` before using other Firebase services.
//   await Firebase.initializeApp();

//   print("Handling a background message: ${message.messageId}");
//   if (message.data['title'] != null) {
//     flutterLocalNotificationsPlugin.show(
//         message.data.hashCode,
//         message.data['title'],
//         message.data['body'],
//         NotificationDetails(
//           android: AndroidNotificationDetails(channel.id, channel.name),
//         ));
//   }
// }

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");

//  if (message.data['title'] != null) {
  flutterLocalNotificationsPlugin.show(
      message.hashCode,
      "New Order",
      message.data['message'],
      NotificationDetails(
        android: AndroidNotificationDetails(channel.id, channel.name),
      ));
  //}
}

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  final InitializationSettings initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // options: DefaultFirebaseOptions.currentPlatform,
      );

  FirebaseMessaging messaging = FirebaseMessaging.instance;
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    print('Message also contained a notification: ${message.notification}');
    //if (message.data['title'] != null) {
    flutterLocalNotificationsPlugin.show(
        message.hashCode,
        "New Order",
        message.data['message'],
        NotificationDetails(
          android: AndroidNotificationDetails(channel.id, channel.name),
        ));
    // }
  });

  messaging.getToken().then((value) {
    String? token = value;
    print("FirebaseMessaging token: $token");
    SharedPrefUtils.saveStr("fcm", token ?? "");
  });

  runApp(MaterialApp(
    theme: ThemeData(fontFamily: 'Releway'),
    debugShowCheckedModeBanner: false,
    title: "Ealaka",
    home: const SplashScreen(),
  ));

  // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //   print('Got a message whilst in the foreground!');
  //   if (message.notification != null) {
  //     print('Notification Title: ${message.notification?.title}');
  //     print('Notification Body: ${message.notification?.body}');
  //     if (message.data['title'] != null) {
  //       flutterLocalNotificationsPlugin.show(
  //           message.data.hashCode,
  //           message.data['title'],
  //           message.data['body'],
  //           NotificationDetails(
  //             android: AndroidNotificationDetails(channel.id, channel.name),
  //           ));
  //     }
  //   }
  // });

  // FirebaseMessaging.onBackgroundMessage((message) async {
  //   print('Got a message whilst in the backeground!');
  //   print(message.data);

  //   if (message.data['title'] != null) {
  //     flutterLocalNotificationsPlugin.show(
  //         message.data.hashCode,
  //         message.data['title'],
  //         message.data['body'],
  //         NotificationDetails(
  //           android: AndroidNotificationDetails(channel.id, channel.name),
  //         ));
  //   }
  // });

  // FirebaseMessaging.instance.getInitialMessage().then((message) {
  //   print(message);
  // });

  // FirebaseMessaging.onMessageOpenedApp.listen((event) {
  //   print(event.data);
  //   if (event.data['title'] != null) {
  //     flutterLocalNotificationsPlugin.show(
  //         event.data.hashCode,
  //         event.data['title'],
  //         event.data['body'],
  //         NotificationDetails(
  //           android: AndroidNotificationDetails(channel.id, channel.name),
  //         ));
  //   }
  // });
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getData();
  }

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      id = prefs.getInt("userId"); //SharedPrefUtils.readPrefInt("userId");
      print(email);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (id != null && id != 0) {
      return CurrentOrder();
    } else {
      return const Login();
    }

    // return LunchingApp();
  }
}
