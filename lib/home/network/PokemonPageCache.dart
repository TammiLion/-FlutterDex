import 'package:flutterdex/common/data/PokeApiPage.dart';
import 'package:flutterdex/home/network/PokemonPageDataSource.dart';
import 'package:injectable/injectable.dart';

@Named("local")
@Injectable(as: PokeApiPageDataSource)
class PokemonPageLocalDataSource extends PokeApiPageDataSource {
  Map<int, PokeApiPage> _map = {};

  @override
  void addPage(int offset, PokeApiPage page) {
    _map.putIfAbsent(offset, () => page);
  }

  @override
  Future<PokeApiPage?> getPage(int offset) async {
    return _map[offset];
  }
}
