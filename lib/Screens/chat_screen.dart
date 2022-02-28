import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ChatWidget extends StatefulWidget {
  const ChatWidget({Key? key}) : super(key: key);

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  final _url = "https://wa.me/";
  void _launchURL() async {
    if (!await launch(_url)) throw 'No se pudo ingresar $_url';
  }

  final _phone = "tel:0987654321";
  void _launchPhone() async {
    if (!await launch(_phone)) throw 'No se pudo ingresar $_phone';
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size * 0.9;
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
            minWidth: MediaQuery.of(context).size.width * 0.1,
            onPressed: () {
              _launchURL();
            },
            child: const Text(
              'Ir al chat de WhatsApp',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            )),
        MaterialButton(
            color: Colors.green,
            disabledColor: Colors.grey,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            minWidth: MediaQuery.of(context).size.width * 0.1,
            onPressed: () {
              _launchPhone();
            },
            child: const Text(
              'Llamar al motorizado',
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
