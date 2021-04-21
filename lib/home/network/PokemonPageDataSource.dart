
import 'package:flutterdex/common/data/PokeApiPage.dart';

abstract class PokeApiPageDataSource {
  Future<PokeApiPage?> getPage(int offset);

  void addPage(int offset, PokeApiPage page);
}
