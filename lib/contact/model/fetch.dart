import 'package:flutter_nobokek/contact/model/MyContact.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<ContactList>> fetchContact() async {
    var url = Uri.parse('https://nobokekk.up.railway.app/nobokek/json/');
    var response = await http.get(
    url,
    headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
    },
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object Contact
    List<ContactList> listContact = [];
    for (var d in data) {
    if (d != null) {
        listContact.add(ContactList.fromJson(d));
    }
    }

    return listContact;
}
