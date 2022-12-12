// To parse this JSON data, do
//
//     final money = moneyFromJson(jsonString);

import 'dart:convert';

List<Money> moneyFromJson(String str) =>
    List<Money>.from(json.decode(str).map((x) => Money.fromJson(x)));

String moneyToJson(List<Money> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Money {
  Money({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory Money.fromJson(Map<String, dynamic> json) => Money(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
      };
}

class Fields {
  Fields({
    required this.user,
    this.income,
    this.outcome,
    this.descIn,
    this.descOut,
    required this.date,
    this.note,
  });

  int user;
  double? income;
  double? outcome;
  String? descIn;
  String? descOut;
  DateTime date;
  dynamic note;

  // dynamic user;
  // double? income;
  // double? outcome;
  // dynamic? descIn;
  // dynamic? descOut;
  // dynamic date;
  // dynamic note;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        income: json["income"],
        outcome: json["outcome"],
        descIn: json["desc_in"],
        descOut: json["desc_out"],
        date: DateTime.parse(json["date"]),
        note: json["note"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "income": income,
        "outcome": outcome,
        "desc_in": descIn,
        "desc_out": descOut,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "note": note,
      };
}