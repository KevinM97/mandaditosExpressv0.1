import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mandaditos_express/blocs/blocs.dart';
import 'package:mandaditos_express/helpers/helper.dart';
import 'package:mandaditos_express/services/auth_services.dart';
import 'package:mandaditos_express/services/longlat_services.dart';
import 'package:provider/provider.dart';

class ManualMarket extends StatelessWidget {
  const ManualMarket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return state.displayManualMarker
            ? const _ManualMarketBody() // si es true
            : const SizedBox(); // false

        // if(state.displayManualMarker){
        //   return const _ManualMarketBody();
        // }else{
        //   return const SizedBox();
        // }
      },
    );
  }
}

class _ManualMarketBody extends StatelessWidget {
  const _ManualMarketBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    LongLangService longlangService = LongLangService();
    final size = MediaQuery.of(context).size;
    final searchBloc = BlocProvider.of<SearchBloc>(context);
    final locationBloc = BlocProvider.of<LocationBloc>(context);
    final mapBloc = BlocProvider.of<MapBloc>(context);

    return SizedBox(
      width: size.width,
      height: size.height,
      child: Stack(
        children: [
          const Positioned(top: 70, left: 20, child: _BtnBack()),

          Center(
            child: Transform.translate(
              offset: const Offset(0, -18),
              child: BounceInDown(
                  from: 90,
                  child: const Icon(Icons.location_on_rounded, size: 35)),
            ),
          ),

          //Boton confirmar
          Positioned(
              bottom: 70,
              left: 40,
              child: FadeInUp(
                duration: const Duration(milliseconds: 300),
                child: MaterialButton(
                  minWidth: size.width - 120,
                  child: const Text('Confirmar destino de mandado',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w300)),
                  color: Colors.black,
                  elevation: 0,
                  height: 50,
                  shape: const StadiumBorder(),
                  onPressed: () async {
                    final start = locationBloc.state.lastKnownLocation;
                    if (start == null) return;

                    final end = mapBloc.mapCenter;
                    if (end == null) return;

                    showLoadingMessage(context);

                    final destination =
                        await searchBloc.getCoorsStartToEnd(start, end);
                    await mapBloc.drawRoutePolyline(destination);

                    searchBloc.add(OnDesactivateManualMarkerEvent());
                    Navigator.pop(context);
                    await longlangService.create(
                        authService.readToken().toString(),
                        start.longitude.toString(),
                        start.latitude.toString(),
                        end.longitude.toString(),
                        end.latitude.toString());
                  },
                ),
              )),
        ],
      ),
    );
  }
}

class _BtnBack extends StatelessWidget {
  const _BtnBack({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      duration: const Duration(milliseconds: 200),
      child: CircleAvatar(
        maxRadius: 30,
        backgroundColor: Colors.white,
        child: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            BlocProvider.of<SearchBloc>(context)
                .add(OnDesactivateManualMarkerEvent());
          },
        ),
      ),
    );
  }
}
