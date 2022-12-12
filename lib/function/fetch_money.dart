import 'package:flutter_nobokek/models/money.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Money>> fetchMoney() async {
  var url = Uri.parse('https://nobokekk.up.railway.app/add/json/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object Money
  List<Money> listMoney = [];
  for (var d in data) {
    if (d != null) {
      listMoney.add(Money.fromJson(d));
    }
  }

  return listMoney;
}
