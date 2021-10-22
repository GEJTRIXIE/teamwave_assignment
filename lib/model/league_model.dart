// To parse this JSON data, do
//
//     final leagueModel = leagueModelFromJson(jsonString);

import 'dart:convert';

LeagueModel leagueModelFromJson(String str) =>
    LeagueModel.fromJson(json.decode(str));

String leagueModelToJson(LeagueModel data) => json.encode(data.toJson());

class LeagueModel {
  LeagueModel({
    this.countrys,
  });

  List<Country> countrys;

  factory LeagueModel.fromJson(Map<String, dynamic> json) => LeagueModel(
        countrys: json["countrys"] == null
            ? List.empty(growable: true)
            : List<Country>.from(
                json["countrys"].map((x) => Country.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "countrys": List<dynamic>.from(countrys.map((x) => x.toJson())),
      };
}

class Country {
  Country({
    this.idLeague,
    this.idSoccerXml,
    this.idApIfootball,
    this.strSport,
    this.strLeague,
    this.strLeagueAlternate,
    this.strDivision,
    this.idCup,
    this.strCurrentSeason,
    this.intFormedYear,
    this.dateFirstEvent,
    this.strGender,
    this.strCountry,
    this.strWebsite,
    this.strFacebook,
    this.strTwitter,
    this.strYoutube,
    this.strRss,
    this.strDescriptionEn,
    this.strDescriptionDe,
    this.strDescriptionFr,
    this.strDescriptionIt,
    this.strDescriptionCn,
    this.strDescriptionJp,
    this.strDescriptionRu,
    this.strDescriptionEs,
    this.strDescriptionPt,
    this.strDescriptionSe,
    this.strDescriptionNl,
    this.strDescriptionHu,
    this.strDescriptionNo,
    this.strDescriptionPl,
    this.strDescriptionIl,
    this.strTvRights,
    this.strFanart1,
    this.strFanart2,
    this.strFanart3,
    this.strFanart4,
    this.strBanner,
    this.strBadge,
    this.strLogo,
    this.strPoster,
    this.strTrophy,
    this.strNaming,
    this.strComplete,
    this.strLocked,
  });

  String idLeague;
  dynamic idSoccerXml;
  dynamic idApIfootball;
  String strSport;
  String strLeague;
  String strLeagueAlternate;
  String strDivision;
  String idCup;
  String strCurrentSeason;
  String intFormedYear;
  dynamic dateFirstEvent;
  String strGender;
  String strCountry;
  String strWebsite;
  String strFacebook;
  String strTwitter;
  String strYoutube;
  String strRss;
  String strDescriptionEn;
  dynamic strDescriptionDe;
  dynamic strDescriptionFr;
  dynamic strDescriptionIt;
  dynamic strDescriptionCn;
  dynamic strDescriptionJp;
  dynamic strDescriptionRu;
  String strDescriptionEs;
  dynamic strDescriptionPt;
  dynamic strDescriptionSe;
  dynamic strDescriptionNl;
  dynamic strDescriptionHu;
  dynamic strDescriptionNo;
  dynamic strDescriptionPl;
  dynamic strDescriptionIl;
  String strTvRights;
  String strFanart1;
  String strFanart2;
  String strFanart3;
  String strFanart4;
  String strBanner;
  String strBadge;
  String strLogo;
  String strPoster;
  String strTrophy;
  String strNaming;
  String strComplete;
  String strLocked;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        idLeague: json["idLeague"],
        idSoccerXml: json["idSoccerXML"],
        idApIfootball: json["idAPIfootball"],
        strSport: json["strSport"],
        strLeague: json["strLeague"],
        strLeagueAlternate: json["strLeagueAlternate"],
        strDivision: json["strDivision"],
        idCup: json["idCup"],
        strCurrentSeason: json["strCurrentSeason"],
        intFormedYear: json["intFormedYear"],
        dateFirstEvent: (json["dateFirstEvent"]),
        strGender: json["strGender"],
        strCountry: json["strCountry"],
        strWebsite: json["strWebsite"],
        strFacebook: json["strFacebook"],
        strTwitter: json["strTwitter"],
        strYoutube: json["strYoutube"],
        strRss: json["strRSS"],
        strDescriptionEn: json["strDescriptionEN"],
        strDescriptionDe: json["strDescriptionDE"],
        strDescriptionFr: json["strDescriptionFR"],
        strDescriptionIt: json["strDescriptionIT"],
        strDescriptionCn: json["strDescriptionCN"],
        strDescriptionJp: json["strDescriptionJP"],
        strDescriptionRu: json["strDescriptionRU"],
        strDescriptionEs: json["strDescriptionES"],
        strDescriptionPt: json["strDescriptionPT"],
        strDescriptionSe: json["strDescriptionSE"],
        strDescriptionNl: json["strDescriptionNL"],
        strDescriptionHu: json["strDescriptionHU"],
        strDescriptionNo: json["strDescriptionNO"],
        strDescriptionPl: json["strDescriptionPL"],
        strDescriptionIl: json["strDescriptionIL"],
        strTvRights: json["strTvRights"],
        strFanart1: json["strFanart1"],
        strFanart2: json["strFanart2"],
        strFanart3: json["strFanart3"],
        strFanart4: json["strFanart4"],
        strBanner: json["strBanner"],
        strBadge: json["strBadge"],
        strLogo: json["strLogo"],
        strPoster: json["strPoster"],
        strTrophy: json["strTrophy"],
        strNaming: json["strNaming"],
        strComplete: json["strComplete"],
        strLocked: json["strLocked"],
      );

  Map<String, dynamic> toJson() => {
        "idLeague": idLeague,
        "idSoccerXML": idSoccerXml,
        "idAPIfootball": idApIfootball,
        "strSport": strSport,
        "strLeague": strLeague,
        "strLeagueAlternate": strLeagueAlternate,
        "strDivision": strDivision,
        "idCup": idCup,
        "strCurrentSeason": strCurrentSeason,
        "intFormedYear": intFormedYear,
        "dateFirstEvent":
            "${dateFirstEvent.year.toString().padLeft(4, '0')}-${dateFirstEvent.month.toString().padLeft(2, '0')}-${dateFirstEvent.day.toString().padLeft(2, '0')}",
        "strGender": strGender,
        "strCountry": strCountry,
        "strWebsite": strWebsite,
        "strFacebook": strFacebook,
        "strTwitter": strTwitter,
        "strYoutube": strYoutube,
        "strRSS": strRss,
        "strDescriptionEN": strDescriptionEn,
        "strDescriptionDE": strDescriptionDe,
        "strDescriptionFR": strDescriptionFr,
        "strDescriptionIT": strDescriptionIt,
        "strDescriptionCN": strDescriptionCn,
        "strDescriptionJP": strDescriptionJp,
        "strDescriptionRU": strDescriptionRu,
        "strDescriptionES": strDescriptionEs,
        "strDescriptionPT": strDescriptionPt,
        "strDescriptionSE": strDescriptionSe,
        "strDescriptionNL": strDescriptionNl,
        "strDescriptionHU": strDescriptionHu,
        "strDescriptionNO": strDescriptionNo,
        "strDescriptionPL": strDescriptionPl,
        "strDescriptionIL": strDescriptionIl,
        "strTvRights": strTvRights,
        "strFanart1": strFanart1,
        "strFanart2": strFanart2,
        "strFanart3": strFanart3,
        "strFanart4": strFanart4,
        "strBanner": strBanner,
        "strBadge": strBadge,
        "strLogo": strLogo,
        "strPoster": strPoster,
        "strTrophy": strTrophy,
        "strNaming": strNaming,
        "strComplete": strComplete,
        "strLocked": strLocked,
      };
}
