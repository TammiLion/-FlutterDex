import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterdex/modules/HomeModule.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/pokemon', module: HomeModule()),
  ];
}
