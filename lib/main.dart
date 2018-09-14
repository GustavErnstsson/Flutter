import 'config/application.dart';
import 'package:flutter/material.dart';

void main() => runApp(new Main());

class Main extends StatefulWidget {

  @override
  State createState() {
    return new MainState();
  }
}

class MainState extends State<Main> {

  // @override void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final app = new MaterialApp(
      title: 'Centiro',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: AppRouter().router.generator,
    );
    print("initial route = ${app.initialRoute}");
    return app;
  }
}