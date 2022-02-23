
import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

import 'package:mandaditos_express/services/services.dart';

class TrafficService{
  final Dio _dioTraffic;

  final String _baseTrafficUrl = 'https://api.mapbox.com/directions/v5/mapbox';

  TrafficService()
  : _dioTraffic = Dio()..interceptors.add( TrafficInterceptor() );

  Future getCoorsStarToEnd ( LatLng start, LatLng end ) async{

    final coorsString = '${ start.longitude }, ${ start.latitude };${ end.longitude },${ end.latitude }';
    final url = '$_baseTrafficUrl/driving/$coorsString';

    final resp = await _dioTraffic.get(url);

    return resp.data;
  }
}