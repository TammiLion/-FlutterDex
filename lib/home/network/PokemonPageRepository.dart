import 'dart:async';

import 'package:flutterdex/common/data/PokeApiPage.dart';
import 'package:flutterdex/common/network/data/NetworkResource.dart';
import 'package:flutterdex/generated/locale_keys.g.dart';
import 'package:flutterdex/home/network/PokemonPageDataSource.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class PokemonPageRepository {
  final PokeApiPageDataSource _networkDataSource;
  final PokeApiPageDataSource _cache;

  PokemonPageRepository(
      @Named("network") this._networkDataSource, @Named("local") this._cache);

  Stream<NetworkResource<PokeApiPage>> getPage(int offset) async* {
    try {
      PokeApiPage? page = await _cache.getPage(offset);
      if (page == null) {
        yield NetworkResource.loading();
        page = await _networkDataSource.getPage(offset);
        if (page != null) {
          yield NetworkResource(page.copyWith(offset: offset));
        }
      }
    } on Exception catch (e) {
      yield NetworkResource.error(LocaleKeys.error);
    }
  }
}
