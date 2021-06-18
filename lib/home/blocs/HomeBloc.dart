import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterdex/generated/locale_keys.g.dart';
import 'package:flutterdex/home/blocs/HomeModel.dart';
import 'package:flutterdex/home/network/PokemonPageRepository.dart';
import 'package:flutterdex/home/presentation/uimodel/HomeState.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeBloc extends Cubit<HomeState> {
  final PokemonPageRepository _repo;
  final HomeModel _model = HomeModel();

  HomeBloc(this._repo) : super(HomeState.loading(LocaleKeys.loading));

  var _retry;

  void onStartOfPage() {
    _retry = handleStartOfPage;
    handleStartOfPage();
  }

  void onEndOfPage() {
    _retry = handleEndOfPage;
    handleEndOfPage();
  }

  void onRestore(int position) {
    _retry = handlePage(position);
    handlePage(position);
  }

  void onRetry() {
    _retry();
  }

  void handlePage(int position) {
    getResponseFromRepo(position);
  }

  void handleStartOfPage() {
    if (_model.canLoadPrevious()) {
      _model.setIsRequestForNextPage(false);
      getResponseFromRepo(_model.getPreviousOffset());
    }
  }

  void handleEndOfPage() {
    if (_model.canLoadNext()) {
      _model.setIsRequestForNextPage(true);
      getResponseFromRepo(_model.getNextOffset());
    }
  }

  void getResponseFromRepo(int offset) async {
    final stream = _repo.getPage(offset);
    await for (var value in stream) {
      emit(_model.onResponse(value));
    }
  }
}
