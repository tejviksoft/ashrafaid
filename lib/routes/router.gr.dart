// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../home_page.dart' as _i1;
import '../pages/donation/donationmain.dart' as _i4;
import '../pages/posts/posts_page.dart' as _i2;
import '../pages/zakat/zakatmain.dart' as _i3;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomePage());
    },
    PostsRouter.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.PostsPage());
    },
    ZakatMainRouter.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.ZakatMainPage());
    },
    DonationsRouter.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.DonationsMainPage());
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(HomeRoute.name, path: '/', children: [
          _i5.RouteConfig(PostsRouter.name,
              path: 'pages/posts', parent: HomeRoute.name),
          _i5.RouteConfig(ZakatMainRouter.name,
              path: 'pages/zakat', parent: HomeRoute.name),
          _i5.RouteConfig(DonationsRouter.name,
              path: 'pages/donation', parent: HomeRoute.name)
        ])
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
      : super(HomeRoute.name, path: '/', initialChildren: children);

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.PostsPage]
class PostsRouter extends _i5.PageRouteInfo<void> {
  const PostsRouter() : super(PostsRouter.name, path: 'pages/posts');

  static const String name = 'PostsRouter';
}

/// generated route for
/// [_i3.ZakatMainPage]
class ZakatMainRouter extends _i5.PageRouteInfo<void> {
  const ZakatMainRouter() : super(ZakatMainRouter.name, path: 'pages/zakat');

  static const String name = 'ZakatMainRouter';
}

/// generated route for
/// [_i4.DonationsMainPage]
class DonationsRouter extends _i5.PageRouteInfo<void> {
  const DonationsRouter() : super(DonationsRouter.name, path: 'pages/donation');

  static const String name = 'DonationsRouter';
}
