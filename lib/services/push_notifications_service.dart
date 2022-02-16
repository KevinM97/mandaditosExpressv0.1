import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? tokenMessage;
  static StreamController<String> _messageStream = StreamController.broadcast();

  static Stream<String> get messagesStream => _messageStream.stream;

  static Future _backgroundHandler(RemoteMessage message) async {
    // ignore: avoid_print
    //print('onBackground Hander ${message.messageId}');

    _messageStream.add(message.notification?.title ?? 'No title');
  }

  //Foreground Aplicacion abierta
  static Future _onMessageHandler(RemoteMessage message) async {
    // ignore: avoid_print
    //print('onMessageHandler Hander ${message.messageId}');
    _messageStream.add(message.notification?.title ?? 'No title');
  }

  //Foreground
  static Future _onMessageOpenApp(RemoteMessage message) async {
    // ignore: avoid_print
     print('onMessageOpenApp Hander ${message.messageId}');
    _messageStream.add(message.notification?.title ?? 'No title');
  }

  static Future initializeApp() async {
    await Firebase.initializeApp();
    tokenMessage = await FirebaseMessaging.instance.getToken();
    // ignore: avoid_print
    print(tokenMessage);

    //Handlers
    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);
  }

  static closeStream() {
    _messageStream.close();
  }
}
