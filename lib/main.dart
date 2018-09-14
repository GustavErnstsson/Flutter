import 'config/application.dart';
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'config/routes.dart';

void main() => runApp(new Main());

class Main extends StatefulWidget {
  @override
  State createState() {
    return new MainState();
  }
}

class MainState extends State<Main> {
  MainState() {
    final router = new Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    final app = new MaterialApp(
      title: 'Centiro',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: Application.router.generator,
    );
    print("initial route = ${app.initialRoute}");
    return app;
  }
}