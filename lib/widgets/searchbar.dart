import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandaditos_express/blocs/blocs.dart';
import 'package:mandaditos_express/delegates/delegates.dart';
import 'package:mandaditos_express/models/search_result.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return state.displayManualMarker
        ? const SizedBox()
        : const _SearchBarBody();
      },
    );
  }
}


class _SearchBarBody extends StatelessWidget {
  const _SearchBarBody({Key? key}) : super(key: key);

  void onSearchResults( BuildContext context, SearchResult result ){

    final searchBloc = BlocProvider.of<SearchBloc>(context);
    if(result.manual == true){
      searchBloc.add(OnActivateManualMarkerEvent());
      return;
    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin:  const EdgeInsets.only(top: 10),
        padding:  const EdgeInsets.symmetric(horizontal: 30),
        width: double.infinity,
        child: GestureDetector(
          onTap: () async {
           final result = await showSearch(context: context, delegate: SearchDestinationDelegate());
          
          if(result == null) return;
          onSearchResults( context, result );
          
          },
          child: FadeInDown(
            duration: const Duration(milliseconds: 200),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
              child: const Text('¿A dónde quiere enviar su mandadito?', style: TextStyle( color: Colors.black87)),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    offset: Offset (0,5),
                  )
                ]
              ),
            ),
          ),
        ),
      ),
    );
  }
}