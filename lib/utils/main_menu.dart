import 'package:flutter/material.dart';
import 'package:mandaditos_express/Screens/chat_screen.dart';
import 'package:mandaditos_express/Screens/list_product_screen.dart';
// import 'package:mandaditos_express/Screens/loading_screen.dart';
// import 'package:mandaditos_express/Screens/mandado_screen.dart';
import 'package:mandaditos_express/Screens/usuario_screen.dart';

class MenuItem {
  String label;
  IconData icon;
  MenuItem(this.label, this.icon);
}

List<MenuItem> menuOptions = [
  MenuItem('Usuario', Icons.person),
  MenuItem('Mandado', Icons.shopping_cart_outlined),
  MenuItem('Chat', Icons.chat),
  MenuItem('Opinion', Icons.chat_outlined),
];

// ignore: non_constant_identifier_names
List<Widget> content_widget = [
  const AccountPage(),
  // LoadingScreen(),
  const ChatWidget(),
  const ChatWidget(),
  const ListProduct()
];
