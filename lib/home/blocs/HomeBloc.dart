import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterdex/common/data/PokemonPage.dart';
import 'package:flutterdex/common/network/data/NamedApiResourceExtension.dart';
import 'package:flutterdex/common/network/data/NetworkResource.dart';
import 'package:flutterdex/home/network/PokemonPageRepository.dart';
import 'package:flutterdex/home/presentation/HomeState.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeBloc extends Cubit<HomeState> {
  final PokemonPageRepository _repo;
  NetworkResource<PokemonPage>? _lastResponse;
  int offset = 0;

  HomeBloc(this._repo) : super(HomeState()) {
    _repo.stream().listen((event) {
      offset += 20;
      emit(transform(event));
    });
  }

  void init() {
    _repo.getPage(offset);
  }

  void scrolledToEnd() {
    _repo.getPage(offset);
  }

  void scrolledToTop() {
    print("scrolledToTop");
  }

  void clickedPokemon(int position) {
    print("position: $position");
  }

  HomeState transform(NetworkResource<PokemonPage> resource) {
    return resource.when((data) => getHomeState(data),
        loading: () => HomeState(resource: NetworkResource.loading()),
        error: (errorMessage) =>
            HomeState(resource: NetworkResource.error(errorMessage)));
  }

  HomeState getHomeState(PokemonPage data) {
    List<String> list = data.results
            ?.where((element) => element.isComplete())
            .map((element) => element.name!)
            .toList(growable: false) ??
        [];
    return HomeState(resource: NetworkResource(list));
  }
}
