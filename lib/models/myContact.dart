// To parse this JSON data, do
//
//     final contact = contactFromJson(jsonString);

import 'dart:convert';

List<Contact> contactFromJson(String str) => List<Contact>.from(json.decode(str).map((x) => Contact.fromJson(x)));

String contactToJson(List<Contact> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Contact {
    Contact({
        required this.model,
        required this.pk,
        required this.fields,
    });

    String model;
    int pk;
    Fields fields;

    factory Contact.fromJson(Map<String, dynamic> json) => Contact(
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
        required this.date,
        required this.nama,
        required this.alamat,
        required this.masalah,
    });

    int user;
    DateTime date;
    String nama;
    String alamat;
    String masalah;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        date: DateTime.parse(json["date"]),
        nama: json["nama"],
        alamat: json["alamat"],
        masalah: json["masalah"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "nama": nama,
        "alamat": alamat,
        "masalah": masalah,
    };
}
