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
  void onTransition(Transition<HomeEvent, HomeState> transition) {
    super.onTransition(transition);
    print("transition: $HomeEvent - $HomeState");
  }

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (state.loading != null)
      yield state; //feels like cheating but it works really well to not trigger extra network requests :p

    yield* event.when((position) async* {
      print("pos: $position");
      yield state; //TODO: make Nav HomeState
    }, startOfPage: () async* {
      yield* handleStartOfPage();
    }, endOfPage: () async* {
      yield* handleEndOfPage();
    });
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
    final stream = _repo.getPage(_model.getNextOffset());
    await for (var value in stream) {
      yield* _model.onResponse(value);
    }
  }
}
