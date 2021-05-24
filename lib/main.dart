import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutterdex/common/di/injection.dart';
import 'package:flutterdex/common/routing/AppRouter.gr.dart';
import 'package:flutterdex/home/blocs/HomeBloc.dart';
import 'package:injectable/injectable.dart';

void main() async {
  configureDependencies(Environment.dev);
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en'), Locale('nl')],
        path: 'assets/translations',
        fallbackLocale: Locale('en'),
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider<HomeBloc>(create: (_) => getIt<HomeBloc>())],
        child: PlatformApp.router(
            restorationScopeId: 'app',
            routerDelegate: _router.delegate(navRestorationScopeId: 'app'),
            routeInformationParser: _router.defaultRouteParser(),
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale));
  }
}
