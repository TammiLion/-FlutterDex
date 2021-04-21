import 'package:flutterdex/common/data/PokeApiPage.dart';
import 'package:flutterdex/common/network/data/NetworkResource.dart';
import 'package:flutterdex/home/network/data/PokemonPage.dart';
import 'package:flutterdex/home/presentation/HomeState.dart';

class HomeModel {
  PokemonPage _page = PokemonPage();

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

  Stream<HomeState> onResponse(NetworkResource<PokeApiPage> response) async* {
    yield* response.when((data) => handleData(data),
        loading: () => handleLoading(),
        error: (errorMessage) => handleError(errorMessage));
  }

  Stream<HomeState> handleData(PokeApiPage data) async* {
    _page = _page.update(data);
    yield HomeState(
        list: ListViewData(_page.results), loading: null, error: null);
  }

  Stream<HomeState> handleLoading() async* {
    ListViewData? list = _hasListItems() ? ListViewData(_page.results) : null;
    yield HomeState(list: list, loading: InfoViewData(null), error: null);
  }

  Stream<HomeState> handleError(String? message) async* {
    ListViewData? list = _hasListItems() ? ListViewData(_page.results) : null;
    yield HomeState(list: list, loading: null, error: InfoViewData(null));
  }

  HomeState onClicked(int position) {
    print("clicked");
    return mapToHomeState();
  }

  HomeState mapToHomeState() {
    return HomeState(list: ListViewData([]), loading: null, error: null);
  }

  bool _hasListItems() {
    return _page.results.isNotEmpty;
  }

  HomeState mapToLoadingState() {
    if (_hasListItems()) {
      return mapToHomeState().copyWith(loading: new InfoViewData(null));
    } else {
      return HomeState(
          list: null, loading: new InfoViewData(null), error: null);
    }
  }
}
