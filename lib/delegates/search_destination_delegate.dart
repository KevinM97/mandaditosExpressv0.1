import 'package:flutter/material.dart';
import 'package:mandaditos_express/models/search_result.dart';

class SearchDestinationDelegate extends SearchDelegate<SearchResult> {

  SearchDestinationDelegate():super(
    searchFieldLabel: 'Lugar mandadito'
  );
  
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: (){
            query = '';
        } 
        )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon:const Icon(Icons.arrow_back_ios),
      onPressed: (){

        final result = SearchResult(cancel: true);
        close(context, result);
      }, 
      );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('buildResult');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: const Icon(Icons.location_on_outlined, color: Colors.black),
          title: const Text('Colocar la ubicación manualmente', style: TextStyle(color: Colors.black)),
          onTap: (){
            //TODO: Marcar la ubicación manualmente
            final result = SearchResult(cancel: false, manual: true);
            close(context, result);
          }
        )
      ],
    );
  }

}