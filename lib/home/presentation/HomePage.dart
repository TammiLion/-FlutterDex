import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutterdex/common/ui/CustomPlatformText.dart';
import 'package:flutterdex/common/ui/ErrorView.dart';
import 'package:flutterdex/common/ui/LoadingView.dart';
import 'package:flutterdex/generated/locale_keys.g.dart';
import 'package:flutterdex/home/blocs/HomeBloc.dart';
import 'package:flutterdex/home/presentation/HomeList.dart';
import 'package:flutterdex/home/presentation/uimodel/HomeState.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with RestorationMixin {
  final RestorableInt _scrollPosition = RestorableInt(20);
  final ScrollController _scrollController = ScrollController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _restoreState();
    _setupScrollListener();
  }

  void _restoreState() {
    context.read<HomeBloc>().onRestore(_scrollPosition.value);
  }

  void _setupScrollListener() {
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        _scrollPosition.value++;
        if (_scrollController.position.pixels == 0) {
          context.read<HomeBloc>().onStartOfPage();
        } else {
          context.read<HomeBloc>().onEndOfPage();
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollPosition.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
        appBar: PlatformAppBar(
          title: CustomPlatformText(LocaleKeys.title.tr()),
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return _body(state);
          },
        ));
  }

  Widget _body(HomeState state) {
    return state.when(
        list: (list) => HomeList(
            list: list,
            scrollController: _scrollController,
            onClickPokemon: (name) => _navigateToPokemonPage(name),
            onClickError: _retry),
        loading: (text) => LoadingView(text: text),
        error: (text) => ErrorView(text: text, onClick: () => _retry()));
  }

  void _retry() {
    context.read<HomeBloc>().onRetry();
  }

  void _navigateToPokemonPage(String name) {
    Modular.to.pushNamed('/pokemon/$name');
  }

  @override
  String? get restorationId => 'home_page';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_scrollPosition, 'scroll_position');
  }
}
