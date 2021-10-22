// To parse this JSON data, do
//
//     final countryodel = countryodelFromJson(jsonString);

import 'dart:convert';

Countryodel countryodelFromJson(String str) => Countryodel.fromJson(json.decode(str));

String countryodelToJson(Countryodel data) => json.encode(data.toJson());

class Countryodel {
  Countryodel({
    this.countries,
  });

  List<Country> countries;

  factory Countryodel.fromJson(Map<String, dynamic> json) => Countryodel(
    countries: List<Country>.from(json["countries"].map((x) => Country.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "countries": List<dynamic>.from(countries.map((x) => x.toJson())),
  };
}

class Country {
  Country({
    this.nameEn,
  });

  String nameEn;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    nameEn: json["name_en"],
  );

  Map<String, dynamic> toJson() => {
    "name_en": nameEn,
  };
}
