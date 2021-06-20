// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../home/blocs/HomeBloc.dart' as _i10;
import '../../home/network/PokemonPageCache.dart' as _i6;
import '../../home/network/PokemonPageDataSource.dart' as _i4;
import '../../home/network/PokemonPageRepository.dart' as _i9;
import '../data/PokeApiPage.dart' as _i5;
import '../network/api/ApiModule.dart' as _i8;
import '../network/api/PokeApi.dart' as _i7;

const String _dev = 'dev';
const String _prod = 'prod';
const String _test = 'test';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final apiModule = _$ApiModule();
  gh.lazySingleton<_i3.Dio>(() => apiModule.getDio());
  gh.factory<_i4.LocalDataSource<_i5.PokeApiPage>>(
      () => _i6.PokemonPageLocalDataSource());
  gh.lazySingleton<_i7.PokeApi>(() => apiModule.getPokeApi(get<_i3.Dio>()),
      registerFor: {_dev, _prod});
  gh.factory<_i7.PokeApi>(() => _i8.MockPokeApi(), registerFor: {_test});
  gh.lazySingleton<_i9.PokemonPageRepository>(() => _i9.PokemonPageRepository(
      get<_i7.PokeApi>(), get<_i4.LocalDataSource<_i5.PokeApiPage>>()));
  gh.factory<_i10.HomeBloc>(
      () => _i10.HomeBloc(get<_i9.PokemonPageRepository>()));
  return get;
}

class _$ApiModule extends _i8.ApiModule {}
