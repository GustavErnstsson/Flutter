class Project{
    final DateTime startTime;
    final DateTime finishedTime;
    final String name;
    final int hoursSpent;

    Project({this.startTime, this.finishedTime, this.name, this.hoursSpent});

    factory Project.fromJson(Map<String, dynamic> json){
      
      return Project(
        startTime: DateTime.parse(json['StartTime']),
        finishedTime: DateTime.parse(json['FinishedTime']),
        name: json['Name'],
        hoursSpent: json['TotalHours']
      );
  }
}