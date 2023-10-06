// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;

import '../pages/menu/welcome_view.dart' as _i1;
import '../pages/profile/my_profile_view.dart' as _i3;
import '../pages/profile/profile_view.dart' as _i2;
import '../pages/stats/my_stats_view.dart' as _i4;
import '../pages/stats/specified_stat_view/pieChartData.dart' as _i10;
import '../pages/stats/specified_stat_view/specified_stat_view.dart' as _i7;
import '../pages/tips/expanded_tip/expanded_tip_view.dart' as _i6;
import '../pages/tips/tips_view.dart' as _i5;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    MenuRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.MenuView(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.ProfileView(),
      );
    },
    MyProfileRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.MyProfileView(),
      );
    },
    MyStatsRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.MyStatsView(),
      );
    },
    TipsRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.TipsView(),
      );
    },
    ExpandedTipRoute.name: (routeData) {
      final args = routeData.argsAs<ExpandedTipRouteArgs>();
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.ExpandedTipView(
          key: args.key,
          tipID: args.tipID,
        ),
      );
    },
    SpecifiedStatRoute.name: (routeData) {
      final args = routeData.argsAs<SpecifiedStatRouteArgs>();
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.SpecifiedStatView(
          key: args.key,
          title: args.title,
          dataList: args.dataList,
          heroWord: args.heroWord,
          heroWordColor: args.heroWordColor,
        ),
      );
    },
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(
          MenuRoute.name,
          path: '/',
        ),
        _i8.RouteConfig(
          ProfileRoute.name,
          path: '/profile',
        ),
        _i8.RouteConfig(
          MyProfileRoute.name,
          path: '/myProfile',
        ),
        _i8.RouteConfig(
          MyStatsRoute.name,
          path: '/stats',
        ),
        _i8.RouteConfig(
          TipsRoute.name,
          path: '/tips',
        ),
        _i8.RouteConfig(
          ExpandedTipRoute.name,
          path: '/expandedTips',
        ),
        _i8.RouteConfig(
          SpecifiedStatRoute.name,
          path: '/specifiedStat',
        ),
      ];
}

/// generated route for
/// [_i1.MenuView]
class MenuRoute extends _i8.PageRouteInfo<void> {
  const MenuRoute()
      : super(
          MenuRoute.name,
          path: '/',
        );

  static const String name = 'MenuRoute';
}

/// generated route for
/// [_i2.ProfileView]
class ProfileRoute extends _i8.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: '/profile',
        );

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i3.MyProfileView]
class MyProfileRoute extends _i8.PageRouteInfo<void> {
  const MyProfileRoute()
      : super(
          MyProfileRoute.name,
          path: '/myProfile',
        );

  static const String name = 'MyProfileRoute';
}

/// generated route for
/// [_i4.MyStatsView]
class MyStatsRoute extends _i8.PageRouteInfo<void> {
  const MyStatsRoute()
      : super(
          MyStatsRoute.name,
          path: '/stats',
        );

  static const String name = 'MyStatsRoute';
}

/// generated route for
/// [_i5.TipsView]
class TipsRoute extends _i8.PageRouteInfo<void> {
  const TipsRoute()
      : super(
          TipsRoute.name,
          path: '/tips',
        );

  static const String name = 'TipsRoute';
}

/// generated route for
/// [_i6.ExpandedTipView]
class ExpandedTipRoute extends _i8.PageRouteInfo<ExpandedTipRouteArgs> {
  ExpandedTipRoute({
    _i9.Key? key,
    required int tipID,
  }) : super(
          ExpandedTipRoute.name,
          path: '/expandedTips',
          args: ExpandedTipRouteArgs(
            key: key,
            tipID: tipID,
          ),
        );

  static const String name = 'ExpandedTipRoute';
}

class ExpandedTipRouteArgs {
  const ExpandedTipRouteArgs({
    this.key,
    required this.tipID,
  });

  final _i9.Key? key;

  final int tipID;

  @override
  String toString() {
    return 'ExpandedTipRouteArgs{key: $key, tipID: $tipID}';
  }
}

/// generated route for
/// [_i7.SpecifiedStatView]
class SpecifiedStatRoute extends _i8.PageRouteInfo<SpecifiedStatRouteArgs> {
  SpecifiedStatRoute({
    _i9.Key? key,
    required String title,
    required List<_i10.PieChartListData> dataList,
    required String heroWord,
    _i9.Color? heroWordColor,
  }) : super(
          SpecifiedStatRoute.name,
          path: '/specifiedStat',
          args: SpecifiedStatRouteArgs(
            key: key,
            title: title,
            dataList: dataList,
            heroWord: heroWord,
            heroWordColor: heroWordColor,
          ),
        );

  static const String name = 'SpecifiedStatRoute';
}

class SpecifiedStatRouteArgs {
  const SpecifiedStatRouteArgs({
    this.key,
    required this.title,
    required this.dataList,
    required this.heroWord,
    this.heroWordColor,
  });

  final _i9.Key? key;

  final String title;

  final List<_i10.PieChartListData> dataList;

  final String heroWord;

  final _i9.Color? heroWordColor;

  @override
  String toString() {
    return 'SpecifiedStatRouteArgs{key: $key, title: $title, dataList: $dataList, heroWord: $heroWord, heroWordColor: $heroWordColor}';
  }
}
