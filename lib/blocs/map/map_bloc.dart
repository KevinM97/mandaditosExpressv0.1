import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mandaditos_express/blocs/blocs.dart';
import 'package:mandaditos_express/models/models.dart';
import 'package:mandaditos_express/themes/themes.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {

  final LocationBloc locationBloc;

  GoogleMapController? _mapController;
  LatLng? mapCenter;


  StreamSubscription<LocationState>? locationStateSubscription;


  MapBloc({
    required this.locationBloc
    }) : super( const MapState() ) {

    on<OnMapInitializedEvent>( _onInitMap );
    on<OnStartFollowinUserEvent>((_onStartFollowinUser));
    on<OnStopFollowinUserEvent>((event, emit) => emit(state.copyWith(isfollowingUser: false)));
    on<UpdateUserPolylineEvent>(_onPolylineNewPoint);
    on<OnToggleUserRoute>((event, emit) => emit( state.copyWith(showMyRoute: !state.showMyRoute )));
    on<DisplayPolylinesEvent>((event, emit) => emit(state.copyWith(polylines: event.polylines, markers: event.markers )));

    locationStateSubscription = locationBloc.stream.listen(( locationState ) {

      if( locationState.lastKnownLocation != null ){
        add(UpdateUserPolylineEvent(locationState.myLocationHistory));
      }

      if( !state.isfollowingUser ) return;
      if( locationState.lastKnownLocation == null ) return;

      moveCamera(locationState.lastKnownLocation!);

     });

  }

  void _onInitMap( OnMapInitializedEvent event, Emitter<MapState> emit ){

    _mapController = event.controller;
    _mapController!.setMapStyle(jsonEncode(uberMapTheme));

    emit(state.copyWith( isMapInitialized: true));

  }

  void _onStartFollowinUser(OnStartFollowinUserEvent even, Emitter<MapState> emit){
      
      emit(state.copyWith(isfollowingUser: true));

      if(locationBloc.state.lastKnownLocation == null ) return;
      moveCamera(locationBloc.state.lastKnownLocation!);
  }

  
  void _onPolylineNewPoint(UpdateUserPolylineEvent event, Emitter<MapState> emit){

      final myRoute = Polyline(
        polylineId: const PolylineId('myRoute'),
        color: Colors.black,
        width: 5,
        startCap: Cap.roundCap,
        endCap: Cap.roundCap,
        points: event.userLocation
        );

        final currentPolylines = Map<String, Polyline>.from(state.polylines);
        currentPolylines['myRoute'] = myRoute;

        emit(state.copyWith( polylines: currentPolylines ));
  }

  Future drawRoutePolyline( RouteDestination destination ) async {
    
    final myRoute = Polyline(
      polylineId: const PolylineId('route'),
      color: Colors.deepOrange,
      width: 5,
      points: destination.points,
      startCap: Cap.roundCap,
      endCap: Cap.roundCap,
      );

      final startMarker = Marker(
        markerId: const MarkerId('start'),
        position: destination.points.first,
        infoWindow: const InfoWindow(
          title: 'Inicio',
          snippet: 'Inicio del mandado'
        ),
        );
      final endMarker = Marker(
        markerId: const MarkerId('end'),
        position: destination.points.last,
         infoWindow: const InfoWindow(
          title: 'Mandado',
          snippet: 'Lugar de llegada de mandadito'
        ),
        );

      final curretnPolylines = Map<String, Polyline>.from( state.polylines );
      curretnPolylines['route'] = myRoute;

       final currentMarkers = Map<String, Marker>.from(state.markers);
      currentMarkers['start'] = startMarker;
      currentMarkers['end'] = endMarker;

      add( DisplayPolylinesEvent( curretnPolylines, currentMarkers ));
  }

  void moveCamera(LatLng newLocation){
    final cameraUpdate = CameraUpdate.newLatLng(newLocation);
    _mapController?.animateCamera(cameraUpdate);
  }


  @override
  Future<void> close() {
    locationStateSubscription?.cancel();
    return super.close();
  }
}
