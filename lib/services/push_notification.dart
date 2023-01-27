import 'dart:io';

import 'package:elaka_delivery_app/services/Auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {
  final FirebaseMessaging _fcm;

  PushNotificationService(this._fcm);

  Future initialise() async {
    if (Platform.isIOS) {
      _fcm.requestPermission(alert: true, announcement: true, badge: true);
    }

    // If you want to test the push notification locally,
    // you need to get the token and input to the Firebase console
    // https://console.firebase.google.com/project/YOUR_PROJECT_ID/notification/compose
    String? token = await _fcm.getToken();
    SharedPrefUtils.saveStr("fcm", token ?? "");
    print("FirebaseMessaging token: $token");

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
    });

    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);

    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      print('getInitialMessage data: ${message?.data}');
      // _serialiseAndNavigate(message);
    });

    // onMessage: When the app is open and it receives a push notification
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("onMessage data: ${message.data}");
    });

    // replacement for onResume: When the app is in the background and opened directly from the push notification.
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('onMessageOpenedApp data: ${message.data}');
      //  _serialiseAndNavigate(message);
    });

    //   _fcm.configure(
    //     onMessage: (Map<String, dynamic> message) async {
    //       print("onMessage: $message");
    //     },
    //     onLaunch: (Map<String, dynamic> message) async {
    //       print("onLaunch: $message");
    //     },
    //     onResume: (Map<String, dynamic> message) async {
    //       print("onResume: $message");
    //     },
    //   );
    // }
  }

  void _handleMessage(RemoteMessage message) {
    print(message);
    // if (message.data['type'] == 'chat') {
    //   Navigator.pushNamed(context, '/chat',
    //     arguments: ChatArguments(message),
    //   );
  }
}
