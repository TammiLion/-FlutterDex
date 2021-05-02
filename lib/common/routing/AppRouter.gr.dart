// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutterdex/detail/DetailPage.dart' as _i3;
import 'package:flutterdex/home/presentation/HomePage.dart' as _i2;

class AppRouter extends _i1.RootStackRouter {
  AppRouter();

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    HomeRoute.name: (entry) {
      return _i1.AdaptivePage(entry: entry, child: _i2.HomePage());
    },
    DetailRoute.name: (entry) {
      var args = entry.routeData
          .argsAs<DetailRouteArgs>(orElse: () => DetailRouteArgs());
      return _i1.AdaptivePage(entry: entry, child: _i3.DetailPage(id: args.id));
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(HomeRoute.name, path: '/'),
        _i1.RouteConfig(DetailRoute.name, path: '/detail-page')
      ];
}

class HomeRoute extends _i1.PageRouteInfo {
  const HomeRoute() : super(name, path: '/');

  static const String name = 'HomeRoute';
}

class DetailRoute extends _i1.PageRouteInfo<DetailRouteArgs> {
  DetailRoute({String? id})
      : super(name, path: '/detail-page', args: DetailRouteArgs(id: id));

  static const String name = 'DetailRoute';
}

class DetailRouteArgs {
  const DetailRouteArgs({this.id});

  final String? id;
}
