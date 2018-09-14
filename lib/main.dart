import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:statisticsapp/screens/loginscreen.dart';
=======
import 'package:statisticsapp/screens/dashboard_screen.dart';
>>>>>>> 7c3056c95fbafb9f74982e59facf4b4420676dce

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
<<<<<<< HEAD
      home: new LoginScreen(title: 'Centiro Statistics'),
=======
      home: new DashboardScreen()//new StatsScreen(title: 'Super Statistics App'),
>>>>>>> 7c3056c95fbafb9f74982e59facf4b4420676dce
    );
  }
}