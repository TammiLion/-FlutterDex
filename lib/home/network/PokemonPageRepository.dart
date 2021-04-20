import 'dart:async';

import 'package:flutterdex/common/data/PokemonPage.dart';
import 'package:flutterdex/common/network/api/PokeApi.dart';
import 'package:flutterdex/common/network/data/NetworkResource.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class PokemonPageRepository {
  final PokeApi _pokeApi;

  PokemonPageRepository(this._pokeApi);

  Stream<NetworkResource<PokemonPage>> stream() => _page.stream;
  StreamController<NetworkResource<PokemonPage>> _page = StreamController();

  void getPage(int offset) async {
    _page.add(NetworkResource.loading());
    try {
      final response = await _pokeApi.getPokemonPage(offset);
      _page.add(NetworkResource(response));
    } on Exception catch (e) {
      _page.add(NetworkResource.error(e.toString()));
    }
  }

  @disposeMethod
  void dispose() {
    _page.close();
  }
}
