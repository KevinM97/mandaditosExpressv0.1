import 'package:flutter/material.dart';
import 'package:mandaditos_express/Screens/screens.dart';

class MenuItem {
  String label;
  IconData icon;
  MenuItem(this.label, this.icon);
}

List<MenuItem> menuOptions = [
  MenuItem('Usuario', Icons.person),
  MenuItem('Mandado', Icons.shopping_cart_outlined),
  MenuItem('Chat', Icons.chat),
  MenuItem('Opinión', Icons.chat_outlined),
];

// ignore: non_constant_identifier_names
List<Widget> content_widget = [
  const AccountPage(),
  const MandadoScreen(),
  const ChatWidget(),
  const ListProduct(),
  const LoadingScreen()
];
