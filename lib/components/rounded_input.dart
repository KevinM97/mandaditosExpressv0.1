import 'package:flutter/material.dart';
import 'package:mandaditos_express/components/input_container.dart';
import 'package:mandaditos_express/constants.dart';

class RoundedInput extends StatelessWidget {
  const RoundedInput({
    Key? key,
    required this.icono,
    required this.hint,
  }) : super(key: key);

  final IconData icono;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return InputContainer(
        child: TextField(
      cursorColor: kSecundaryColor,
      decoration: InputDecoration(
          icon: Icon(icono, color: kSecundaryColor),
          hintText: hint,
          border: InputBorder.none),
    ));
  }
}
