import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

extension ObjectExt<T> on T {
  R let<R>(R Function(T that) op) => op(this);
}

extension ModularExtensionMaterial on PlatformApp {
  PlatformApp modular() {
    //initialRouteDeclaratedInMaterialApp = initialRoute ?? '/';

    final app = PlatformApp.router(
      key: key,
      //scaffoldMessengerKey: scaffoldMessengerKey,
      routeInformationProvider: routeInformationProvider,
      backButtonDispatcher: backButtonDispatcher,
      builder: builder,
      title: title,
      onGenerateTitle: onGenerateTitle,
      color: color,
      /*theme: theme,
      darkTheme: darkTheme,
      highContrastTheme: highContrastTheme,
      highContrastDarkTheme: highContrastDarkTheme,
      themeMode: themeMode,*/
      locale: locale,
      localizationsDelegates: localizationsDelegates,
      localeListResolutionCallback: localeListResolutionCallback,
      localeResolutionCallback: localeResolutionCallback,
      supportedLocales: supportedLocales,
      //debugShowMaterialGrid: debugShowMaterialGrid,
      showPerformanceOverlay: showPerformanceOverlay,
      checkerboardRasterCacheImages: checkerboardRasterCacheImages,
      checkerboardOffscreenLayers: checkerboardOffscreenLayers,
      showSemanticsDebugger: showSemanticsDebugger,
      debugShowCheckedModeBanner: debugShowCheckedModeBanner,
      shortcuts: shortcuts,
      actions: actions,
      restorationScopeId: restorationScopeId,
      /*routeInformationParser: _routeInformationParser,
      routerDelegate: _routerDelegate,*/
    );

    return app;
  }
}
