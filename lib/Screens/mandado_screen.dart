import 'package:flutter/material.dart';

class MandadoScreen extends StatefulWidget {
  const MandadoScreen({Key? key}) : super(key: key);

  @override
  _MandadoWidget createState() => _MandadoWidget();
}

class _MandadoWidget extends State<MandadoScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var boxDecoration = const BoxDecoration(
      shape: BoxShape.circle,
    );
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xFFEEEEEE),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: Text(
                  '¿Qué deseas realizar?',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: const AlignmentDirectional(0.65, 0),
                        child: InkWell(
                          onTap: () {},
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: 150,
                                height: 150,
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.network(
                                  'https://amigopaq.com/wp-content/uploads/2019/07/tienda.png',
                                  fit: BoxFit.none,
                                ),
                              ),
                              const Text(
                                'Comprar',
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Align(
                      alignment: const AlignmentDirectional(-0.85, 0),
                      child: InkWell(
                        onTap: () {},
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 150,
                              height: 150,
                              clipBehavior: Clip.antiAlias,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                'https://previews.123rf.com/images/belliely/belliely1708/belliely170800016/85015326-servicio-de-motocicleta-de-paseo-de-entrega-pedido-env%C3%ADo-mundial-transporte-r%C3%A1pido-y-gratuito-expr%C3%A9s.jpg',
                              ),
                            ),
                            const Text('Recoger',
                                style: TextStyle(fontSize: 20)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Align(
                      alignment: const AlignmentDirectional(0.65, 0),
                      child: InkWell(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => const LoadingScreen()));
                          Navigator.pushReplacementNamed(context, 'login');
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 150,
                              height: 150,
                              clipBehavior: Clip.antiAlias,
                              decoration: boxDecoration,
                              child: Image.network(
                                'https://thumbs.dreamstime.com/b/caja-de-regalo-dibujos-animados-navidad-o-cumplea%C3%B1os-envuelto-negro-con-estrellas-y-lazo-rojo-ilustraci%C3%B3n-vectorial-aislada-204712652.jpg',
                              ),
                            ),
                            const Text('Enviar',
                                style: TextStyle(fontSize: 20)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
