import 'package:currencies/application/logic/live_bloc.dart';
import 'package:currencies/application/widgets/fx_item.dart';
import 'package:currencies/domain/currency.dart';
import 'package:flutter/material.dart';

class LiveFXScreen extends StatelessWidget {
  final bloc = LiveBloc.newInstance()..add(LiveBlocEvent());
  LiveFXScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final list = Currency.dummyCurrencies;
    return Scaffold(
      appBar: AppBar(title: Text("FX")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) => FXItem(currency: list[index])
        )
      )
    );
  }
}