import 'dart:async';

import 'package:flutterdex/common/data/PokeApiPage.dart';
import 'package:flutterdex/common/network/api/PokeApi.dart';
import 'package:flutterdex/home/network/PokemonPageDataSource.dart';
import 'package:injectable/injectable.dart';

const defaultLimit = 20;

@lazySingleton
class PokemonPageRepository {
  final PokeApi _api;
  final LocalDataSource<PokeApiPage> _cache;

  PokemonPageRepository(this._api, this._cache);

  Future<PokeApiPage> getPage(int offset) async {
    if (_cache.contains(offset)) {
      return _cache.get(offset);
    } else {
      final response = await _api.getPokemonPage(offset, defaultLimit);
      _cache.store(offset, response);
      return response;
    }
  }
}
