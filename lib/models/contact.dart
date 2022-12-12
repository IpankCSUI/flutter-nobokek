// To parse this JSON data, do
//
//     final contactList = contactListFromJson(jsonString);

import 'dart:convert';

List<ContactList> contactListFromJson(String str) => List<ContactList>.from(json.decode(str).map((x) => ContactList.fromJson(x)));

String contactListToJson(List<ContactList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ContactList {
  final int pk;
  final String nama;
  final String alamat;
  final String masalah;

  ContactList({
    required this.pk,
    required this.nama,
    required this.alamat,
    required this.masalah,
  });

     factory ContactList.fromJson(Map<String, dynamic> json) => ContactList(
        pk: json["pk"],
        nama: json["fields"]["nama"],
        alamat: json["fields"]["alamat"],
        masalah: json["fields"]["masalah"],
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
        "alamat": alamat,
        "masalah" : masalah,
      };
}