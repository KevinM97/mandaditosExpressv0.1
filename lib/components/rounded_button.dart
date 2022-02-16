import 'package:flutter/material.dart';
import 'package:mandaditos_express/constants.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: size.width * 0.6,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: kSecundaryColor),
        padding: const EdgeInsets.symmetric(vertical: 20),
        alignment: Alignment.center,
        child: Text(
          title,
          style: const TextStyle(color: kPrimaryColor, fontSize: 18),
        ),
      ),
    );
  }
}
