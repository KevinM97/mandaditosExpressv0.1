import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mandaditos_express/blocs/blocs.dart';
import 'package:mandaditos_express/views/views.dart';
import 'package:mandaditos_express/widgets/btn_toogle_user_route.dart';
import 'package:mandaditos_express/widgets/widgets.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late LocationBloc locationBloc;

  @override
  void initState() {
    super.initState();

    locationBloc = BlocProvider.of<LocationBloc>(context);
    // locationBloc.getCurrentPosition();
    locationBloc.startFollowingUser();
  }

  @override
  void dispose() {
    locationBloc.stopFollowingUser();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, locationstate) {
          if (locationstate.lastKnownLocation == null) {
          return const Center(child: Text('Espere por favor.'));
          }
          return BlocBuilder<MapBloc, MapState>(
            builder: (context, mapState) {

              Map<String, Polyline> polylines = Map.from( mapState.polylines );
              if( !mapState.showMyRoute ){
                polylines.removeWhere((key, value) => key == 'myRoute');
              }


              return SingleChildScrollView(
                child: Stack(
                  children: [
                    MapView(
                      initialLocation: locationstate.lastKnownLocation!,
                      polylines: polylines.values.toSet(),
                    ),
                    const SearchBar(),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          BtnToggleUserRoute(),
          BtnFollowUser(),
          BtnCurrentLocation(),
        ],
      ),
    );
  }
}
