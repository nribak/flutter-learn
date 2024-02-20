import 'package:currencies/application/routes/app_route.dart';
import 'package:flutter/material.dart';

mixin AppRouteMixin on Widget {

  void navigate(BuildContext context, AppRoute route) {
    Navigator.of(context).pushNamed(route.name, arguments: route);
  }
}