import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {

  StreamSubscription<Position>? positionStream;

  LocationBloc() : super( const LocationState()) {

    on<OnStartFollowingUser>((event, emit) => emit( state.copyWith( followingUser: true ) ));
    on<OnStopFollowingUser>((event, emit) => emit( state.copyWith( followingUser: false ) ));

    on<OnNewUserLocationEvent>((event, emit) {
      emit( 
        state.copyWith(
          lastKnownLotacion: event.newLocation,
          myLocationHistory: [...state.myLocationHistory, event.newLocation],//mostrar todas la localizacion y las nuevas
        ));
     });
  }

  Future getCurrentPosition() async{
    final position = await Geolocator.getCurrentPosition();
    // ignore: avoid_print
    print('Position: $position');
  }

  void startFollowingUser(){
    add(OnStartFollowingUser());
    // ignore: avoid_print
    print('startFollowingUser');
      positionStream = Geolocator.getPositionStream().listen((event) {
        final position = event;
        add( OnNewUserLocationEvent( LatLng(position.latitude, position.longitude)));

      });
  }


  void stopFollowingUser(){
    positionStream?.cancel();
    add( OnStopFollowingUser());
    // ignore: avoid_print
    print('stopFollingUser');
  }

  @override
  Future<void> close() {
    positionStream?.cancel();
    return super.close();
  }

}
