import 'package:flutter/material.dart';

import '../constants.dart';

// ignore: camel_case_types
class InputDecorations {
  static InputDecoration authInputDecoration(
      {required String hintText,
      required String labelText,
      required IconData? prefixIcon}) {
    return InputDecoration(
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                color: kSecundaryColor,
              )
            : null,
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: hintText,
        labelText: labelText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)));
  }
}
