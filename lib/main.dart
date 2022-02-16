
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandaditos_express/blocs/gps/gps_bloc.dart';
import 'package:mandaditos_express/services/auth_services.dart';
import 'package:provider/provider.dart';
import 'package:mandaditos_express/Screens/screens.dart';
import 'package:mandaditos_express/constants.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers:[
        BlocProvider(create: (context) => GpsBloc())
        ],
        child: const MyApp(),
      )
    );
}


class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  
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
      initialRoute: 'loadingScreen',
      routes:{
        'login' : ( BuildContext context ) => const LoginScreen(),
        'home'  : ( BuildContext context ) => const HomeScreen(),
        'gps'  : ( BuildContext context ) => const GpsAccessScreen(),
        'loadingScreen'  : ( BuildContext context ) => const LoadingScreen(),
      }, 
    );
  }
}
