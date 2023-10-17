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
import 'package:auto_route/auto_route.dart' as _i17;
import 'package:flutter/material.dart' as _i18;

import '../models/Cart.dart' as _i20;
import '../pages/authentication/login/volunteer_login_view.dart' as _i8;
import '../pages/authentication/signup/volunteer_signup_view.dart' as _i9;
import '../pages/menu/welcome_view.dart' as _i1;
import '../pages/profile/my_profile_view.dart' as _i3;
import '../pages/profile/profile_view.dart' as _i2;
import '../pages/recipient/cart/cart_view.dart' as _i15;
import '../pages/recipient/cart/order_confirmation/order_confirmation_view.dart'
    as _i16;
import '../pages/recipient/explorer/explorer_view.dart' as _i14;
import '../pages/stats/my_stats_view.dart' as _i4;
import '../pages/stats/specified_stat_view/pieChartData.dart' as _i19;
import '../pages/stats/specified_stat_view/specified_stat_view.dart' as _i7;
import '../pages/tips/expanded_tip/expanded_tip_view.dart' as _i6;
import '../pages/tips/tips_view.dart' as _i5;
import '../pages/volunteer/my_profile/my_profile.dart' as _i10;
import '../pages/volunteer/my_tasks/complete_task/complete_task_view.dart'
    as _i13;
import '../pages/volunteer/my_tasks/my_tasks_view.dart' as _i12;
import '../pages/volunteer/notifications/my_notifications_view.dart' as _i11;

class AppRouter extends _i17.RootStackRouter {
  AppRouter([_i18.GlobalKey<_i18.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i17.PageFactory> pagesMap = {
    MenuRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.MenuView(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.ProfileView(),
      );
    },
    MyProfileRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.MyProfileView(),
      );
    },
    MyStatsRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.MyStatsView(),
      );
    },
    TipsRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.TipsView(),
      );
    },
    ExpandedTipRoute.name: (routeData) {
      final args = routeData.argsAs<ExpandedTipRouteArgs>();
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.ExpandedTipView(
          key: args.key,
          tipID: args.tipID,
        ),
      );
    },
    SpecifiedStatRoute.name: (routeData) {
      final args = routeData.argsAs<SpecifiedStatRouteArgs>();
      return _i17.MaterialPageX<dynamic>(
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
      final args = routeData.argsAs<VolunteerLoginRouteArgs>();
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i8.VolunteerLoginView(
          key: args.key,
          userType: args.userType,
        ),
      );
    },
    VolunteerSignUpRoute.name: (routeData) {
      final args = routeData.argsAs<VolunteerSignUpRouteArgs>();
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i9.VolunteerSignUpView(
          key: args.key,
          userType: args.userType,
        ),
      );
    },
    VolunteerProfileRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.VolunteerProfileView(),
      );
    },
    VolunteerNotificationsRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.VolunteerNotificationsView(),
      );
    },
    VolunteerTaskRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i12.VolunteerTaskView(),
      );
    },
    VolunteerCompleteTaskRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i13.VolunteerCompleteTaskView(),
      );
    },
    ExplorerRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i14.ExplorerView(),
      );
    },
    CartRoute.name: (routeData) {
      final args = routeData.argsAs<CartRouteArgs>();
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i15.CartView(cart: args.cart),
      );
    },
    OrderConfirmRoute.name: (routeData) {
      final args = routeData.argsAs<OrderConfirmRouteArgs>();
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i16.OrderConfirmView(
          key: args.key,
          orderNo: args.orderNo,
        ),
      );
    },
  };

  @override
  List<_i17.RouteConfig> get routes => [
        _i17.RouteConfig(
          MenuRoute.name,
          path: '/',
        ),
        _i17.RouteConfig(
          ProfileRoute.name,
          path: '/profile',
        ),
        _i17.RouteConfig(
          MyProfileRoute.name,
          path: '/myProfile',
        ),
        _i17.RouteConfig(
          MyStatsRoute.name,
          path: '/stats',
        ),
        _i17.RouteConfig(
          TipsRoute.name,
          path: '/tips',
        ),
        _i17.RouteConfig(
          ExpandedTipRoute.name,
          path: '/expandedTips',
        ),
        _i17.RouteConfig(
          SpecifiedStatRoute.name,
          path: '/specifiedStat',
        ),
        _i17.RouteConfig(
          VolunteerLoginRoute.name,
          path: '/volunteer-login-view',
        ),
        _i17.RouteConfig(
          VolunteerSignUpRoute.name,
          path: '/volunteer-sign-up-view',
        ),
        _i17.RouteConfig(
          VolunteerProfileRoute.name,
          path: '/volunteer-profile-view',
        ),
        _i17.RouteConfig(
          VolunteerNotificationsRoute.name,
          path: '/volunteer-notifications-view',
        ),
        _i17.RouteConfig(
          VolunteerTaskRoute.name,
          path: '/volunteer-task-view',
        ),
        _i17.RouteConfig(
          VolunteerCompleteTaskRoute.name,
          path: '/volunteer-complete-task-view',
        ),
        _i17.RouteConfig(
          ExplorerRoute.name,
          path: '/explorer-view',
        ),
        _i17.RouteConfig(
          CartRoute.name,
          path: '/cart-view',
        ),
        _i17.RouteConfig(
          OrderConfirmRoute.name,
          path: '/order-confirm-view',
        ),
      ];
}

/// generated route for
/// [_i1.MenuView]
class MenuRoute extends _i17.PageRouteInfo<void> {
  const MenuRoute()
      : super(
          MenuRoute.name,
          path: '/',
        );

  static const String name = 'MenuRoute';
}

/// generated route for
/// [_i2.ProfileView]
class ProfileRoute extends _i17.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: '/profile',
        );

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i3.MyProfileView]
class MyProfileRoute extends _i17.PageRouteInfo<void> {
  const MyProfileRoute()
      : super(
          MyProfileRoute.name,
          path: '/myProfile',
        );

  static const String name = 'MyProfileRoute';
}

/// generated route for
/// [_i4.MyStatsView]
class MyStatsRoute extends _i17.PageRouteInfo<void> {
  const MyStatsRoute()
      : super(
          MyStatsRoute.name,
          path: '/stats',
        );

  static const String name = 'MyStatsRoute';
}

/// generated route for
/// [_i5.TipsView]
class TipsRoute extends _i17.PageRouteInfo<void> {
  const TipsRoute()
      : super(
          TipsRoute.name,
          path: '/tips',
        );

  static const String name = 'TipsRoute';
}

/// generated route for
/// [_i6.ExpandedTipView]
class ExpandedTipRoute extends _i17.PageRouteInfo<ExpandedTipRouteArgs> {
  ExpandedTipRoute({
    _i18.Key? key,
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

  final _i18.Key? key;

  final int tipID;

  @override
  String toString() {
    return 'ExpandedTipRouteArgs{key: $key, tipID: $tipID}';
  }
}

/// generated route for
/// [_i7.SpecifiedStatView]
class SpecifiedStatRoute extends _i17.PageRouteInfo<SpecifiedStatRouteArgs> {
  SpecifiedStatRoute({
    _i18.Key? key,
    required String title,
    required List<_i19.PieChartListData> dataList,
    required String heroWord,
    _i18.Color? heroWordColor,
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

  final _i18.Key? key;

  final String title;

  final List<_i19.PieChartListData> dataList;

  final String heroWord;

  final _i18.Color? heroWordColor;

  @override
  String toString() {
    return 'SpecifiedStatRouteArgs{key: $key, title: $title, dataList: $dataList, heroWord: $heroWord, heroWordColor: $heroWordColor}';
  }
}

/// generated route for
/// [_i8.VolunteerLoginView]
class VolunteerLoginRoute extends _i17.PageRouteInfo<VolunteerLoginRouteArgs> {
  VolunteerLoginRoute({
    _i18.Key? key,
    required String userType,
  }) : super(
          VolunteerLoginRoute.name,
          path: '/volunteer-login-view',
          args: VolunteerLoginRouteArgs(
            key: key,
            userType: userType,
          ),
        );

  static const String name = 'VolunteerLoginRoute';
}

class VolunteerLoginRouteArgs {
  const VolunteerLoginRouteArgs({
    this.key,
    required this.userType,
  });

  final _i18.Key? key;

  final String userType;

  @override
  String toString() {
    return 'VolunteerLoginRouteArgs{key: $key, userType: $userType}';
  }
}

/// generated route for
/// [_i9.VolunteerSignUpView]
class VolunteerSignUpRoute
    extends _i17.PageRouteInfo<VolunteerSignUpRouteArgs> {
  VolunteerSignUpRoute({
    _i18.Key? key,
    required String userType,
  }) : super(
          VolunteerSignUpRoute.name,
          path: '/volunteer-sign-up-view',
          args: VolunteerSignUpRouteArgs(
            key: key,
            userType: userType,
          ),
        );

  static const String name = 'VolunteerSignUpRoute';
}

class VolunteerSignUpRouteArgs {
  const VolunteerSignUpRouteArgs({
    this.key,
    required this.userType,
  });

  final _i18.Key? key;

  final String userType;

  @override
  String toString() {
    return 'VolunteerSignUpRouteArgs{key: $key, userType: $userType}';
  }
}

/// generated route for
/// [_i10.VolunteerProfileView]
class VolunteerProfileRoute extends _i17.PageRouteInfo<void> {
  const VolunteerProfileRoute()
      : super(
          VolunteerProfileRoute.name,
          path: '/volunteer-profile-view',
        );

  static const String name = 'VolunteerProfileRoute';
}

/// generated route for
/// [_i11.VolunteerNotificationsView]
class VolunteerNotificationsRoute extends _i17.PageRouteInfo<void> {
  const VolunteerNotificationsRoute()
      : super(
          VolunteerNotificationsRoute.name,
          path: '/volunteer-notifications-view',
        );

  static const String name = 'VolunteerNotificationsRoute';
}

/// generated route for
/// [_i12.VolunteerTaskView]
class VolunteerTaskRoute extends _i17.PageRouteInfo<void> {
  const VolunteerTaskRoute()
      : super(
          VolunteerTaskRoute.name,
          path: '/volunteer-task-view',
        );

  static const String name = 'VolunteerTaskRoute';
}

/// generated route for
/// [_i13.VolunteerCompleteTaskView]
class VolunteerCompleteTaskRoute extends _i17.PageRouteInfo<void> {
  const VolunteerCompleteTaskRoute()
      : super(
          VolunteerCompleteTaskRoute.name,
          path: '/volunteer-complete-task-view',
        );

  static const String name = 'VolunteerCompleteTaskRoute';
}

/// generated route for
/// [_i14.ExplorerView]
class ExplorerRoute extends _i17.PageRouteInfo<void> {
  const ExplorerRoute()
      : super(
          ExplorerRoute.name,
          path: '/explorer-view',
        );

  static const String name = 'ExplorerRoute';
}

/// generated route for
/// [_i15.CartView]
class CartRoute extends _i17.PageRouteInfo<CartRouteArgs> {
  CartRoute({required _i20.Cart cart})
      : super(
          CartRoute.name,
          path: '/cart-view',
          args: CartRouteArgs(cart: cart),
        );

  static const String name = 'CartRoute';
}

class CartRouteArgs {
  const CartRouteArgs({required this.cart});

  final _i20.Cart cart;

  @override
  String toString() {
    return 'CartRouteArgs{cart: $cart}';
  }
}

/// generated route for
/// [_i16.OrderConfirmView]
class OrderConfirmRoute extends _i17.PageRouteInfo<OrderConfirmRouteArgs> {
  OrderConfirmRoute({
    _i18.Key? key,
    required String orderNo,
  }) : super(
          OrderConfirmRoute.name,
          path: '/order-confirm-view',
          args: OrderConfirmRouteArgs(
            key: key,
            orderNo: orderNo,
          ),
        );

  static const String name = 'OrderConfirmRoute';
}

class OrderConfirmRouteArgs {
  const OrderConfirmRouteArgs({
    this.key,
    required this.orderNo,
  });

  final _i18.Key? key;

  final String orderNo;

  @override
  String toString() {
    return 'OrderConfirmRouteArgs{key: $key, orderNo: $orderNo}';
  }
}
