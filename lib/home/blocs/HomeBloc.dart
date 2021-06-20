import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterdex/common/data/Resource.dart';
import 'package:flutterdex/home/blocs/HomeModel.dart';
import 'package:flutterdex/home/network/PokemonPageRepository.dart';
import 'package:flutterdex/home/presentation/uimodel/HomeState.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeBloc extends Cubit<HomeState> {
  final PokemonPageRepository _repo;
  final HomeModel _model = HomeModel();

  HomeBloc(this._repo) : super(HomeState.loading());

  var _retry;
  int _restorablePosition = 0;
  bool _isLoading = false;

  //TODO fix this logic
  bool _canQueueACall() {
    return !_isLoading;
  }

  void onStartOfPage() {
    if (_canQueueACall()) {
      _retry = _handleStartOfPage;
      _handleStartOfPage();
    }
  }

  void onEndOfPage() {
    if (_canQueueACall()) {
      _retry = _handleEndOfPage;
      _handleEndOfPage();
    }
  }

  void onRestore(int position) {
    _restorablePosition = position;
    _handleRestoration();
  }

  void onRetry() {
    _retry();
  }

  void _handleRestoration() {
    if (_canQueueACall()) {
      _retry = _handleRestoration;
      _handlePage(_restorablePosition);
    }
  }

  void _handlePage(int position) {
    _getResponseFromRepo(position);
  }

  void _handleStartOfPage() {
    if (_model.canLoadPrevious()) {
      _model.setIsRequestForNextPage(false);
      _getResponseFromRepo(_model.getPreviousOffset());
    }
  }

  void _handleEndOfPage() {
    if (_model.canLoadNext()) {
      _model.setIsRequestForNextPage(true);
      _getResponseFromRepo(_model.getNextOffset());
    }
  }

  void _getResponseFromRepo(int offset) async {
    _isLoading = true;
    _model.onResponse(Resource.loading());
    try {
      final response = await _repo.getPage(offset);
      _model.onResponse(Resource(response));
    } on Exception {
      _model.onResponse(Resource.error());
    }
  }
}
