// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../home/blocs/HomeBloc.dart' as _i10;
import '../../home/network/PokemonPageCache.dart' as _i6;
import '../../home/network/PokemonPageDataSource.dart' as _i8;
import '../../home/network/PokemonPageRepository.dart' as _i7;
import '../data/PokeApiPage.dart' as _i9;
import '../network/api/ApiModule.dart' as _i5;
import '../network/api/PokeApi.dart' as _i4;

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
  gh.lazySingleton<_i4.PokeApi>(() => apiModule.getPokeApi(get<_i3.Dio>()),
      registerFor: {_dev, _prod});
  gh.factory<_i4.PokeApi>(() => _i5.MockPokeApi(), registerFor: {_test});
  gh.factory<_i6.PokemonPageLocalDataSource>(
      () => _i6.PokemonPageLocalDataSource());
  gh.lazySingleton<_i7.PokemonPageRepository>(() => _i7.PokemonPageRepository(
      get<_i4.PokeApi>(), get<_i8.LocalDataSource<_i9.PokeApiPage>>()));
  gh.factory<_i10.HomeBloc>(
      () => _i10.HomeBloc(get<_i7.PokemonPageRepository>()));
  return get;
}

class _$ApiModule extends _i5.ApiModule {}
