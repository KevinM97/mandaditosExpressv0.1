
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandaditos_express/blocs/gps/gps_bloc.dart';
import 'package:mandaditos_express/services/auth_services.dart';
import 'package:mandaditos_express/services/push_notifications_service.dart';
import 'package:provider/provider.dart';
import 'package:mandaditos_express/Screens/screens.dart';
import 'package:mandaditos_express/constants.dart';

import 'Screens/login/check_outh_screen.dart';
import 'services/notifications_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationService.initializeApp();
 /*  runApp(
     MultiBlocProvider(
       providers:[
         BlocProvider(create: (context) => GpsBloc()),
        
         ],
         child: const MyApp(),
       )
     ); */
   runApp(const AppState());
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
      // ignore: avoid_print
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
      },
      scaffoldMessengerKey: NotificationService.messengerKey,
    );
  }
}