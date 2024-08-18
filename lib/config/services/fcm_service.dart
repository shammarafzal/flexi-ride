// import 'dart:io';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:req_fun/req_fun.dart';
// import 'package:gold_boutique/config/keys/pref_keys.dart';
//
//
// class FCMService {
//   final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
//   static bool _initialized = false;
//   static String? _token;
//   static String? _apnsToken;
//
//   static Future<dynamic> Function(Map<String, dynamic> message)? _onMessage;
//   static Future<dynamic> Function(Map<String, dynamic> message)? _onLaunch;
//
//   init() async {
//     if (!_initialized) {
//       if (Platform.isIOS) {
//         _firebaseMessaging.requestPermission(
//           sound: true,
//           badge: true,
//           alert: true,
//           provisional: true,
//         );
//         _apnsToken = await _firebaseMessaging.getAPNSToken();
//         print("FCM APNS Token: $_apnsToken");
//       }
//
//       _token = await _firebaseMessaging.getToken();
//       print("FCM Token: $_token");
//
//       Prefs.setString(PrefKey.fcm_token, _token ?? "");
//
//       _initialized = true;
//
//       FirebaseMessaging.onMessage.listen((event) {
//         print("message received");
//         if (_onMessage != null) _onMessage!(event.data);
//       });
//
//       FirebaseMessaging.onMessageOpenedApp.listen((event) {
//         print("message clicked");
//         if (_onMessage != null) _onLaunch!(event.data);
//       });
//
//        FirebaseMessaging.onBackgroundMessage(_backgroundMessageHandler);
//
//     } else {
//       FirebaseMessaging.onMessage.listen((event) {
//         print("message received");
//         if (_onMessage != null) _onMessage!(event.data);
//       });
//
//       FirebaseMessaging.onMessageOpenedApp.listen((event) {
//         print("message clicked");
//         if (_onMessage != null) _onLaunch!(event.data);
//       });
//
//        FirebaseMessaging.onBackgroundMessage(_backgroundMessageHandler);
//
//     }
//   }
//
//   Future<void> _backgroundMessageHandler(RemoteMessage message) async {
//     print("Background message");
//   }
//
//   static addListener({
//     Future<dynamic> Function(Map<String, dynamic> message)? onMessage,
//     Future<dynamic> Function(Map<String, dynamic> message)? onLaunch,
//   }) {
//     _onMessage = onMessage;
//     _onLaunch = onLaunch;
//   }
//
//   String? getToken() {
//     assert(_initialized, "Please call FCMService.init() first");
//     return _token;
//   }
//
//   String? getAPNSToken() {
//     assert(_initialized, "Please call FCMService.init() first");
//     return _apnsToken;
//   }
// }
