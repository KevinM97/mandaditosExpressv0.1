import 'package:flutter/material.dart';
import 'package:mandaditos_express/constants.dart';

class ChatWidget extends StatefulWidget {
  const ChatWidget({Key? key}) : super(key: key);

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Text(
          'Te direccionaremos al Whatsapp de tu chofer asignado.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 30),
        ),
        MaterialButton(
            color: Colors.green,
            disabledColor: Colors.grey,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            minWidth: MediaQuery.of(context).size.width,
            onPressed: () {
              'https://wa.me/123456798';
            },
            child: const Text(
              'Ir al chat de WhatsApp',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ))
      ],
    );
  }
}
