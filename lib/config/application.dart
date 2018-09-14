/*
 * fluro
 * A Posse Production
 * http://goposse.com
 * Copyright (c) 2018 Posse Productions LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */
import 'package:fluro/fluro.dart';
import 'package:statisticsapp/config/route_handlers.dart';

// class Application {
//   static Router router;
// }

class AppRouter {

   String root = "/";
   String dashboard = "/dashboard";
   String projectStats = "/projectstats";
   String about = "/about";

  static final AppRouter _instance = new AppRouter._internal();
  final Router _router = new Router();  // global router

  factory AppRouter() {
    return _instance;
  }
  
  AppRouter._internal() {
    _configureRoutes();
  }

// singleton
  Router get router {
    return _router;
  }


  void _configureRoutes() {
    _router.define(root, handler: rootHandler);
    _router.define(dashboard, handler: dashboardHandler);

  }
}