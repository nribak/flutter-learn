import 'package:currencies/application/routes/app_route.dart';
import 'package:currencies/application/widgets/app.dart';
import 'package:flutter/material.dart';

import 'di/injector.dart';

void main() {
  configureDependencies();

  runApp(
    MaterialApp(
      initialRoute: HomeRoute().name,
      onGenerateRoute: (setting) {
        final route = setting.arguments;
        if(route is AppRoute) {
          final builder = route.builder;
          return MaterialPageRoute(builder: builder);
        } else {
          return MaterialPageRoute(builder: (context) => App());
        }
      },
    )
  );
}
