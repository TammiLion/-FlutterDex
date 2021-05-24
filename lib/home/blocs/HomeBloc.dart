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

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (state.loading != null)
      yield state; //feels like cheating but it works really well to not trigger extra network requests :p

    yield* event.when((position) async* {
      yield _model.onClicked(position);
    }, startOfPage: () async* {
      yield* handleStartOfPage();
    }, endOfPage: () async* {
      yield* handleEndOfPage();
    }, restoreState: (int position) async* {
      _model.restoreState(position);
      yield* handlePage(position);
    });
  }

  Stream<HomeState> handlePage(int position) async* {
    yield* getResponseFromRepo(position);
  }

  Stream<HomeState> handleStartOfPage() async* {
    if (_model.canLoadPrevious()) {
      yield* getResponseFromRepo(_model.getPreviousOffset());
    }
  }

  Stream<HomeState> handleEndOfPage() async* {
    if (_model.canLoadNext()) {
      yield* getResponseFromRepo(_model.getNextOffset());
    }
  }

  Stream<HomeState> getResponseFromRepo(int offset) async* {
    final stream = _repo.getPage(offset);
    await for (var value in stream) {
      yield* _model.onResponse(value);
    }
  }
}
