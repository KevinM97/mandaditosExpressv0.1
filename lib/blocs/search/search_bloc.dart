import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_polyline_algorithm/google_polyline_algorithm.dart';

import 'package:mandaditos_express/models/models.dart';
import 'package:mandaditos_express/services/services.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {

  TrafficService trafficService;

  SearchBloc({
    required this.trafficService
  }) : super(const SearchState()) {
    
    on<OnActivateManualMarkerEvent>((event, emit) => emit( state.copyWith( displayManualMarker: true)));
    on<OnDesactivateManualMarkerEvent>((event, emit) => emit(state.copyWith(displayManualMarker: false)));

    on<OnNewPlacesFoundEvent>((event, emit) => emit(state.copyWith(places: event.places )));
  }

  Future<RouteDestination> getCoorsStartToEnd( LatLng start, LatLng end ) async {
    final traficResponse = await trafficService.getCoorsStarToEnd(start, end);
    
    final geometry = traficResponse.routes[0].geometry;
    final distance = traficResponse.routes[0].distance;
    final duration = traficResponse.routes[0].duration;

    //Decodificar
  final points = decodePolyline(geometry, accuracyExponent: 6);

  final latlgnList = points.map((coor) => LatLng(coor[0].toDouble(), coor[1].toDouble()) ).toList();
    return RouteDestination(
      points: latlgnList, 
      duration: duration, 
      distance: distance);
  }

  Future getPlacesByQuery(LatLng proximity, String query) async {

    final newPlaces = await trafficService.getResultsByQuery(proximity, query);

    add( OnNewPlacesFoundEvent(newPlaces));

  }

}
