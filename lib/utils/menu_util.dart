import 'package:flutter/material.dart';
import 'package:mandaditos_express/Screens/account_screen.dart';


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


List<Widget> contentwidget = [
  const AccountScreen(),
  // const MandadoWidget(),
  // const ChatWidget(),
  // const ListProduct()
];
