import 'package:flutter/material.dart';
import 'package:flutterdex/common/di/injection.dart';
import 'package:flutterdex/home/blocs/HomeBloc.dart';
import 'package:flutterdex/home/presentation/HomeState.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final cubit = getIt<HomeBloc>();
  HomeState _homeState = HomeState();

  @override
  void initState() {
    super.initState();
    cubit.stream.listen((event) {
      setState(() {
        _homeState = event;
      });
    });
    cubit.init();
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
    return _homeState.resource?.when((data) => _buildList(data),
            loading: () => Container(), error: (errorMessage) => Container()) ??
        Container();
  }

  Widget _buildList(List<String> names) {
    return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemBuilder: (BuildContext _context, int i) {
          if (i >= names.length) {
            cubit.scrolledToEnd();
          }
          return _buildRow(names[i]);
        });
  }

  Widget _buildRow(String name) {
    return ListTile(
      title: Text(name),
    );
  }
}
