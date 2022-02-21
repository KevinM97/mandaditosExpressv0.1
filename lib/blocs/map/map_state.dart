part of 'map_bloc.dart';

class MapState extends Equatable {

  final bool isMapInitialized;
  final bool isfollowingUser;
  final bool showMyRoute;

  //Polylines
  final Map<String, Polyline> polylines;

  /*
   mi_ruta: {
     id: polylineID Google,
     points: [lat, lng],[...]
     width: 3
     color:
   }
  
   */

  const MapState({
    this.isMapInitialized = false, 
    this.isfollowingUser = true,
    this.showMyRoute = true,
    Map<String, Polyline>? polylines
  }): polylines = polylines ?? const {};

  MapState copyWith({
    bool? isMapInitialized,
    bool? isfollowingUser,
    bool? showMyRoute,
    Map<String, Polyline>? polylines,
  }) =>MapState(
    isMapInitialized: isMapInitialized ?? this.isMapInitialized,
    isfollowingUser: isfollowingUser ?? this.isfollowingUser,
    polylines: polylines ?? this.polylines,
    showMyRoute: showMyRoute ?? this.showMyRoute,
  );

  @override
  List<Object> get props => [isMapInitialized, isfollowingUser, polylines, showMyRoute];
}


