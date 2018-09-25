import 'project.dart';

class User{
  final String name;
  final List<Project> projects;
  final List<int> shipments;

  User({this.name, this.projects, this.shipments});

  factory User.fromJson(Map<String, dynamic> json){
      var list = json['Projects'] as List;
      List<Project> projectList = list.map((i) => Project.fromJson(i)).toList();

      List<int> shipmentsList = json['Shipments'] as List;

      return User(
        name: json['Name'],
        projects: projectList,
        shipments: shipmentsList
      );
  }
}