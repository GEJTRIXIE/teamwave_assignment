import 'dart:async';

import 'package:sports_teamwave/model/country_model.dart';
import 'package:sports_teamwave/services/api_service.dart';

class CountryRepo {
  ApiService _apiFetch = ApiService();
  List<Country> documentList = List.empty(growable: true);
  StreamController<Countryodel> countryController = StreamController<Countryodel>();

  Stream<Countryodel> get countryStream => countryController.stream;


  fetchInitialData() async {
    Countryodel _myList;
    await _apiFetch
        .getCountryList()
        .then((value) {
      _myList = value;
    });
    documentList=List.empty(growable: true);
    for (var e in _myList.countries) {
      documentList.add(e);
    }
    //print('documennn ${documentList.length}');
    countryController.sink.add(Countryodel(countries: documentList));
  }

}
