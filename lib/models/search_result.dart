class SearchResult {

  final bool cancel;
  final bool? manual;

  SearchResult({
    this.manual = false, 
    required this.cancel, 
  });

  //TODO: nombre del destino, descripción latLon

@override
  String toString() {
    return '{ cancel: $cancel, manual: $manual }';
  }

}