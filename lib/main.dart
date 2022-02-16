import 'package:flutter/material.dart';
import 'package:mandaditos_express/Screens/login/check_outh_screen.dart';
import 'package:mandaditos_express/Screens/message_screen.dart';
import 'package:mandaditos_express/services/auth_services.dart';
import 'package:mandaditos_express/services/notifications_service.dart';
import 'package:mandaditos_express/services/push_notifications_service.dart';
import 'package:provider/provider.dart';
import 'package:mandaditos_express/Screens/home_scream.dart';
import 'package:mandaditos_express/Screens/login/login.dart';
import 'package:mandaditos_express/constants.dart';
import 'services/auth_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await PushNotificationService.initializeApp();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    //Context
    PushNotificationService.messagesStream.listen((message) {
      print('MyApp: $message');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mandaditos Express',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
      ),
      initialRoute: 'checking',
      routes: {
        'checking': (BuildContext context) => const CheckAuthScreen(),
        'login': (BuildContext context) => const LoginScreen(),
        'home': (BuildContext context) => const HomeScreen(),
        'message': (BuildContext context) => const MessageScreen()
      },
      scaffoldMessengerKey: NotificationService.messengerKey,
    );
  }
}
