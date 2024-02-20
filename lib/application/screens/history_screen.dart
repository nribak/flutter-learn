import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  final String currencyKey;

  const HistoryScreen({super.key, required this.currencyKey});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Text(currencyKey),
    );
  }
}