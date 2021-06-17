import 'package:flutterdex/common/data/PokeApiPage.dart';
import 'package:flutterdex/common/network/data/NetworkResource.dart';
import 'package:flutterdex/home/network/data/PokemonPage.dart';
import 'package:flutterdex/home/presentation/HomeState.dart';

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
    yield mapToHomeState()
        .copyWith(loading: InfoViewData(null, _getPosition()));
  }

  Stream<HomeState> handleError(String? message) async* {
    yield mapToHomeState().copyWith(error: InfoViewData(null, _getPosition()));
  }

  Position _getPosition() {
    return _hasListItems()
        ? Position.center
        : _isRequestForNextPage
            ? Position.bottom
            : Position.top;
  }

  HomeState onClicked(String name) {
    return mapToHomeState()
        .copyWith(detailPage: DetailPageData(name));
  }

  HomeState mapToHomeState() {
    ListViewData? list = _hasListItems() ? ListViewData(_page.results) : null;
    return HomeState(list: list, loading: null, error: null);
  }

  bool _hasListItems() {
    return _page.results.isNotEmpty;
  }
}
