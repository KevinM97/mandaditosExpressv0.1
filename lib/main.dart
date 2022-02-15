import 'package:flutter/material.dart';

import 'package:mandaditos_express/Screens/login/login.dart';
import 'package:mandaditos_express/constants.dart';

void main() {
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
