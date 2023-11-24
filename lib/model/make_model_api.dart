// To parse this JSON data, do
//
//     final namesModel = namesModelFromJson(jsonString);

import 'dart:convert';

NamesModel namesModelFromJson(String str) =>
    NamesModel.fromJson(json.decode(str));

String namesModelToJson(NamesModel data) => json.encode(data.toJson());

class NamesModel {
  String name;
  int age;
  String profession;
  String image;
  Details details;

  NamesModel({
    required this.name,
    required this.age,
    required this.profession,
    required this.image,
    required this.details,
  });

  factory NamesModel.fromJson(Map<String, dynamic> json) => NamesModel(
        name: json["name"],
        age: json["age"],
        profession: json["profession"],
        image: json["image"],
        details: Details.fromJson(json["details"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "age": age,
        "profession": profession,
        "image": image,
        "details": details.toJson(),
      };
}

class Details {
  String? fathername;

  Details({
    required this.fathername,
  });

  factory Details.fromJson(Map<String, dynamic> json) => Details(
        fathername: json["fathername"],
      );

  Map<String, dynamic> toJson() => {
        "fathername": fathername,
      };
}
