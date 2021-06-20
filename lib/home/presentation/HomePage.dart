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
  final RestorableInt _scrollPosition =
      RestorableInt(20); //TODO it's on 20 now for testing

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _restoreState();
  }

  void _restoreState() {
    context.read<HomeBloc>().onRestore(_scrollPosition.value);
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
            onClickPokemon: (name) => _navigateToPokemonPage(name),
            onClickError: _retry),
        loading: (text) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [LoadingView(text: text)]),
        error: (text) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ErrorView(text: text, onClick: () => _retry())]));
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
