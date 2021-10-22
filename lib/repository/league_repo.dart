import 'dart:async';
import 'package:sports_teamwave/model/league_model.dart';
import 'package:sports_teamwave/services/api_service.dart';

class LeaguesRepo {
  ApiService _apiFetch = ApiService();
  List<Country> documentList = List.empty(growable: true);
  StreamController<LeagueModel> leagueController =
      StreamController<LeagueModel>();

  Stream<LeagueModel> get leagueStream => leagueController.stream;

  fetchInitialData(
      {String countryName, bool isSearch, String searchString}) async {
    LeagueModel _myList;
    await _apiFetch
        .getLeaguesList(
            countryName: countryName,
            searchString: searchString,
            isSearch: isSearch)
        .then((value) {
      _myList = value;
    });
    documentList = List.empty(growable: true);
    for (var e in _myList.countrys) {
      documentList.add(e);
    }
    //print('documennn ${documentList.length}');
    leagueController.sink.add(LeagueModel(countrys: documentList));
  }
}
