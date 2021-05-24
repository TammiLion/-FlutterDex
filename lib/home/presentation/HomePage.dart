import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutterdex/common/routing/AppRouter.gr.dart';
import 'package:flutterdex/common/ui/CustomPlatformText.dart';
import 'package:flutterdex/common/util/extensions.dart';
import 'package:flutterdex/generated/locale_keys.g.dart';
import 'package:flutterdex/home/blocs/HomeBloc.dart';
import 'package:flutterdex/home/blocs/HomeEvent.dart';
import 'package:flutterdex/home/presentation/HomeState.dart';
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
    if (_scrollPosition.value == 0) {
      context.read<HomeBloc>().add(HomeEvent.endOfPage());
    } else {
      context
          .read<HomeBloc>()
          .add(HomeEvent.restoreState(_scrollPosition.value));
    }
  }

  void _setupScrollListener() {
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        _scrollPosition.value++;
        if (_scrollController.position.pixels == 0) {
          context.read<HomeBloc>().add(HomeEvent.startOfPage());
        } else {
          context.read<HomeBloc>().add(HomeEvent.endOfPage());
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
    final names = state.list?.names;

    state.detailPage?.let((it) {
      AutoRouter.of(context).push(DetailRoute(id: it.pokemon));
    });

    return names == null ? Container() : _buildList(names);
  }

  Widget _buildList(List<String> names) {
    return ListView.builder(
        controller: _scrollController,
        itemCount: names.length,
        itemBuilder: (BuildContext _context, int i) {
          return _buildRow(names[i], i);
        });
  }

  Widget _buildRow(String name, int pos) {
    return GestureDetector(
        onTap: () {
          context.read<HomeBloc>().add(HomeEvent(pos));
        },
        child: Container(
            key: UniqueKey(),
            color: getListItemColor(pos),
            padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: CustomPlatformText(
              name,
              capitalizeFirst: true,
              style: platformThemeData(context,
                  material: (data) =>
                      data.textTheme.headline4?.copyWith(color: Colors.black),
                  cupertino: (data) => data.textTheme.navLargeTitleTextStyle),
            )));
  }

  final List<Color> containerColors = [
    Colors.red,
    Colors.blue,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.green
  ];

  Color getListItemColor(int pos) {
    final pickedColor = pos % containerColors.length;
    return containerColors[pickedColor];
  }

  @override
  String? get restorationId => 'home_page';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_scrollPosition, 'scroll_position');
  }
}
