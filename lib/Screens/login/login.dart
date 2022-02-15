import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mandaditos_express/components/rounded_button.dart';
import 'package:mandaditos_express/components/rounded_input.dart';
import 'package:mandaditos_express/components/rountded_password_input.dart';
import 'package:mandaditos_express/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  // Form Key
  final _formKey = GlobalKey<FormState>();

  //editing controller
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  final TextEditingController emailRegisterController =
      new TextEditingController();
  final TextEditingController userController = new TextEditingController();
  final TextEditingController passwordRegisterController =
      new TextEditingController();
  final TextEditingController confirmPasswordController =
      new TextEditingController();

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
    //EmailField
    final emailField = TextFormField(
        autofocus: false,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        /*validator: (){},*/
        onSaved: (value) {
          emailController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.mail,
              color: kSecundaryColor,
            ),
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "Email",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))));

    //Password field
    final passwordField = TextFormField(
      autofocus: false,
      obscureText: true,
      controller: passwordController,
      /*validator: (){},*/
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.vpn_key, color: kSecundaryColor),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Contraseña",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
    //Login Button
    final loginButton = Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(30),
        color: Colors.black,
        child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {},
          child: Text("CONTINUAR",
              style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
        ));

    //Register email
    final emailRegisterField = TextFormField(
        autofocus: false,
        controller: emailRegisterController,
        keyboardType: TextInputType.emailAddress,
        /*validator: (){},*/
        onSaved: (value) {
          emailRegisterController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.mail,
              color: kSecundaryColor,
            ),
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "Email",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))));

    //Register User
    final userField = TextFormField(
        autofocus: false,
        controller: userController,
        keyboardType: TextInputType.name,
        /*validator: (){},*/
        onSaved: (value) {
          userController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.person,
              color: kSecundaryColor,
            ),
            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "Nombre",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))));

    //Password Register
    final passwordRegisterField = TextFormField(
      autofocus: false,
      obscureText: true,
      controller: passwordRegisterController,
      /*validator: (){},*/
      onSaved: (value) {
        passwordRegisterController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.vpn_key, color: kSecundaryColor),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Contraseña",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );

    //Password Confirm Register
    final configPasswordRegisterField = TextFormField(
      autofocus: false,
      obscureText: true,
      controller: confirmPasswordController,
      /*validator: (){},*/
      onSaved: (value) {
        confirmPasswordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.vpn_key, color: kSecundaryColor),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Confirmar contraseña",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );

    Size size = MediaQuery.of(context).size;

    double viewInset = MediaQuery.of(context)
        .viewInsets
        .bottom; //Lo usaremos para determinar Keyboard esta abierto o no
    double defaultLoginSize = size.height - (size.height * 0.2);
    double defaultRegisterSize = size.height - (size.height * 0.1);
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
                      const SizedBox(height: 20),
                      //const RoundedInput(icono: Icons.email, hint: 'Usuario'),
                      emailField,
                      const SizedBox(height: 20),
                      //const RoundedPasswordInput(hint: 'Contraseña'),
                      passwordField,
                      const SizedBox(height: 10),
                      loginButton,
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
                        //const RoundedInput(icono: Icons.email, hint: 'Usuario'),
                        // const RoundedInput(
                        //icono: Icons.face_rounded, hint: 'Name'),
                        //const RoundedPasswordInput(hint: 'Contraseña'),
                        userField,
                        const SizedBox(height: 20),
                        emailRegisterField,
                        const SizedBox(height: 20),
                        passwordRegisterField,
                        const SizedBox(height: 20),
                        configPasswordRegisterField,
                        //const RoundedPasswordInput(
                        //hint: 'Confirmar Contraseña'),
                        const SizedBox(height: 10),
                        const RoundedButton(title: 'CONTINUAR')
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
