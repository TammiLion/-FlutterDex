import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutterdex/common/ui/CustomPlatformText.dart';
import 'package:flutterdex/common/di/injection.dart';
import 'package:flutterdex/home/blocs/HomeBloc.dart';
import 'package:flutterdex/home/blocs/HomeEvent.dart';
import 'package:flutterdex/home/presentation/HomeState.dart';
import 'package:logger/logger.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _bloc = getIt<HomeBloc>();
  HomeState _homeState = HomeState();
  Logger log = Logger();


  @override
  void initState() {
    super.initState();
    _bloc.stream.listen((state) {
      setState(() {
        _homeState = state;
      });
    });
    _bloc.add(HomeEvent.endOfPage()); //trigger initial load
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: PlatformText("FlutterDex"),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    final list = _homeState.list?.names;

    if (list == null) {
      return Container();
    } else {
      return _buildList(list);
    }
  }

  Widget _buildList(List<String> names) {
    return ListView.builder(
        itemCount: names.length,
        itemBuilder: (BuildContext _context, int i) {
          /*if (i <= 0) {
            _bloc.add(HomeEvent.startOfPage());
          }*/
          if (i >= names.length - 1) {
            _bloc.add(HomeEvent.endOfPage());
          }
          return _buildRow(names[i], i);
        });
  }

  Widget _buildRow(String name, int pos) {
    log.v('name is $name');

    return GestureDetector(
        key: UniqueKey(),
        onTap: () {
          _bloc.add(HomeEvent(pos));
        },
        child: Container(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: CustomPlatformText(
              name,
              capitalizeFirst: true,
              style: platformThemeData(context,
                  material: (data) => data.textTheme.subtitle1?.copyWith(),
                  cupertino: (data) => data.textTheme.navLargeTitleTextStyle),
            )));
  }
}
