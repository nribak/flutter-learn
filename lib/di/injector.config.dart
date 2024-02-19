// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/providers/api_provider.dart' as _i3;
import '../data/providers/api_provider_impl.dart' as _i4;
import '../data/providers/storage_provider.dart' as _i5;
import '../data/repositories/currency_repository_impl.dart' as _i7;
import '../domain/currencies_repository.dart' as _i6;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.APIProvider>(() => _i4.ApiProviderImpl());
    gh.lazySingleton<_i5.StorageProvider>(() => _i5.StorageProvider.create());
    gh.lazySingleton<_i6.CurrenciesRepository>(() => _i7.CurrencyRepositoryImpl(
          apiProvider: gh<_i3.APIProvider>(),
          storageProvider: gh<_i5.StorageProvider>(),
        ));
    return this;
  }
}
