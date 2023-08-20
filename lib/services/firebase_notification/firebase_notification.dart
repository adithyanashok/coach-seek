import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:coach_seek/controller/db/user/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;

class FirebaseNotificationClass {
  final currentUserId = FirebaseAuth.instance.currentUser?.uid;

  FirebaseMessaging messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationPlugin =
      FlutterLocalNotificationsPlugin();

  // Request permission for receiving notifications from Firebase
  Future<void> requestPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }

  // Initialize local notifications with the provided message
  void initLocalNotification(
      BuildContext context, RemoteMessage message) async {
    var androidInitialize =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializeSettings = InitializationSettings(
      android: androidInitialize,
    );
    await flutterLocalNotificationPlugin.initialize(
      initializeSettings,
      onDidReceiveNotificationResponse: (payload) {},
    );
  }

  // Initialize Firebase messaging and set up message handling
  void firebaseInit(BuildContext context) {
    FirebaseMessaging.onMessage.listen((message) {
      if (kDebugMode) {
        print("${message.notification!.title}");
        print("${message.notification!.body}");
      }
      if (Platform.isAndroid) {
        initLocalNotification(context, message);
        showNotification(message);
      }
    });
  }

  // Show a local notification based on the received remote message
  Future<void> showNotification(RemoteMessage message) async {
    AndroidNotificationChannel channel = AndroidNotificationChannel(
      Random.secure().nextInt(100000).toString(),
      'High Importance Notification',
    );
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      channel.id.toString(),
      channel.name.toString(),
      channelDescription: 'Your channel',
      importance: Importance.high,
      priority: Priority.high,
      ticker: 'ticker',
    );

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );
    Future.delayed(Duration.zero, () {
      flutterLocalNotificationPlugin.show(
        0,
        message.notification!.title.toString(),
        message.notification!.body.toString(),
        notificationDetails,
      );
    });
  }

  // Get the FCM token for the current device
  Future<String> getToken() async {
    final token = await FirebaseMessaging.instance.getToken();
    print(token.toString());
    return token!;
  }

  // Handle token refresh and update it in the user database
  Future<void> isTokenRefresh() async {
    messaging.onTokenRefresh.listen((event) async {
      await UserDb().updateFcmToken(userId: currentUserId!, fcmToken: event);
    });
  }

  // Send a push notification message
  Future<void> sendPushMessage(
      {String? body, String? title, required String fcmToken}) async {
    try {
      await http.post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
          headers: <String, String>{
            'content-type': 'application/json',
            'Authorization':
                'key=AAAAe1irTzI:APA91bG6S4_GOjY6sNIzPwhXuCkCNT-7WJgoa5AWPGGsjymysnQbr55-5OD3t7blOzt9vCo7-7N1wtua3t_yZCFKlgPqDkxpXT9Oq66Kx9LvDP6Xuz5vcoTQjaeO9KiGKYw76MuICLxR'
          },
          body: jsonEncode(
            <String, dynamic>{
              'priority': 'high',
              'data': <String, dynamic>{
                'click_action': 'FLUTTER_NOTIFICATION_CLICK',
                'status': 'done',
                'body': body,
                'title': title,
              },
              'notification': <String, dynamic>{
                'title': title,
                'body': body,
                'android_channel_id': 'coach_seek',
              },
              "to": fcmToken,
            },
          ));
    } catch (e) {
      if (kDebugMode) {
        print("Error: $e");
        print(e.toString());
      }
    }
  }
}
