import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mandaditos_express/constants.dart';
import 'package:mandaditos_express/providers/login_form_provider.dart';

import 'package:mandaditos_express/services/services.dart';
import 'package:mandaditos_express/ui/input_decoration.dart';
import 'package:mandaditos_express/Screens/login/register.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  bool isLogin = true;
  late Animation<double> containerSize;
  late AnimationController animationController;
  Duration animationDuration = const Duration(milliseconds: 270);

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    animationController =
        AnimationController(vsync: this, duration: animationDuration);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Login Button

    //Register Button
    Size size = MediaQuery.of(context).size;

    double viewInset = MediaQuery.of(context)
        .viewInsets
        .bottom; //Lo usaremos para determinar Keyboard esta abierto o no
    double defaultLoginSize = size.height - (size.height * 0.2);
    double defaultRegisterSize = size.height - (size.height * 0.2);
    containerSize = Tween<double>(
            begin: size.height * 0.12, end: defaultRegisterSize)
        .animate(
            CurvedAnimation(parent: animationController, curve: Curves.linear));
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          //Login FORM
          AnimatedOpacity(
            opacity: isLogin ? 1.0 : 0.0,
            duration: animationDuration * 4,
            child: Align(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(36.0),
                child: SizedBox(
                  width: size.width,
                  height: defaultLoginSize,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/Login.png',
                        height: 150,
                        width: 300.0,
                      ),
                      const SizedBox(height: 10.0),
                      const Text(
                        'Bienvenido',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      const SizedBox(height: 20.0),
                      ChangeNotifierProvider(
                        create: (_) => LoginFormProvider(),
                        child: const _LoginForm(),
                      ),
                      //const RoundedButton(title: 'CONTINUAR')
                    ],
                  ),
                ),
              ),
            ),
          ),
          //Registro Container
          AnimatedBuilder(
            animation: animationController,
            builder: (context, child) {
              if (viewInset == 0 && isLogin) {
                return buildRegisterContainer();
              } else if (!isLogin) {
                return buildRegisterContainer();
              }

              //Retorna un container vacio
              return Container();
            },
          ),
          //Registro Formulario
          AnimatedOpacity(
            opacity: isLogin ? 0.0 : 1.0,
            duration: animationDuration * 5,
            child: Visibility(
              visible: !isLogin,
              child: Align(
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(36.0),
                  child: SizedBox(
                    width: size.width,
                    height: defaultLoginSize,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //Button para cerrar pestaña
                        AnimatedOpacity(
                            opacity: isLogin ? 0.0 : 1.0,
                            duration: animationDuration,
                            child: SizedBox(
                              width: size.width,
                              height: size.height * 0.1,
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  alignment: Alignment.bottomLeft,
                                  child: IconButton(
                                    iconSize: 30,
                                    onPressed: isLogin
                                        ? null
                                        : () {
                                            setState(() {
                                              FocusScope.of(context).unfocus();
                                              // retorna un valor nulo y desavilita el boton
                                              animationController.reverse();
                                              isLogin = !isLogin;
                                            });
                                          },
                                    icon: const Icon(Icons.arrow_back_ios),
                                    color: kSecundaryColor,
                                  ),
                                ),
                              ),
                            )),

                        Image.asset(
                          'assets/images/Login2.png',
                          height: 150,
                          width: 300.0,
                        ),
                        const SizedBox(height: 10.0),
                        const Text(
                          'Registrarse',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        const SizedBox(height: 20),
                        ChangeNotifierProvider(
                          create: (_) => LoginFormProvider(),
                          child: const RegisterForm(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRegisterContainer() => Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: containerSize.value,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
              color: kPrimaryColor),
          alignment: Alignment.center,
          child: GestureDetector(
              onTap: !isLogin
                  ? null
                  : () {
                      animationController.forward();
                      setState(() {
                        isLogin = !isLogin;
                      });
                    },
              child: isLogin
                  ? const Text(
                      'Registrarse',
                      style: TextStyle(
                          color: kSecundaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )
                  : null),
        ),
      );
}

//Formulario
class _LoginForm extends StatelessWidget {
  const _LoginForm({
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
                labelText: 'Correo electrónico'),
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
              return (value != null && value.length >= 5)
                  ? null
                  : 'La contraseña debe tener 5 caracteres';
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
                      final String? errorMessage = await authService.login(
                          loginForm.email, loginForm.password);
                      // ignore: avoid_print
                      if (errorMessage == null) {
                        Navigator.pushReplacementNamed(context, 'home');
                      } else {
                        // ignore: todo
                        // TODO: mostrar error en pantalla
                        // ignore: avoid_print
                        //print(errorMessage);
                        NotificationService.showSnackbar(
                            'Ingrese los datos correctos');
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
