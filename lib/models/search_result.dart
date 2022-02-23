import 'package:google_maps_flutter/google_maps_flutter.dart';

class SearchResult {

  final bool cancel;
  final bool? manual;
  final LatLng? position; 
  final String? name;
  final String? description;


  SearchResult({
    this.manual = false, 
    required this.cancel, 
    this.position,
    this.name, 
    this.description, 
  });


@override
  String toString() {
    return '{ cancel: $cancel, manual: $manual }';
  }

}