import 'package:dio/dio.dart';



class PlacesInterceptor extends Interceptor{

final accesToken = 'pk.eyJ1Ijoia2htaW5hIiwiYSI6ImNrenhoOXk3bjAxYTUydm13aGNycTRmaXYifQ.3bk90gb9rTDcJCBfWP18zw';

    @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {

     options.queryParameters.addAll({

      'access_token' : accesToken,
      'language': 'es',
      'limit': 7
    });

    super.onRequest(options, handler);
  }
}
