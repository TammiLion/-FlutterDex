import 'package:flutter/material.dart';
import 'package:flutterdex/common/di/injection.dart';
import 'package:flutterdex/home/blocs/HomeBloc.dart';
import 'package:flutterdex/home/blocs/HomeEvent.dart';
import 'package:flutterdex/home/presentation/HomeState.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _bloc = getIt<HomeBloc>();
  HomeState _homeState = HomeState();

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
    return Scaffold(
      appBar: AppBar(
        title: Text("FlutterDex"),
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
    return InkWell(
        key: UniqueKey(),
        child: ListTile(
          title: Text(name),
          onTap: () {
            _bloc.add(HomeEvent(pos));
          },
        ));
  }
}
