import 'dart:async';
import 'dart:convert';
import 'dart:io';

import '../model/user.dart';
import '../model/users.dart';

import 'package:http/http.dart' as http;

class Userfetcher{
  final String _filePath = "https://raw.githubusercontent.com/GustavErnstsson/Flutter/master/assets/testData.json";
  final int cacheTimeInMinutes;

  DateTime _lastReload = DateTime.now();
  Users _users;

  Userfetcher({this.cacheTimeInMinutes: 1}){
    loadAllUserData();
  }

  Future loadAllUserData() async {
    final response = await http.get(_filePath);
    
    if (response.statusCode == 200) {
      _users = Users.fromJson(json.decode(response.body));
      _lastReload = DateTime.now();
    } else {
      throw Exception('Failed to load post');
    }
  }

  bool isUserLoaded(String name){
    return _users.userExists(name);
  }

  User getUserData(String name){
    if(_lastReload.add(new Duration(minutes: cacheTimeInMinutes)).compareTo(DateTime.now()) < 0){
      loadAllUserData();
    }
    _users.getUser(name);
  }
}