import 'package:flutter/material.dart';
import 'package:mandaditos_express/services/services.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);

    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
            onPressed: () async {
              await authService.logout();
              Navigator.pushReplacementNamed(context, 'login');
            },
            icon: Icon(Icons.login_outlined)),
      ]),
      body: Center(
          child: Text(
        'Bienvenido a la aplicacion',
        style: TextStyle(fontSize: 40),
      )),
    );
  }
}
