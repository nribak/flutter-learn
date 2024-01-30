import 'package:currencies/application/logic/live_bloc.dart';
import 'package:currencies/application/widgets/live_fx_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LiveBloc.newInstance()..add(LiveBlocEvent()),
      child: LiveFXScreen(),
    );
  }
}