import 'package:flutter/material.dart';
import 'package:mandaditos_express/constants.dart';

class OpinionScreen extends StatefulWidget {
  const OpinionScreen({Key? key}) : super(key: key);

  @override
  State<OpinionScreen> createState() => _OpinionScreenState();
}

class _OpinionScreenState extends State<OpinionScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 1,
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Align(
            child: Text(
              'Cuentanos tu experiencia',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
            child: Text(
              'Por favor, déjanos tu opinión, ayúdanos a mejorar.\n¿Cómo estuvo la entrega?\n¿Qué tal te pareció el servicio?',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(30, 30, 30, 30),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Escribe tu opinión aquí...',
                enabledBorder: UnderlineInputBorder(
                  borderSide: const BorderSide(
                      color: Colors.black, width: 0, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: const BorderSide(
                      color: Colors.black, width: 0, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
              ),
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.start,
              maxLines: 10,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  MaterialButton(
                      color: kBackgroundColor,
                      disabledColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      minWidth: 130,
                      height: 40,
                      onPressed: () {},
                      child: const Text(
                        'CANCELAR',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
                  const SizedBox(width: 20.0),
                  MaterialButton(
                      color: kBackgroundColor,
                      disabledColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      minWidth: 130,
                      height: 40,
                      onPressed: () {},
                      child: const Text(
                        'ENVIAR',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
