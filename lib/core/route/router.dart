import 'package:flutter/material.dart';
import 'package:scrips_task/features/home/presentation/pages/home_page.dart';

import 'app_route_paths.dart';

class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutePaths.Home:
        return MaterialPageRoute(
            builder: (_) => HomePage(
                  key: ObjectKey(settings.name),
                  // next: homeView(settings),
                ),
            settings: RouteSettings(name: settings.name));

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );

    }
  }
}
