import 'package:flutterdex/common/data/PokeApiPage.dart';
import 'package:flutterdex/common/network/api/PokeApi.dart';
import 'package:injectable/injectable.dart';

import 'PokemonPageDataSource.dart';

const defaultLimit = 20;

@Injectable(as: PokeApiPageDataSource)
@Named("network")
class PokemonPageNetworkDataSource extends PokeApiPageDataSource {
  final PokeApi _api;

  PokemonPageNetworkDataSource(this._api);

  @override
  Future<PokeApiPage?> getPage(int offset) async {
    return await _api.getPokemonPage(offset, defaultLimit);
  }

  @override
  void addPage(int offset, PokeApiPage page) {
    //do nothing
  }
}
