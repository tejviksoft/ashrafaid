import 'package:auto_route/auto_route.dart';
import 'package:ashrafulaid/pages/donation/donationmain.dart';
import 'package:ashrafulaid/home_page.dart';
import 'package:ashrafulaid/pages/posts/posts_page.dart';

import 'package:ashrafulaid/pages/zakat/zakatmain.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(path: '/', page: HomePage, children: [
      AutoRoute(path: 'pages/posts', name: 'PostsRouter', page: PostsPage),
      AutoRoute(
          path: 'pages/zakat', name: 'ZakatMainRouter', page: ZakatMainPage),
      AutoRoute(
          path: 'pages/donation',
          name: 'DonationsRouter',
          page: DonationsMainPage),
    ]),
  ],
)
class $AppRouter {}

//run this in terminal
//flutter pub run build_runner build --delete-conflicting-outputs
