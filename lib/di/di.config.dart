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

import '../api/api_manager.dart' as _i1047;
import '../api/data_source/products_online_data_source_impl.dart' as _i823;
import '../data/data_source/products_online_data_source.dart' as _i534;
import '../data/repos/products_repo_impl.dart' as _i166;
import '../domain/repos/products_repo.dart' as _i364;
import '../domain/use_case/get_products_use_case.dart' as _i364;
import '../features/products_screen/cubit/products_cubit.dart' as _i446;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i1047.ApiManager>(() => _i1047.ApiManager());
    gh.factory<_i534.ProductsOnlineDataSource>(
      () => _i823.ProductsOnlineDataSourceImpl(gh<_i1047.ApiManager>()),
    );
    gh.factory<_i364.ProductsRepo>(
      () => _i166.ProductsRepoImpl(gh<_i534.ProductsOnlineDataSource>()),
    );
    gh.factory<_i364.GetProductsUseCase>(
      () => _i364.GetProductsUseCase(gh<_i364.ProductsRepo>()),
    );
    gh.factory<_i446.ProductsCubit>(
      () => _i446.ProductsCubit(gh<_i364.GetProductsUseCase>()),
    );
    return this;
  }
}
