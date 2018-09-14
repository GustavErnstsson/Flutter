/*
 * fluro
 * A Posse Production
 * http://goposse.com
 * Copyright (c) 2018 Posse Productions LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import './route_handlers.dart';

class Routes {
  static String root = "/";
  static String dashboard = "/dashboard";
  static String projectStats = "/projectstats";
  static String about = "/about";

  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("Unable to find route");
    });
    router.define(root, handler: rootHandler);
    router.define(dashboard, handler: dashboardHandler);
    // router.define(projectStats, handler: projectStatsHandler);
    // router.define(about, handler: aboutHandler);
  }
}
