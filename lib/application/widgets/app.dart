import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di/injector.dart';
import '../logic/live_bloc.dart';
import 'live_fx_screen.dart';

class App extends StatelessWidget {
  App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LiveBloc.newInstance(repository: Resolver.instance().currenciesRepositories),
      child: LiveFXScreen(),
    );
  }
}