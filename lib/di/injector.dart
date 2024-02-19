import 'package:currencies/domain/currencies_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injector.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureDependencies() => getIt.init();

class Resolver {
  Resolver._internal();
  static final _instance = Resolver._internal();
  factory Resolver.instance() => _instance;

  CurrenciesRepository get currenciesRepositories =>
      getIt<CurrenciesRepository>();
}