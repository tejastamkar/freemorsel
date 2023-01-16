import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:freemorsel/data/userdata.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    importance: Importance.high,
    playSound: true);

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

getFCM({required String uid}) async {
  fcmToken = (await FirebaseMessaging.instance.getToken())!;
  FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) {
    FirebaseFirestore.instance
        .collection("Users")
        .doc(uid)
        .update({"token": fcmToken});
  }).onError((err) {});
}
