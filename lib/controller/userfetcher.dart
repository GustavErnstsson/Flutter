import 'dart:convert';
import 'dart:io';

import '../model/user.dart';
import '../model/users.dart';

class Userfetcher{
  final String _filePath = "//centiro.se/Internal/Temp/flutter/TestData.json";
  final int cacheTimeInMinutes;

  DateTime _lastReload = DateTime.now();
  Users _users;

  Userfetcher({this.cacheTimeInMinutes: 2}){
    loadAllUserData();
  }

  void loadAllUserData(){
    File file = new File(_filePath);
    String fileContent = file.readAsStringSync(encoding: Encoding.getByName("UTF8"));
    
    _users = Users.fromJson(json.decode(fileContent));
    _lastReload = DateTime.now();
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