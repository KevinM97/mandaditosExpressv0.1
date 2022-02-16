import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mandaditos_express/constants.dart';
import 'package:mandaditos_express/providers/login_form_provider.dart';
import 'package:mandaditos_express/services/auth_services.dart';
import 'package:mandaditos_express/services/notifications_service.dart';
import 'package:mandaditos_express/ui/input_decoration.dart';
import 'package:provider/provider.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Form(
      key: loginForm.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          //TextForm Email Login
          TextFormField(
            autofocus: false,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            decoration: InputDecorations.authInputDecoration(
                hintText: 'ejemplo@email.com',
                prefixIcon: Icons.email,
                labelText: 'Correo elecronico'),
            onChanged: (value) => loginForm.email = value,
            validator: (value) {
              String pattern =
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              RegExp regExp = RegExp(pattern);
              return regExp.hasMatch(value ?? '')
                  ? null
                  : 'El correo es invalido';
            },
          ),
          const SizedBox(height: 20.0),
          TextFormField(
            autofocus: false,
            obscureText: true,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            decoration: InputDecorations.authInputDecoration(
                hintText: '******',
                prefixIcon: Icons.vpn_key,
                labelText: 'Contraseña'),
            onChanged: (value) => loginForm.password = value,
            validator: (value) {
              return (value != null && value.length >= 6)
                  ? null
                  : 'La contraseña debe tener 6 caracteres';
            },
          ),
          const SizedBox(height: 20.0),
          MaterialButton(
              color: kSecundaryColor,
              disabledColor: Colors.grey,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              minWidth: MediaQuery.of(context).size.width,
              onPressed: loginForm.isLoading
                  ? null
                  : () async {
                      FocusScope.of(context).unfocus();
                      final authService =
                          Provider.of<AuthService>(context, listen: false);

                      if (!loginForm.isValidForm()) return;

                      loginForm.isLoading = true;

                      // ignore: todo
                      // TODO: validar si el login es correcto
                      final String? errorMessage = await authService.createUser(
                          loginForm.email, loginForm.password);
                      // ignore: avoid_print
                      if (errorMessage == null) {
                        Navigator.pushReplacementNamed(context, 'home');
                      } else {
                        // ignore: todo
                        // TODO: mostrar error en pantalla
                        // ignore: avoid_print

                        NotificationService.showSnackbar(
                            'El usuario ya esta registrado');
                        loginForm.isLoading = false;
                      }
                    },
              child: Text(
                loginForm.isLoading ? 'Ingresando' : "CONTINUAR",
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }
}
