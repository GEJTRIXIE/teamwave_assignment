import 'package:http/http.dart' as http;
import 'package:sports_teamwave/model/country_model.dart';
import 'package:sports_teamwave/model/league_model.dart';
import 'dart:async';
import 'dart:convert';

import 'package:sports_teamwave/model/sports_model.dart';

class ApiService {
  String endPointUrl = 'https://www.thesportsdb.com';
  String sportsApi = "/api/v1/json/1/all_sports.php";
  String countryApi = "/api/v1/json/1/all_countries.php";
  String leagueApi = "/api/v1/json/1/search_all_leagues.php?c=";
  String leagueSearchApi = "&s=";

  Future<SportsModel> getSportsList() async {
    return await http.get(
      Uri.parse(endPointUrl + sportsApi),
      headers: {"Content-Type": "application/json"},
    ).then((http.Response response) {
      if (response.statusCode == 200) {
        var resReturnCode = SportsModel.fromJson(jsonDecode(response.body));
        if (resReturnCode.sports != null) {
          return SportsModel.fromJson(jsonDecode(response.body));
        } else {
          throw Exception('Failed to fetch');
        }
      } else {
        throw Exception('Failed to fetch');
      }
    });
  }

  Future<Countryodel> getCountryList() async {
    return await http.get(
      Uri.parse(endPointUrl + countryApi),
      headers: {"Content-Type": "application/json"},
    ).then((http.Response response) {
      if (response.statusCode == 200) {
        var resReturnCode = Countryodel.fromJson(jsonDecode(response.body));
        if (resReturnCode.countries != null) {
          return Countryodel.fromJson(jsonDecode(response.body));
        } else {
          return Countryodel(countries: []);
        }
      } else {
        throw Exception('Failed to fetch');
      }
    });
  }

  Future<LeagueModel> getLeaguesList(
      {String countryName, bool isSearch, String searchString}) async {
    return await http.get(
      Uri.parse(endPointUrl +
          (isSearch
              ? (leagueApi + countryName + leagueSearchApi + searchString)
              : (leagueApi + countryName))),
      headers: {"Content-Type": "application/json"},
    ).then((http.Response response) {
      if (response.statusCode == 200) {
        var resReturnCode = LeagueModel.fromJson(jsonDecode(response.body));
        if (resReturnCode.countrys != null) {
          return LeagueModel.fromJson(jsonDecode(response.body));
        } else {
          throw Exception('Failed to fetch');
        }
      } else {
        throw Exception('Failed to fetch');
      }
    });
  }
}
