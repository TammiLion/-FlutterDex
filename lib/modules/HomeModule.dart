import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterdex/detail/DetailPage.dart';
import 'package:flutterdex/home/presentation/HomePage.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/pokemon', child: (_, args) => HomePage()),
    ChildRoute('/:id',
        child: (_, args) => DetailPage(id: args.params['id']))
  ];
}
