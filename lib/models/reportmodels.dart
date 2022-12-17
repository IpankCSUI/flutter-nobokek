// To parse this JSON data, do
//
//     final target = targetFromJson(jsonString);

import 'dart:convert';

List<Target> targetFromJson(String str) => List<Target>.from(json.decode(str).map((x) => Target.fromJson(x)));

String targetToJson(List<Target> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Target {
    Target({
        required this.model,
        required this.pk,
        required this.fields,
    });

    String model;
    int pk;
    Fields fields;

    factory Target.fromJson(Map<String, dynamic> json) => Target(
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
        required this.title,
        required this.description,
        required this.isFinished,
    });

    int user;
    String title;
    String description;
    bool isFinished;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        title: json["title"],
        description: json["description"],
        isFinished: json["is_finished"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "title": title,
        "description": description,
        "is_finished": isFinished,
    };
}
