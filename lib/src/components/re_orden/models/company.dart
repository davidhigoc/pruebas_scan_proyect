// To parse this JSON data, do
//
//     final company = companyFromMap(jsonString);

import 'dart:convert';

class Company {
  Company({
    required this.name,
    required this.depart,
  });

  String name;
  String depart;

  factory Company.fromJson(String str) => Company.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Company.fromMap(Map<String, dynamic> json) => Company(
        name: json["name"],
        depart: json["depart"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "depart": depart,
      };
}
