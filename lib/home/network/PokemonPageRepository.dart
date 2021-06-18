import 'dart:async';

import 'package:flutterdex/common/data/PokeApiPage.dart';
import 'package:flutterdex/common/data/Resource.dart';
import 'package:flutterdex/home/network/PokemonPageDataSource.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class PokemonPageRepository {
  final PokeApiPageDataSource _networkDataSource;
  final PokeApiPageDataSource _cache;

  PokemonPageRepository(
      @Named("network") this._networkDataSource, @Named("local") this._cache);

  Stream<Resource<PokeApiPage>> getPage(int offset) async* {
    try {
      PokeApiPage? page = await _cache.getPage(offset);
      if (page == null) {
        yield Resource.loading();
        page = await _networkDataSource.getPage(offset);
        yield Resource(page!.copyWith(offset: offset));
      }
    } on Exception {
      yield Resource.error();
    }
  }
}
