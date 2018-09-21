import 'project.dart';

class User{
  final String name;
  final List<Project> projects;

  User({this.name, this.projects});

  factory User.fromJson(Map<String, dynamic> json){
      var list = json['projects'] as List;
      List<Project> projectList = list.map((i) => Project.fromJson(i)).toList();

      return User(
        name: json['name'],
        projects: projectList
      );
  }
}