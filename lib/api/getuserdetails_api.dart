import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:freemorsel/api/checkuser.dart';
import 'package:freemorsel/api/userdetails.dart';
import 'package:freemorsel/provider/notifcationprovider.dart';

Future getUserDeatilsApi({required BuildContext context}) async {
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    if (notification != null && android != null) {
      flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              playSound: true,
              icon: '@mipmap/ic_launcher',
            ),
          ));
    }
  });
  await checkLogin().then((value) {
    if (value) {
      UserDetails().getUserDetails(context: context);
    } else {}
  });
}
