import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mandaditos_express/services/auth_services.dart';
import 'package:provider/provider.dart';

import 'package:mandaditos_express/Screens/home_scream.dart';
import 'package:mandaditos_express/Screens/login/login.dart';
import 'package:mandaditos_express/constants.dart';

void main() => runApp(AppState());


class AppState extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
          ChangeNotifierProvider(create: ( _ ) => AuthService()),
      ],
      child: const MyApp(),
    );
  }
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
      initialRoute: 'login',
      routes:{
        'login' : ( BuildContext context ) => const LoginScreen(),
        'home'  : ( BuildContext context ) => const HomeScreen(),
      }, 
    );
  }
}
