import 'package:flutterdex/common/data/PokeApiPage.dart';
import 'package:flutterdex/common/data/Resource.dart';
import 'package:flutterdex/home/network/data/PokemonPage.dart';
import 'package:flutterdex/home/presentation/uimodel/HomeState.dart';
import 'package:flutterdex/home/presentation/uimodel/ListItem.dart';

//TODO needs complete rewrite

class HomeModel {
  PokemonPage _page = PokemonPage();

  bool _isRequestForNextPage = true;

  void restoreState(int offset) {
    _page = _page.copyWith(next: offset);
  }

  void setIsRequestForNextPage(bool isNextPage) {
    _isRequestForNextPage = isNextPage;
  }

  bool canLoadPrevious() {
    return _page.previous != null;
  }

  bool canLoadNext() {
    return _page.next != null;
  }

  int getPreviousOffset() {
    return _page.previous!;
  }

  int getNextOffset() {
    return _page.next!;
  }

  HomeState onResponse(Resource<PokeApiPage> response) {
    return response.when((data) => _handleData(data),
        loading: () => _handleLoading(),
        error: (errorMessage) => _handleError(errorMessage));
  }

  HomeState _handleData(PokeApiPage data) {
    _page = _page.update(data);
    return HomeState.list(_mapToListItems());
  }

  List<ListItem> _mapToListItems() {
    return _page.results.map((e) => ListItem.item(e)).toList();
  }

  HomeState _handleLoading() {
    if (_hasListItems()) {
      var list = _mapToListItems();
      list.insert(_isRequestForNextPage ? 0 : list.length, ListItem.loading());
      return HomeState.list(list);
    } else {
      return HomeState.loading();
    }
  }

  HomeState _handleError(String? message) {
    if (_hasListItems()) {
      var list = _mapToListItems();
      list.insert(_isRequestForNextPage ? 0 : list.length, ListItem.error());
      return HomeState.list(list);
    } else {
      return HomeState.error();
    }
  }

  /* TODO
  HomeState onClicked(String name) {
  }*/

  bool _hasListItems() {
    return _page.results.isNotEmpty;
  }
}
