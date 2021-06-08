import 'package:easy_localization/easy_localization.dart';
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
        child: MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider<HomeBloc>(create: (_) => getIt<HomeBloc>())],
        child: MaterialApp(
                initialRoute: '/pokemon',
                restorationScopeId: 'app',
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale)
            .modular());
  }
//TODO create modular extension for PlatformApp

}
