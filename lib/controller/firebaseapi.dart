import 'dart:io';
import 'dart:math';
//import 'package:bjp_leader/main.dart';
import 'package:bjp_leader/mainpage.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

// Future<void> _backgroundMessageHandler(RemoteMessage message) async {
//   if (message.notification != null) {
//     // Handle the notification and navigate to the ProfileScreen
//     Get.offAll(() => MainScreen(index: 4));
//   }
// }

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin flutterlocnotplugin =
      FlutterLocalNotificationsPlugin();

  void initLocalNotification(
      BuildContext context, RemoteMessage message) async {
    var anroidInitialization =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationsetting =
        InitializationSettings(android: anroidInitialization);
    await flutterlocnotplugin.initialize(initializationsetting,
        onDidReceiveNotificationResponse: (payload) {
      handleMessage(context, message);
    });
  }

  void notiPermission() async {
    NotificationSettings setting = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      provisional: true,
      sound: true,
    );
    if (setting.authorizationStatus == AuthorizationStatus.authorized) {
      print("Granted Permission by user");
    } else if (setting.authorizationStatus == AuthorizationStatus.authorized) {
      print("Granted provisional by user");
    } else {
      print(" denied  by user");
    }
  }

  Future<void> getDeviceToken() async {
    String? token = await _firebaseMessaging.getToken();
    print("token is :$token");
  }

  void isTokenfresh() async {
    _firebaseMessaging.onTokenRefresh.listen((event) {
      event.toString();
      print("Refresh");
    });
  }

  void firebaseInit(BuildContext context) {
    FirebaseMessaging.onMessage.listen((message) {
      if (Platform.isAndroid) {
        initLocalNotification(context, message);
        shownotification(message);
      }
    });
  }

  // void firebaseInit() {
  //   FirebaseMessaging.onMessage.listen((msg) {
  //     print(msg.notification!.title.toString());
  //     print(msg.notification!.body.toString());
  //     shownotification(msg);
  //   });
  // }

  Future<void> shownotification(RemoteMessage message) async {
    AndroidNotificationChannel channel = AndroidNotificationChannel(
        Random.secure().nextInt(1000000).toString(), "high_importance_channel",
        importance: Importance.max);

    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
            channel.id.toString(), channel.name.toString(),
            channelDescription: "your channel description",
            importance: Importance.high,
            priority: Priority.high,
            ticker: 'ticker');

    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    Future.delayed(Duration.zero, () {
      flutterlocnotplugin.show(0, message.notification!.title.toString(),
          message.notification!.body.toString(), notificationDetails);
    });
  }

  void handleMessage(BuildContext context, RemoteMessage message) {
    //if(message.data)
    Get.to(() => const MainScreen(
          index: 4,
        ));
  }

  Future<void> setupIneractMessage(BuildContext context) async {
    //when kill
    RemoteMessage? initialmessage =
        await FirebaseMessaging.instance.getInitialMessage();
    if (initialmessage != null) {
      handleMessage(context, initialmessage);
    }
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      handleMessage(context, event);
    });
  }
}
