import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterdex/common/di/injection.dart';
import 'package:flutterdex/home/blocs/HomeBloc.dart';
import 'package:flutterdex/modules/AppModule.dart';
import 'package:injectable/injectable.dart';

void main() async {
  configureDependencies(Environment.dev);
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(ModularApp(
    module: AppModule(),
    child: EasyLocalization(
        supportedLocales: [Locale('en'), Locale('nl')],
        path: 'assets/translations',
        fallbackLocale: Locale('en'),
        child: FlutterDexApp()),
  ));
}

class FlutterDexApp extends StatelessWidget {
  final BlocProvider homeProvider =
      BlocProvider<HomeBloc>(create: (_) => getIt<HomeBloc>());

  @override
  Widget build(BuildContext context) {
    Widget modularApp = Platform.isAndroid
        ? _getMaterialApp(context)
        : _getCupertinoApp(context);

    return MultiBlocProvider(providers: [homeProvider], child: modularApp);
  }
}

Widget _getMaterialApp(BuildContext context) {
  return MaterialApp(
          initialRoute: "/pokemon",
          restorationScopeId: 'app',
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale)
      .modular();
}

Widget _getCupertinoApp(BuildContext context) {
  return CupertinoApp(
          initialRoute: "/pokemon",
          restorationScopeId: 'app',
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale)
      .modular();
}
