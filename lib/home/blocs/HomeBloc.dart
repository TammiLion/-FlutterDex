import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterdex/home/blocs/HomeEvent.dart';
import 'package:flutterdex/home/blocs/HomeModel.dart';
import 'package:flutterdex/home/network/PokemonPageRepository.dart';
import 'package:flutterdex/home/presentation/HomeState.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final PokemonPageRepository _repo;
  final HomeModel _model = HomeModel();

  HomeBloc(this._repo) : super(HomeState());

  var retry;

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (retry != null) yield state;

    yield* event.when((position) async* {
      yield _model.onClicked(position);
    }, startOfPage: () async* {
      retry = handleStartOfPage();
      yield* handleStartOfPage();
    }, endOfPage: () async* {
      retry = handleEndOfPage();
      yield* handleEndOfPage();
    }, restoreState: (int position) async* {
      _model.restoreState(position);
      retry = handlePage(position);
      yield* handlePage(position);
    });
  }

  Stream<HomeState> handlePage(int position) async* {
    yield* getResponseFromRepo(position);
  }

  Stream<HomeState> handleStartOfPage() async* {
    if (_model.canLoadPrevious()) {
      _model.setIsRequestForNextPage(false);
      yield* getResponseFromRepo(_model.getPreviousOffset());
    }
  }

  Stream<HomeState> handleEndOfPage() async* {
    if (_model.canLoadNext()) {
      _model.setIsRequestForNextPage(true);
      yield* getResponseFromRepo(_model.getNextOffset());
    }
  }

  Stream<HomeState> getResponseFromRepo(int offset) async* {
    retry = null;
    final stream = _repo.getPage(offset);
    await for (var value in stream) {
      yield* _model.onResponse(value);
    }
  }

  void onRetryClicked() {
    retry();
  }
}
