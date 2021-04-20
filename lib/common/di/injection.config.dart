// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

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
  return get;
}

class _$ApiModule extends _i5.ApiModule {}
