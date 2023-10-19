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
import 'package:auto_route/auto_route.dart' as _i22;
import 'package:flutter/material.dart' as _i23;

import '../models/Cart.dart' as _i26;
import '../models/Food.dart' as _i27;
import '../pages/authentication/login/volunteer_login_view.dart' as _i8;
import '../pages/authentication/signup/volunteer_signup_view.dart' as _i9;
import '../pages/donor/add_food/add_food_view.dart' as _i18;
import '../pages/donor/food_items/food_items_view.dart' as _i17;
import '../pages/donor/update_food/update_food_view.dart' as _i19;
import '../pages/menu/welcome_view.dart' as _i1;
import '../pages/profile/my_profile_view.dart' as _i3;
import '../pages/profile/profile_view.dart' as _i2;
import '../pages/recipient/cart/cart_view.dart' as _i15;
import '../pages/recipient/cart/order_confirmation/order_confirmation_view.dart'
    as _i16;
import '../pages/recipient/explorer/explorer_view.dart' as _i14;
import '../pages/recipient/my_orders/my_orders_view.dart' as _i20;
import '../pages/stats/my_stats_view.dart' as _i4;
import '../pages/stats/specified_stat_view/pieChartData.dart' as _i25;
import '../pages/stats/specified_stat_view/specified_stat_view.dart' as _i7;
import '../pages/tips/expanded_tip/expanded_tip_view.dart' as _i6;
import '../pages/tips/tips_list.dart' as _i24;
import '../pages/tips/tips_view.dart' as _i5;
import '../pages/volunteer/my_profile/my_profile.dart' as _i10;
import '../pages/volunteer/my_tasks/complete_task/complete_task_view.dart'
    as _i13;
import '../pages/volunteer/my_tasks/my_tasks_view.dart' as _i12;
import '../pages/volunteer/notifications/my_notifications_view.dart' as _i11;
import '../pages/volunteer/rewards/rewards_view.dart' as _i21;

class AppRouter extends _i22.RootStackRouter {
  AppRouter([_i23.GlobalKey<_i23.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i22.PageFactory> pagesMap = {
    MenuRoute.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.MenuView(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.ProfileView(),
      );
    },
    MyProfileRoute.name: (routeData) {
      final args = routeData.argsAs<MyProfileRouteArgs>();
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.MyProfileView(
          key: args.key,
          userId: args.userId,
          name: args.name,
        ),
      );
    },
    MyStatsRoute.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.MyStatsView(),
      );
    },
    TipsRoute.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.TipsView(),
      );
    },
    ExpandedTipRoute.name: (routeData) {
      final args = routeData.argsAs<ExpandedTipRouteArgs>();
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.ExpandedTipView(
          key: args.key,
          tipID: args.tipID,
          tipItem: args.tipItem,
        ),
      );
    },
    SpecifiedStatRoute.name: (routeData) {
      final args = routeData.argsAs<SpecifiedStatRouteArgs>();
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.SpecifiedStatView(
          key: args.key,
          title: args.title,
          dataList: args.dataList,
          heroWord: args.heroWord,
          text: args.text,
          heroWordColor: args.heroWordColor,
          percentage: args.percentage,
        ),
      );
    },
    VolunteerLoginRoute.name: (routeData) {
      final args = routeData.argsAs<VolunteerLoginRouteArgs>();
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i8.VolunteerLoginView(
          key: args.key,
          userType: args.userType,
          showAnalytics: args.showAnalytics,
          labelUser: args.labelUser,
        ),
      );
    },
    VolunteerSignUpRoute.name: (routeData) {
      final args = routeData.argsAs<VolunteerSignUpRouteArgs>();
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i9.VolunteerSignUpView(
          key: args.key,
          userType: args.userType,
          labelUser: args.labelUser,
        ),
      );
    },
    VolunteerProfileRoute.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.VolunteerProfileView(),
      );
    },
    VolunteerNotificationsRoute.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.VolunteerNotificationsView(),
      );
    },
    VolunteerTaskRoute.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i12.VolunteerTaskView(),
      );
    },
    VolunteerCompleteTaskRoute.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i13.VolunteerCompleteTaskView(),
      );
    },
    ExplorerRoute.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i14.ExplorerView(),
      );
    },
    CartRoute.name: (routeData) {
      final args = routeData.argsAs<CartRouteArgs>();
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i15.CartView(cart: args.cart),
      );
    },
    OrderConfirmRoute.name: (routeData) {
      final args = routeData.argsAs<OrderConfirmRouteArgs>();
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i16.OrderConfirmView(
          key: args.key,
          orderNo: args.orderNo,
        ),
      );
    },
    DonorFoodListRoute.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i17.DonorFoodListView(),
      );
    },
    DonorAddFoodRoute.name: (routeData) {
      final args = routeData.argsAs<DonorAddFoodRouteArgs>(
          orElse: () => const DonorAddFoodRouteArgs());
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i18.DonorAddFoodView(key: args.key),
      );
    },
    DonorUpdateFoodRoute.name: (routeData) {
      final args = routeData.argsAs<DonorUpdateFoodRouteArgs>();
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i19.DonorUpdateFoodView(
          key: args.key,
          food: args.food,
        ),
      );
    },
    MyOrdersRoute.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i20.MyOrdersView(),
      );
    },
    VolunteerRewardRoute.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i21.VolunteerRewardView(),
      );
    },
  };

  @override
  List<_i22.RouteConfig> get routes => [
        _i22.RouteConfig(
          MenuRoute.name,
          path: '/',
        ),
        _i22.RouteConfig(
          ProfileRoute.name,
          path: '/profile',
        ),
        _i22.RouteConfig(
          MyProfileRoute.name,
          path: '/myProfile',
        ),
        _i22.RouteConfig(
          MyStatsRoute.name,
          path: '/stats',
        ),
        _i22.RouteConfig(
          TipsRoute.name,
          path: '/tips',
        ),
        _i22.RouteConfig(
          ExpandedTipRoute.name,
          path: '/expandedTips',
        ),
        _i22.RouteConfig(
          SpecifiedStatRoute.name,
          path: '/specifiedStat',
        ),
        _i22.RouteConfig(
          VolunteerLoginRoute.name,
          path: '/volunteer-login-view',
        ),
        _i22.RouteConfig(
          VolunteerSignUpRoute.name,
          path: '/volunteer-sign-up-view',
        ),
        _i22.RouteConfig(
          VolunteerProfileRoute.name,
          path: '/volunteer-profile-view',
        ),
        _i22.RouteConfig(
          VolunteerNotificationsRoute.name,
          path: '/volunteer-notifications-view',
        ),
        _i22.RouteConfig(
          VolunteerTaskRoute.name,
          path: '/volunteer-task-view',
        ),
        _i22.RouteConfig(
          VolunteerCompleteTaskRoute.name,
          path: '/volunteer-complete-task-view',
        ),
        _i22.RouteConfig(
          ExplorerRoute.name,
          path: '/explorer-view',
        ),
        _i22.RouteConfig(
          CartRoute.name,
          path: '/cart-view',
        ),
        _i22.RouteConfig(
          OrderConfirmRoute.name,
          path: '/order-confirm-view',
        ),
        _i22.RouteConfig(
          DonorFoodListRoute.name,
          path: '/donor-food-list-view',
        ),
        _i22.RouteConfig(
          DonorAddFoodRoute.name,
          path: '/donor-add-food-view',
        ),
        _i22.RouteConfig(
          DonorUpdateFoodRoute.name,
          path: '/donor-update-food-view',
        ),
        _i22.RouteConfig(
          MyOrdersRoute.name,
          path: '/my-orders-view',
        ),
        _i22.RouteConfig(
          VolunteerRewardRoute.name,
          path: '/volunteer-reward-view',
        ),
      ];
}

/// generated route for
/// [_i1.MenuView]
class MenuRoute extends _i22.PageRouteInfo<void> {
  const MenuRoute()
      : super(
          MenuRoute.name,
          path: '/',
        );

  static const String name = 'MenuRoute';
}

/// generated route for
/// [_i2.ProfileView]
class ProfileRoute extends _i22.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: '/profile',
        );

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i3.MyProfileView]
class MyProfileRoute extends _i22.PageRouteInfo<MyProfileRouteArgs> {
  MyProfileRoute({
    _i23.Key? key,
    required String userId,
    required String name,
  }) : super(
          MyProfileRoute.name,
          path: '/myProfile',
          args: MyProfileRouteArgs(
            key: key,
            userId: userId,
            name: name,
          ),
        );

  static const String name = 'MyProfileRoute';
}

class MyProfileRouteArgs {
  const MyProfileRouteArgs({
    this.key,
    required this.userId,
    required this.name,
  });

  final _i23.Key? key;

  final String userId;

  final String name;

  @override
  String toString() {
    return 'MyProfileRouteArgs{key: $key, userId: $userId, name: $name}';
  }
}

/// generated route for
/// [_i4.MyStatsView]
class MyStatsRoute extends _i22.PageRouteInfo<void> {
  const MyStatsRoute()
      : super(
          MyStatsRoute.name,
          path: '/stats',
        );

  static const String name = 'MyStatsRoute';
}

/// generated route for
/// [_i5.TipsView]
class TipsRoute extends _i22.PageRouteInfo<void> {
  const TipsRoute()
      : super(
          TipsRoute.name,
          path: '/tips',
        );

  static const String name = 'TipsRoute';
}

/// generated route for
/// [_i6.ExpandedTipView]
class ExpandedTipRoute extends _i22.PageRouteInfo<ExpandedTipRouteArgs> {
  ExpandedTipRoute({
    _i23.Key? key,
    required int tipID,
    required _i24.TipItem tipItem,
  }) : super(
          ExpandedTipRoute.name,
          path: '/expandedTips',
          args: ExpandedTipRouteArgs(
            key: key,
            tipID: tipID,
            tipItem: tipItem,
          ),
        );

  static const String name = 'ExpandedTipRoute';
}

class ExpandedTipRouteArgs {
  const ExpandedTipRouteArgs({
    this.key,
    required this.tipID,
    required this.tipItem,
  });

  final _i23.Key? key;

  final int tipID;

  final _i24.TipItem tipItem;

  @override
  String toString() {
    return 'ExpandedTipRouteArgs{key: $key, tipID: $tipID, tipItem: $tipItem}';
  }
}

/// generated route for
/// [_i7.SpecifiedStatView]
class SpecifiedStatRoute extends _i22.PageRouteInfo<SpecifiedStatRouteArgs> {
  SpecifiedStatRoute({
    _i23.Key? key,
    required String title,
    required List<_i25.PieChartListData> dataList,
    required String heroWord,
    required String text,
    _i23.Color? heroWordColor,
    required double percentage,
  }) : super(
          SpecifiedStatRoute.name,
          path: '/specifiedStat',
          args: SpecifiedStatRouteArgs(
            key: key,
            title: title,
            dataList: dataList,
            heroWord: heroWord,
            text: text,
            heroWordColor: heroWordColor,
            percentage: percentage,
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
    required this.text,
    this.heroWordColor,
    required this.percentage,
  });

  final _i23.Key? key;

  final String title;

  final List<_i25.PieChartListData> dataList;

  final String heroWord;

  final String text;

  final _i23.Color? heroWordColor;

  final double percentage;

  @override
  String toString() {
    return 'SpecifiedStatRouteArgs{key: $key, title: $title, dataList: $dataList, heroWord: $heroWord, text: $text, heroWordColor: $heroWordColor, percentage: $percentage}';
  }
}

/// generated route for
/// [_i8.VolunteerLoginView]
class VolunteerLoginRoute extends _i22.PageRouteInfo<VolunteerLoginRouteArgs> {
  VolunteerLoginRoute({
    _i23.Key? key,
    required String userType,
    bool? showAnalytics = false,
    required String labelUser,
  }) : super(
          VolunteerLoginRoute.name,
          path: '/volunteer-login-view',
          args: VolunteerLoginRouteArgs(
            key: key,
            userType: userType,
            showAnalytics: showAnalytics,
            labelUser: labelUser,
          ),
        );

  static const String name = 'VolunteerLoginRoute';
}

class VolunteerLoginRouteArgs {
  const VolunteerLoginRouteArgs({
    this.key,
    required this.userType,
    this.showAnalytics = false,
    required this.labelUser,
  });

  final _i23.Key? key;

  final String userType;

  final bool? showAnalytics;

  final String labelUser;

  @override
  String toString() {
    return 'VolunteerLoginRouteArgs{key: $key, userType: $userType, showAnalytics: $showAnalytics, labelUser: $labelUser}';
  }
}

/// generated route for
/// [_i9.VolunteerSignUpView]
class VolunteerSignUpRoute
    extends _i22.PageRouteInfo<VolunteerSignUpRouteArgs> {
  VolunteerSignUpRoute({
    _i23.Key? key,
    required String userType,
    required String labelUser,
  }) : super(
          VolunteerSignUpRoute.name,
          path: '/volunteer-sign-up-view',
          args: VolunteerSignUpRouteArgs(
            key: key,
            userType: userType,
            labelUser: labelUser,
          ),
        );

  static const String name = 'VolunteerSignUpRoute';
}

class VolunteerSignUpRouteArgs {
  const VolunteerSignUpRouteArgs({
    this.key,
    required this.userType,
    required this.labelUser,
  });

  final _i23.Key? key;

  final String userType;

  final String labelUser;

  @override
  String toString() {
    return 'VolunteerSignUpRouteArgs{key: $key, userType: $userType, labelUser: $labelUser}';
  }
}

/// generated route for
/// [_i10.VolunteerProfileView]
class VolunteerProfileRoute extends _i22.PageRouteInfo<void> {
  const VolunteerProfileRoute()
      : super(
          VolunteerProfileRoute.name,
          path: '/volunteer-profile-view',
        );

  static const String name = 'VolunteerProfileRoute';
}

/// generated route for
/// [_i11.VolunteerNotificationsView]
class VolunteerNotificationsRoute extends _i22.PageRouteInfo<void> {
  const VolunteerNotificationsRoute()
      : super(
          VolunteerNotificationsRoute.name,
          path: '/volunteer-notifications-view',
        );

  static const String name = 'VolunteerNotificationsRoute';
}

/// generated route for
/// [_i12.VolunteerTaskView]
class VolunteerTaskRoute extends _i22.PageRouteInfo<void> {
  const VolunteerTaskRoute()
      : super(
          VolunteerTaskRoute.name,
          path: '/volunteer-task-view',
        );

  static const String name = 'VolunteerTaskRoute';
}

/// generated route for
/// [_i13.VolunteerCompleteTaskView]
class VolunteerCompleteTaskRoute extends _i22.PageRouteInfo<void> {
  const VolunteerCompleteTaskRoute()
      : super(
          VolunteerCompleteTaskRoute.name,
          path: '/volunteer-complete-task-view',
        );

  static const String name = 'VolunteerCompleteTaskRoute';
}

/// generated route for
/// [_i14.ExplorerView]
class ExplorerRoute extends _i22.PageRouteInfo<void> {
  const ExplorerRoute()
      : super(
          ExplorerRoute.name,
          path: '/explorer-view',
        );

  static const String name = 'ExplorerRoute';
}

/// generated route for
/// [_i15.CartView]
class CartRoute extends _i22.PageRouteInfo<CartRouteArgs> {
  CartRoute({required _i26.Cart cart})
      : super(
          CartRoute.name,
          path: '/cart-view',
          args: CartRouteArgs(cart: cart),
        );

  static const String name = 'CartRoute';
}

class CartRouteArgs {
  const CartRouteArgs({required this.cart});

  final _i26.Cart cart;

  @override
  String toString() {
    return 'CartRouteArgs{cart: $cart}';
  }
}

/// generated route for
/// [_i16.OrderConfirmView]
class OrderConfirmRoute extends _i22.PageRouteInfo<OrderConfirmRouteArgs> {
  OrderConfirmRoute({
    _i23.Key? key,
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

  final _i23.Key? key;

  final String orderNo;

  @override
  String toString() {
    return 'OrderConfirmRouteArgs{key: $key, orderNo: $orderNo}';
  }
}

/// generated route for
/// [_i17.DonorFoodListView]
class DonorFoodListRoute extends _i22.PageRouteInfo<void> {
  const DonorFoodListRoute()
      : super(
          DonorFoodListRoute.name,
          path: '/donor-food-list-view',
        );

  static const String name = 'DonorFoodListRoute';
}

/// generated route for
/// [_i18.DonorAddFoodView]
class DonorAddFoodRoute extends _i22.PageRouteInfo<DonorAddFoodRouteArgs> {
  DonorAddFoodRoute({_i23.Key? key})
      : super(
          DonorAddFoodRoute.name,
          path: '/donor-add-food-view',
          args: DonorAddFoodRouteArgs(key: key),
        );

  static const String name = 'DonorAddFoodRoute';
}

class DonorAddFoodRouteArgs {
  const DonorAddFoodRouteArgs({this.key});

  final _i23.Key? key;

  @override
  String toString() {
    return 'DonorAddFoodRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i19.DonorUpdateFoodView]
class DonorUpdateFoodRoute
    extends _i22.PageRouteInfo<DonorUpdateFoodRouteArgs> {
  DonorUpdateFoodRoute({
    _i23.Key? key,
    required _i27.Food food,
  }) : super(
          DonorUpdateFoodRoute.name,
          path: '/donor-update-food-view',
          args: DonorUpdateFoodRouteArgs(
            key: key,
            food: food,
          ),
        );

  static const String name = 'DonorUpdateFoodRoute';
}

class DonorUpdateFoodRouteArgs {
  const DonorUpdateFoodRouteArgs({
    this.key,
    required this.food,
  });

  final _i23.Key? key;

  final _i27.Food food;

  @override
  String toString() {
    return 'DonorUpdateFoodRouteArgs{key: $key, food: $food}';
  }
}

/// generated route for
/// [_i20.MyOrdersView]
class MyOrdersRoute extends _i22.PageRouteInfo<void> {
  const MyOrdersRoute()
      : super(
          MyOrdersRoute.name,
          path: '/my-orders-view',
        );

  static const String name = 'MyOrdersRoute';
}

/// generated route for
/// [_i21.VolunteerRewardView]
class VolunteerRewardRoute extends _i22.PageRouteInfo<void> {
  const VolunteerRewardRoute()
      : super(
          VolunteerRewardRoute.name,
          path: '/volunteer-reward-view',
        );

  static const String name = 'VolunteerRewardRoute';
}
