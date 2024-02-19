import 'package:currencies/application/widgets/app.dart';
import 'package:flutter/material.dart';

import 'di/injector.dart';

void main() {
  configureDependencies();
  runApp(
    MaterialApp(
      home: App(),
    )
  );
}
