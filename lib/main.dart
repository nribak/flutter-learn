import 'package:fibonacci/widgets/fibonacci_app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(
        themeMode: ThemeMode.system,
          darkTheme: ThemeData.dark(),
          home: Scaffold(
              appBar: AppBar(
                title: const Text("Fibonacci App"),
              ),
              body: const FibonacciApp()
          )
      )
  );
}

