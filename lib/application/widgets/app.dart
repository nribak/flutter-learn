import 'package:currencies/application/logic/live_bloc.dart';
import 'package:currencies/application/widgets/live_fx_screen.dart';
import 'package:currencies/data/providers/api_provider_impl.dart';
import 'package:currencies/data/providers/storage_provider.dart';
import 'package:currencies/data/repositories/currency_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  App({super.key});

  // temporary: will be replaced by a DI system
  final repository = CurrencyRepositoryImpl(
      apiProvider: ApiProviderImpl(),
    storageProvider: StorageProvider(
        database: $FloorDatabaseProvider.databaseBuilder('app_database.db')
            .build())
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LiveBloc.newInstance(repository: repository)..add(LiveBlocEvent()),
      child: LiveFXScreen(),
    );
  }
}