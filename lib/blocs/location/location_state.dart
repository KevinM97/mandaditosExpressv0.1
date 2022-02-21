part of 'location_bloc.dart';

class LocationState extends Equatable {

  final bool followingUser;
  final LatLng? lastKnownLocation;
  final List<LatLng> myLocationHistory;
      //  ultimo geolocation
      //  historia
  const LocationState({
    this.followingUser = false,
    this.lastKnownLocation,
    myLocationHistory
  }): myLocationHistory = myLocationHistory ?? const [];
  
    LocationState copyWith({
      bool? followingUser,
      LatLng? lastKnownLotacion,
      List<LatLng>? myLocationHistory,
    }) => LocationState(
      followingUser: followingUser ?? this.followingUser,
      lastKnownLocation:lastKnownLotacion ?? lastKnownLocation,
      myLocationHistory: myLocationHistory ?? this.myLocationHistory,
    );


  @override
  List<Object?> get props => [ followingUser, lastKnownLocation, myLocationHistory ];
}

