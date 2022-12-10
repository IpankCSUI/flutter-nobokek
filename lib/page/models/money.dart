// To parse this JSON data, do
//
//     final money = moneyFromJson(jsonString);

import 'dart:convert';

List<Money> moneyFromJson(String str) => List<Money>.from(json.decode(str).map((x) => Money.fromJson(x)));

String moneyToJson(List<Money> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Money {
    Money({
        this.model,
        this.pk,
        this.fields,
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
        this.user,
        this.income,
        this.outcome,
        this.descIn,
        this.descOut,
        this.date,
        this.note,
    });

    int user;
    int income;
    dynamic outcome;
    String descIn;
    dynamic descOut;
    DateTime date;
    dynamic note;

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
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "note": note,
    };
}