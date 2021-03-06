import 'package:dio/dio.dart';

class TrafficInterceptor extends Interceptor{
final accesToken = 'pk.eyJ1Ijoia2htaW5hIiwiYSI6ImNrenhoOXk3bjAxYTUydm13aGNycTRmaXYifQ.3bk90gb9rTDcJCBfWP18zw';
  
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler){


    options.queryParameters.addAll({
      'alternatives': true,
      'geometries': 'polyline6',
      'overview' : 'simplified',
      'steps' : false,
      'access_token' : accesToken
    });
    
    super.onRequest(options, handler);
  }
}