// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:mandaditos_express/bloc/login_bloc.dart';
// export 'package:mandaditos_express/bloc/login_bloc.dart';

// class Provider extends InheritedWidget {
//   static Provider _instancia;

//   factory Provider({required Key key, Widget? child}) {
//     if (_instancia == null) {
//       _instancia = new Provider._internal(key: key, child: child);
//     }

//     return _instancia;
//   }

//   Provider._internal({required Key key, Widget? child}) : super(key: key, child: child);

//   final loginBloc = LoginBloc();

//   // Provider({ Key key, Widget child })
//   //   : super(key: key, child: child );

//   @override
//   bool updateShouldNotify(InheritedWidget oldWidget) => true;

//   static LoginBloc of(BuildContext context) {
//     return (context.dependOnInheritedWidgetOfExactType<Provider>() as Provider)
//         .loginBloc;
//   }

//   @override
//   void debugFillProperties(DiagnosticPropertiesBuilder properties) {
//     super.debugFillProperties(properties);
//     properties.add(DiagnosticsProperty<Provider>('_instancia', _instancia));
//     properties.add(DiagnosticsProperty<Provider>('_instancia', _instancia));
//   }
// }
