import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:mandaditos_express/Screens/login/login.dart';
import 'package:mandaditos_express/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mandaditos Express',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
      ),
      home: const LoginScreen(),
      /*routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) = new MyHome(),
      }, */
    );
  }
}
