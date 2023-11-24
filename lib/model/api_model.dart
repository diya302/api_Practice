// To parse this JSON data, do
//
//     final first = firstFromJson(jsonString);

import 'dart:convert';

List<First> firstFromJson(String str) =>
    List<First>.from(json.decode(str).map((x) => First.fromJson(x)));

String firstToJson(List<First> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class First {
  int userId;
  int id;
  String title;
  String body;

  First({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory First.fromJson(Map<String, dynamic> json) => First(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
