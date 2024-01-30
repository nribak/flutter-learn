import 'package:flutter/material.dart';

extension WidgetExtensions on Widget {

  Widget withColor(Color color) {
    return Container(
      color: color,
      child: this
    );
  }
}

extension StringExtension on int {

  bool isReallyEven() => this % 2 == 0;
}