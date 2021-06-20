import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutterdex/common/ui/ClickSupport.dart';
import 'package:flutterdex/common/ui/CustomPlatformText.dart';
import 'package:flutterdex/common/ui/ErrorView.dart';
import 'package:flutterdex/common/ui/LoadingView.dart';
import 'package:flutterdex/home/blocs/HomeBloc.dart';
import 'package:flutterdex/home/presentation/uimodel/ListItem.dart';

const List<Color> containerColors = [
  Colors.red,
  Colors.blue,
  Colors.yellow,
  Colors.orange,
  Colors.purple,
  Colors.green
];

class HomeList extends StatelessWidget {
  final List<ListItem> list;
  final Function(String name) onClickPokemon;
  final Function() onClickError;

  const HomeList(
      {Key? key,
        required this.list,
      required this.onClickPokemon,
      required this.onClickError});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext _context, int i) {
          return list[i].when(
              item: (text) {
                //TODO restorablePosition
                if (i == 0) {
                  context.read<HomeBloc>().onStartOfPage();
                } else if (i == list.length-1) {
                  context.read<HomeBloc>().onEndOfPage();
                }
                return _listItem(context, i, text);
              },
              loading: (text) => LoadingView(text: text),
              error: (text) =>
                  ErrorView(text: text, onClick: () => onClickError));
        });
  }

  Widget _listItem(BuildContext context, int pos, String name) {
    return ClickSupport(
        onClick: () {
          onClickPokemon(name);
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

  Color getListItemColor(int pos) {
    final pickedColor = pos % containerColors.length;
    return containerColors[pickedColor];
  }
}
