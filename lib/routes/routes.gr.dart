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
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;

import '../pages/menu/welcome_view.dart' as _i1;
import '../pages/profile/my_profile_view.dart' as _i3;
import '../pages/profile/profile_view.dart' as _i2;
import '../pages/stats/my_stats_view.dart' as _i4;
import '../pages/stats/specified_stat_view/pieChartData.dart' as _i12;
import '../pages/stats/specified_stat_view/specified_stat_view.dart' as _i7;
import '../pages/tips/expanded_tip/expanded_tip_view.dart' as _i6;
import '../pages/tips/tips_view.dart' as _i5;
import '../pages/volunteer/authentication/login/volunteer_login_view.dart'
    as _i8;
import '../pages/volunteer/authentication/signup/volunteer_signup_view.dart'
    as _i9;

class AppRouter extends _i10.RootStackRouter {
  AppRouter([_i11.GlobalKey<_i11.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    MenuRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.MenuView(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.ProfileView(),
      );
    },
    MyProfileRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.MyProfileView(),
      );
    },
    MyStatsRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.MyStatsView(),
      );
    },
    TipsRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.TipsView(),
      );
    },
    ExpandedTipRoute.name: (routeData) {
      final args = routeData.argsAs<ExpandedTipRouteArgs>();
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.ExpandedTipView(
          key: args.key,
          tipID: args.tipID,
        ),
      );
    },
    SpecifiedStatRoute.name: (routeData) {
      final args = routeData.argsAs<SpecifiedStatRouteArgs>();
      return _i10.MaterialPageX<dynamic>(
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
    VolunteerLoginRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.VolunteerLoginView(),
      );
    },
    VolunteerSignUpRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.VolunteerSignUpView(),
      );
    },
  };

  @override
  List<_i10.RouteConfig> get routes => [
        _i10.RouteConfig(
          MenuRoute.name,
          path: '/',
        ),
        _i10.RouteConfig(
          ProfileRoute.name,
          path: '/profile',
        ),
        _i10.RouteConfig(
          MyProfileRoute.name,
          path: '/myProfile',
        ),
        _i10.RouteConfig(
          MyStatsRoute.name,
          path: '/stats',
        ),
        _i10.RouteConfig(
          TipsRoute.name,
          path: '/tips',
        ),
        _i10.RouteConfig(
          ExpandedTipRoute.name,
          path: '/expandedTips',
        ),
        _i10.RouteConfig(
          SpecifiedStatRoute.name,
          path: '/specifiedStat',
        ),
        _i10.RouteConfig(
          VolunteerLoginRoute.name,
          path: '/volunteer-login-view',
        ),
        _i10.RouteConfig(
          VolunteerSignUpRoute.name,
          path: '/volunteer-sign-up-view',
        ),
      ];
}

/// generated route for
/// [_i1.MenuView]
class MenuRoute extends _i10.PageRouteInfo<void> {
  const MenuRoute()
      : super(
          MenuRoute.name,
          path: '/',
        );

  static const String name = 'MenuRoute';
}

/// generated route for
/// [_i2.ProfileView]
class ProfileRoute extends _i10.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: '/profile',
        );

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i3.MyProfileView]
class MyProfileRoute extends _i10.PageRouteInfo<void> {
  const MyProfileRoute()
      : super(
          MyProfileRoute.name,
          path: '/myProfile',
        );

  static const String name = 'MyProfileRoute';
}

/// generated route for
/// [_i4.MyStatsView]
class MyStatsRoute extends _i10.PageRouteInfo<void> {
  const MyStatsRoute()
      : super(
          MyStatsRoute.name,
          path: '/stats',
        );

  static const String name = 'MyStatsRoute';
}

/// generated route for
/// [_i5.TipsView]
class TipsRoute extends _i10.PageRouteInfo<void> {
  const TipsRoute()
      : super(
          TipsRoute.name,
          path: '/tips',
        );

  static const String name = 'TipsRoute';
}

/// generated route for
/// [_i6.ExpandedTipView]
class ExpandedTipRoute extends _i10.PageRouteInfo<ExpandedTipRouteArgs> {
  ExpandedTipRoute({
    _i11.Key? key,
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

  final _i11.Key? key;

  final int tipID;

  @override
  String toString() {
    return 'ExpandedTipRouteArgs{key: $key, tipID: $tipID}';
  }
}

/// generated route for
/// [_i7.SpecifiedStatView]
class SpecifiedStatRoute extends _i10.PageRouteInfo<SpecifiedStatRouteArgs> {
  SpecifiedStatRoute({
    _i11.Key? key,
    required String title,
    required List<_i12.PieChartListData> dataList,
    required String heroWord,
    _i11.Color? heroWordColor,
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

  final _i11.Key? key;

  final String title;

  final List<_i12.PieChartListData> dataList;

  final String heroWord;

  final _i11.Color? heroWordColor;

  @override
  String toString() {
    return 'SpecifiedStatRouteArgs{key: $key, title: $title, dataList: $dataList, heroWord: $heroWord, heroWordColor: $heroWordColor}';
  }
}

/// generated route for
/// [_i8.VolunteerLoginView]
class VolunteerLoginRoute extends _i10.PageRouteInfo<void> {
  const VolunteerLoginRoute()
      : super(
          VolunteerLoginRoute.name,
          path: '/volunteer-login-view',
        );

  static const String name = 'VolunteerLoginRoute';
}

/// generated route for
/// [_i9.VolunteerSignUpView]
class VolunteerSignUpRoute extends _i10.PageRouteInfo<void> {
  const VolunteerSignUpRoute()
      : super(
          VolunteerSignUpRoute.name,
          path: '/volunteer-sign-up-view',
        );

  static const String name = 'VolunteerSignUpRoute';
}
