import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mandaditos_express/constants.dart';
import 'package:mandaditos_express/services/feedback_service.dart';

class OpinionScreen extends StatefulWidget {
  const OpinionScreen({Key? key}) : super(key: key);

  @override
  State<OpinionScreen> createState() => _OpinionScreenState();
}

class _OpinionScreenState extends State<OpinionScreen> {
  FeedBackService feedbackservice = FeedBackService();
  late String feedback = "";
  @override
  void initState() {
    //feedback;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size * 0.9;
    final textcontro = TextEditingController();
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Center(
        child: SizedBox(
            width: size.width,
            child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Dejanos tu FeedBack',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      )),
                  const SizedBox(height: 20.0),
                  const Text('Por favor, si tienes una queja, cuentanos.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                      )),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    controller: textcontro,
                    validator: (value) {
                      return (value != null && value.isNotEmpty)
                          ? null
                          : 'No hay texto';
                    },
                    decoration: InputDecoration(
                        hintText: 'Escribe tu FeedBack aquí...',
                        enabledBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.black,
                                width: 0,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(12)),
                        filled: true),
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 15),
                    textAlign: TextAlign.start,
                    maxLines: 10,
                    onChanged: (value) => feedback = value,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MaterialButton(
                          color: kBackgroundColor,
                          disabledColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          minWidth: 130,
                          height: 40,
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, 'home');
                          },
                          child: const Text(
                            'CANCELAR',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                      MaterialButton(
                          color: kBackgroundColor,
                          disabledColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          minWidth: 130,
                          height: 40,
                          onPressed: () async {
                            await feedbackservice.create(
                              feedback,
                            );
                            textcontro.clear();
                            FocusScope.of(context).requestFocus(FocusNode());
                            showDialog(
                              context: context,
                              builder: (context) => const AlertDialog(
                                title: Text(
                                  'Su FeedBack ha sido enviando',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            );
                          },
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
                ])),
      ),
    );
  }
}
