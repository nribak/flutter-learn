import 'package:currencies/application/logic/live_bloc.dart';
import 'package:currencies/application/widgets/fx_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LiveFXScreen extends StatelessWidget {
  LiveFXScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FX")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: BlocBuilder<LiveBloc, LiveBlocState>(
          builder: (context, snapshot) {
            return snapshot.isLoading ?
                Center(
                  child: CircularProgressIndicator(),
                ) :
            ListView.builder(
              itemCount: snapshot.currencies.length,
              itemBuilder: (context, index) =>
                  FXItem(currency: snapshot.currencies[index]),
            );
          },
        ),
      )
    );
  }
}