import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutterdex/common/di/injection.dart';
import 'package:flutterdex/common/util/extensions.dart';
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
        child: MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget modularApp = Platform.isAndroid
        ? _getMaterialApp(context)
        : _getCupertinoApp(context);

    return MultiBlocProvider(
        providers: [BlocProvider<HomeBloc>(create: (_) => getIt<HomeBloc>())],
        child: modularApp);
  }
}

Widget _getPlatformApp(BuildContext context) {
  return PlatformApp(
          initialRoute: "/pokemon",
          restorationScopeId: 'app',
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale)
      .modular();
}

//TODO make it work if possible
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
