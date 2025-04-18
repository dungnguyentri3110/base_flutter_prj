// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../data/remote/api_manager.dart' as _i876;
import '../data/remote/api_services/api_services.dart' as _i697;
import '../data/repository_impl/example_repositories.dart' as _i996;
import '../domain/repository/example_repository.dart' as _i888;
import '../domain/usecases/example_usecase.dart' as _i181;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i876.ApiManager>(() => _i876.ApiManager());
    gh.lazySingleton<_i697.ApiServices>(
      () => _i697.ApiServices(apiManager: gh<_i876.ApiManager>()),
    );
    gh.lazySingleton<_i888.ExampleRepository>(
      () => _i996.ExampleRepositoryImpl(apiServices: gh<_i697.ApiServices>()),
    );
    gh.lazySingleton<_i181.ExampleUsecase>(
      () => _i181.ExampleUsecase(repository: gh<_i888.ExampleRepository>()),
    );
    return this;
  }
}
