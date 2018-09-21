import 'project.dart';

class User{
  final String name;
  final List<Project> projects;

  User({this.name, this.projects});

  factory User.fromJson(Map<String, dynamic> json){
      var list = json['Projects'] as List;
      List<Project> projectList = list.map((i) => Project.fromJson(i)).toList();

      return User(
        name: json['Name'],
        projects: projectList
      );
  }
}