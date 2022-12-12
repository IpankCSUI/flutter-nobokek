import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_nobokek/contact/model/MyContact.dart';
import 'package:flutter_nobokek/models/money.dart';
import 'package:flutter_nobokek/models/reportmodels.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter_nobokek/models/pendapatForum.dart';

class NoBokekApi {
  static Future<String?> fetchUsername(BuildContext context) async {
    const url = "https://nobokekk.up.railway.app/report/get_username/";
    final request = Provider.of<CookieRequest>(context, listen: false);
    try {
      final response = await request.get(url);
      final username = response[0]["fields"]["username"];
      return username;
    } catch (error) {
      log("ERROR: $error");
      return null;
    }
  }

  static Future<List<Money>?> fetchTransactions(BuildContext context) async {
    const url = "https://nobokekk.up.railway.app/add/json/";
    final request = Provider.of<CookieRequest>(context, listen: false);
    List<Money> listMoney = [];
    try {
      final response = await request.get(url) as List<dynamic>;
      for (var i = 0; i < response.length; i++) {
        final money = Money.fromJson(response[i]);
        listMoney.add(money);
      }
      return listMoney;
    } catch (error) {
      log("ERROR: $error");
      return null;
    }
  }

  static Future<List<Target>?> fetchReport(BuildContext context) async {
    const url = "https://nobokekk.up.railway.app/report/json/";
    final request = Provider.of<CookieRequest>(context, listen: false);
    List<Target> listTarget = [];
    try {
      final response = await request.get(url) as List<dynamic>;
      for (var i = 0; i < response.length; i++) {
        final target = Target.fromJson(response[i]);
        listTarget.add(target);
      }
      return listTarget;
    } catch (error) {
      log("ERROR: $error");
      return null;
    }
  }

  static Future<List<ContactList>?> fetchContact(BuildContext context) async {
    const url = "https://nobokekk.up.railway.app/nobokek/json/";
    final request = Provider.of<CookieRequest>(context, listen: false);
    List<ContactList> listContact = [];
    try {
      final response = await request.get(url) as List<dynamic>;
      for (var i = 0; i < response.length; i++) {
        final contact = ContactList.fromJson(response[i]);
        listContact.add(contact);
      }
      return listContact;
    } catch (error) {
      log("ERROR: $error");
      return null;
    }
  }
  static Future<void> addTarget(
    BuildContext context,
    Map<String, dynamic> data,
  ) async {
    const url = "https://nobokekk.up.railway.app/report/add/";
    final request = Provider.of<CookieRequest>(context, listen: false);
    try {
      await request.post(url, data);
      log("mas");
      // return true;
    } catch (error) {
      log("ERROR: $error");
      // return false;
    }
  }

  static Future<void> deleteTarget(
    BuildContext context,
    int pk,
  ) async {
    final url = 'https://nobokekk.up.railway.app/report/delete/$pk/';
    final request = Provider.of<CookieRequest>(context, listen: false);
    try {
      await request.post(url, null);
    } catch (error) {
      log("ERROR: $error");
      // return false;
    }
  }
  static Future<List<PendapatForum>?> fetchForum(BuildContext context) async {
    const url = "https://nobokekk.up.railway.app/forum/json/";
    final request = Provider.of<CookieRequest>(context, listen: false);
    List<PendapatForum> listData = [];
    try {
      final response = await request.get(url) as List<dynamic>;
      for (var i = 0; i < response.length; i++) {
        final data = PendapatForum.fromJson(response[i]);
        listData.add(data);
      }
      return listData;
    } catch (error) {
      log("ERROR: $error");
      return null;
    }
  }
static Future<void> addForum(
    BuildContext context,
    Map<String, dynamic> data,
  ) async {
    const url = "https://nobokekk.up.railway.app/forum/add_data_pendapat_forum/";
    final request = Provider.of<CookieRequest>(context, listen: false);
    try {
      await request.post(url, data);
      log("mas");
      // return true;
    } catch (error) {
      log("ERROR: $error");
      // return false;
    }
  }
}

