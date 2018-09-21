import 'user.dart';

class Users {
  final List<User> users;

  Users({this.users});

  User getUser(String name){
    try{
      return users.where((x) => x.name.toUpperCase() == name.toUpperCase()).first;
    }
    catch(e){
      return null;
    }
  }

  bool userExists(String name){
    return users.any((x)=> x.name.toUpperCase() == name.toUpperCase());
  }

  factory Users.fromJson(Map<String, dynamic> json){
    var list = json['users'] as List;
    List<User> userList = list.map((i) => User.fromJson(i)).toList();

    return Users(users: userList);
  }
}