import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mandaditos_express/blocs/blocs.dart';

class GpsAccessScreen extends StatelessWidget {
  const GpsAccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
           child: BlocBuilder<GpsBloc, GpsState>(
             builder: (context, state) {

               return !state.isGpsEnabled
               ? const _EnableGpsMessage()
               : const _AccessButtom(); 
             },
           )
           //_AccessButtom(),
        // child: _EnableGpsMessage(),
      ),
    );
  }
}

class _AccessButtom extends StatelessWidget {
  const _AccessButtom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Es necesario el acceso a GPS'),
        MaterialButton(
          child: const Text('Solicitar Acceso a GPS', style: TextStyle(color : Colors.white)),
          color: Colors.deepOrange,
          shape: const StadiumBorder(),
          elevation: 0,
          onPressed: (){
            
              final gpsBloc = BlocProvider.of<GpsBloc>(context);
              gpsBloc.askGpsAccess();

          }),
      ]);
  }
}

class _EnableGpsMessage extends StatelessWidget {
  const _EnableGpsMessage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('Por favor, Debe Habilitar el GPS ',style: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.w300
    ));
  }
}