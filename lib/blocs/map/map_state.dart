part of 'map_bloc.dart';

class MapState extends Equatable {

  final bool isMapInitialized;
  final bool isfollowingUser;
  final bool showMyRoute;

  //Polylines
  final Map<String, Polyline> polylines;
  final Map<String, Marker> markers;

  const MapState({
    this.isMapInitialized = false, 
    this.isfollowingUser = true,
    this.showMyRoute = false,
    Map<String, Polyline>? polylines,
    Map<String, Marker>? markers,

    
  })
  : polylines = polylines ?? const {},
    markers = markers ?? const {};

  MapState copyWith({
    bool? isMapInitialized,
    bool? isfollowingUser,
    bool? showMyRoute,
    Map<String, Polyline>? polylines,
    Map<String, Marker>? markers,
  }) =>MapState(
    isMapInitialized: isMapInitialized ?? this.isMapInitialized,
    isfollowingUser: isfollowingUser ?? this.isfollowingUser,
    showMyRoute: showMyRoute ?? this.showMyRoute,
    polylines: polylines ?? this.polylines,
    markers: markers ?? this.markers,
  );

  @override
  List<Object> get props => [isMapInitialized, isfollowingUser, polylines, showMyRoute, markers];
}

