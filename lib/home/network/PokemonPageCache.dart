import 'package:flutterdex/common/data/PokeApiPage.dart';
import 'package:flutterdex/home/network/PokemonPageDataSource.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LocalDataSource)
class PokemonPageLocalDataSource extends LocalDataSource<PokeApiPage> {
  Map<int, PokeApiPage> _map = {};

  @override
  bool contains(int offset) {
    return _map.containsKey(offset);
  }

  @override
  void store(int offset, PokeApiPage page) {
    _map.putIfAbsent(offset, () => page);
  }

  @override
  Future<PokeApiPage> get(int offset) async {
    return _map[offset]!;
  }
}
