import 'package:flutterdex/common/data/PokeApiPage.dart';

extension PokeApiPageMapper on PokeApiPage {
  List<String> mapToList() {
    final List<String> list = results
            ?.where((element) => element.isComplete())
            .map((e) => e.name!)
            .toList(growable: true) ??
        [];
    return list;
  }
}
