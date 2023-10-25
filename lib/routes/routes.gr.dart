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
import 'package:auto_route/auto_route.dart' as _i23;
import 'package:flutter/material.dart' as _i24;

import '../models/Cart.dart' as _i29;
import '../models/CartItem.dart' as _i31;
import '../models/Food.dart' as _i30;
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
import '../pages/recipient/cart/payment_and_address/payment_and_address_view.dart'
    as _i22;
import '../pages/recipient/explorer/explorer_view.dart' as _i14;
import '../pages/recipient/my_orders/my_orders_view.dart' as _i20;
import '../pages/stats/my_stats_view.dart' as _i4;
import '../pages/stats/specified_stat_view/pieChartData.dart' as _i27;
import '../pages/stats/specified_stat_view/specified_stat_view.dart' as _i7;
import '../pages/tips/expanded_tip/expanded_tip_view.dart' as _i6;
import '../pages/tips/tip_state.dart' as _i25;
import '../pages/tips/tips_list.dart' as _i26;
import '../pages/tips/tips_view.dart' as _i5;
import '../pages/volunteer/my_profile/my_profile.dart' as _i10;
import '../pages/volunteer/my_tasks/complete_task/complete_task_view.dart'
    as _i13;
import '../pages/volunteer/my_tasks/my_tasks_view.dart' as _i12;
import '../pages/volunteer/notifications/my_notifications_view.dart' as _i11;
import '../pages/volunteer/rewards/rewards_view.dart' as _i21;
import '../services/auth_state.dart' as _i28;

class AppRouter extends _i23.RootStackRouter {
  AppRouter([_i24.GlobalKey<_i24.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i23.PageFactory> pagesMap = {
    MenuRoute.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.MenuView(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.ProfileView(),
      );
    },
    MyProfileRoute.name: (routeData) {
      final args = routeData.argsAs<MyProfileRouteArgs>();
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.MyProfileView(
          key: args.key,
          userId: args.userId,
          name: args.name,
        ),
      );
    },
    MyStatsRoute.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.MyStatsView(),
      );
    },
    TipsRoute.name: (routeData) {
      final args = routeData.argsAs<TipsRouteArgs>();
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.TipsView(
          key: args.key,
          tipStore: args.tipStore,
        ),
      );
    },
    ExpandedTipRoute.name: (routeData) {
      final args = routeData.argsAs<ExpandedTipRouteArgs>();
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.ExpandedTipView(
          key: args.key,
          tipID: args.tipID,
          tipItem: args.tipItem,
          tipStore: args.tipStore,
        ),
      );
    },
    SpecifiedStatRoute.name: (routeData) {
      final args = routeData.argsAs<SpecifiedStatRouteArgs>();
      return _i23.MaterialPageX<dynamic>(
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
      return _i23.MaterialPageX<dynamic>(
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
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i9.VolunteerSignUpView(
          key: args.key,
          userType: args.userType,
          labelUser: args.labelUser,
        ),
      );
    },
    VolunteerProfileRoute.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.VolunteerProfileView(),
      );
    },
    VolunteerNotificationsRoute.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.VolunteerNotificationsView(),
      );
    },
    VolunteerTaskRoute.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i12.VolunteerTaskView(),
      );
    },
    VolunteerCompleteTaskRoute.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i13.VolunteerCompleteTaskView(),
      );
    },
    ExplorerRoute.name: (routeData) {
      final args = routeData.argsAs<ExplorerRouteArgs>();
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i14.ExplorerView(
          key: args.key,
          authStore: args.authStore,
        ),
      );
    },
    CartRoute.name: (routeData) {
      final args = routeData.argsAs<CartRouteArgs>();
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i15.CartView(
          cart: args.cart,
          authStore: args.authStore,
        ),
      );
    },
    OrderConfirmRoute.name: (routeData) {
      final args = routeData.argsAs<OrderConfirmRouteArgs>();
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i16.OrderConfirmView(
          key: args.key,
          orderNo: args.orderNo,
          authStore: args.authStore,
        ),
      );
    },
    DonorFoodListRoute.name: (routeData) {
      final args = routeData.argsAs<DonorFoodListRouteArgs>();
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i17.DonorFoodListView(
          key: args.key,
          authStore: args.authStore,
        ),
      );
    },
    DonorAddFoodRoute.name: (routeData) {
      final args = routeData.argsAs<DonorAddFoodRouteArgs>();
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i18.DonorAddFoodView(
          key: args.key,
          authStore: args.authStore,
        ),
      );
    },
    DonorUpdateFoodRoute.name: (routeData) {
      final args = routeData.argsAs<DonorUpdateFoodRouteArgs>();
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i19.DonorUpdateFoodView(
          key: args.key,
          food: args.food,
          authStore: args.authStore,
        ),
      );
    },
    MyOrdersRoute.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i20.MyOrdersView(),
      );
    },
    VolunteerRewardRoute.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i21.VolunteerRewardView(),
      );
    },
    PaymentAddressRoute.name: (routeData) {
      final args = routeData.argsAs<PaymentAddressRouteArgs>();
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i22.PaymentAddressView(
          key: args.key,
          authStore: args.authStore,
          cartItems: args.cartItems,
        ),
      );
    },
  };

  @override
  List<_i23.RouteConfig> get routes => [
        _i23.RouteConfig(
          MenuRoute.name,
          path: '/',
        ),
        _i23.RouteConfig(
          ProfileRoute.name,
          path: '/profile',
        ),
        _i23.RouteConfig(
          MyProfileRoute.name,
          path: '/myProfile',
        ),
        _i23.RouteConfig(
          MyStatsRoute.name,
          path: '/stats',
        ),
        _i23.RouteConfig(
          TipsRoute.name,
          path: '/tips',
        ),
        _i23.RouteConfig(
          ExpandedTipRoute.name,
          path: '/expandedTips',
        ),
        _i23.RouteConfig(
          SpecifiedStatRoute.name,
          path: '/specifiedStat',
        ),
        _i23.RouteConfig(
          VolunteerLoginRoute.name,
          path: '/volunteer-login-view',
        ),
        _i23.RouteConfig(
          VolunteerSignUpRoute.name,
          path: '/volunteer-sign-up-view',
        ),
        _i23.RouteConfig(
          VolunteerProfileRoute.name,
          path: '/volunteer-profile-view',
        ),
        _i23.RouteConfig(
          VolunteerNotificationsRoute.name,
          path: '/volunteer-notifications-view',
        ),
        _i23.RouteConfig(
          VolunteerTaskRoute.name,
          path: '/volunteer-task-view',
        ),
        _i23.RouteConfig(
          VolunteerCompleteTaskRoute.name,
          path: '/volunteer-complete-task-view',
        ),
        _i23.RouteConfig(
          ExplorerRoute.name,
          path: '/explorer-view',
        ),
        _i23.RouteConfig(
          CartRoute.name,
          path: '/cart-view',
        ),
        _i23.RouteConfig(
          OrderConfirmRoute.name,
          path: '/order-confirm-view',
        ),
        _i23.RouteConfig(
          DonorFoodListRoute.name,
          path: '/donor-food-list-view',
        ),
        _i23.RouteConfig(
          DonorAddFoodRoute.name,
          path: '/donor-add-food-view',
        ),
        _i23.RouteConfig(
          DonorUpdateFoodRoute.name,
          path: '/donor-update-food-view',
        ),
        _i23.RouteConfig(
          MyOrdersRoute.name,
          path: '/my-orders-view',
        ),
        _i23.RouteConfig(
          VolunteerRewardRoute.name,
          path: '/volunteer-reward-view',
        ),
        _i23.RouteConfig(
          PaymentAddressRoute.name,
          path: '/payment-address-view',
        ),
      ];
}

/// generated route for
/// [_i1.MenuView]
class MenuRoute extends _i23.PageRouteInfo<void> {
  const MenuRoute()
      : super(
          MenuRoute.name,
          path: '/',
        );

  static const String name = 'MenuRoute';
}

/// generated route for
/// [_i2.ProfileView]
class ProfileRoute extends _i23.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: '/profile',
        );

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i3.MyProfileView]
class MyProfileRoute extends _i23.PageRouteInfo<MyProfileRouteArgs> {
  MyProfileRoute({
    _i24.Key? key,
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

  final _i24.Key? key;

  final String userId;

  final String name;

  @override
  String toString() {
    return 'MyProfileRouteArgs{key: $key, userId: $userId, name: $name}';
  }
}

/// generated route for
/// [_i4.MyStatsView]
class MyStatsRoute extends _i23.PageRouteInfo<void> {
  const MyStatsRoute()
      : super(
          MyStatsRoute.name,
          path: '/stats',
        );

  static const String name = 'MyStatsRoute';
}

/// generated route for
/// [_i5.TipsView]
class TipsRoute extends _i23.PageRouteInfo<TipsRouteArgs> {
  TipsRoute({
    _i24.Key? key,
    required _i25.TipStore tipStore,
  }) : super(
          TipsRoute.name,
          path: '/tips',
          args: TipsRouteArgs(
            key: key,
            tipStore: tipStore,
          ),
        );

  static const String name = 'TipsRoute';
}

class TipsRouteArgs {
  const TipsRouteArgs({
    this.key,
    required this.tipStore,
  });

  final _i24.Key? key;

  final _i25.TipStore tipStore;

  @override
  String toString() {
    return 'TipsRouteArgs{key: $key, tipStore: $tipStore}';
  }
}

/// generated route for
/// [_i6.ExpandedTipView]
class ExpandedTipRoute extends _i23.PageRouteInfo<ExpandedTipRouteArgs> {
  ExpandedTipRoute({
    _i24.Key? key,
    required int tipID,
    required _i26.TipItem tipItem,
    required _i25.TipStore tipStore,
  }) : super(
          ExpandedTipRoute.name,
          path: '/expandedTips',
          args: ExpandedTipRouteArgs(
            key: key,
            tipID: tipID,
            tipItem: tipItem,
            tipStore: tipStore,
          ),
        );

  static const String name = 'ExpandedTipRoute';
}

class ExpandedTipRouteArgs {
  const ExpandedTipRouteArgs({
    this.key,
    required this.tipID,
    required this.tipItem,
    required this.tipStore,
  });

  final _i24.Key? key;

  final int tipID;

  final _i26.TipItem tipItem;

  final _i25.TipStore tipStore;

  @override
  String toString() {
    return 'ExpandedTipRouteArgs{key: $key, tipID: $tipID, tipItem: $tipItem, tipStore: $tipStore}';
  }
}

/// generated route for
/// [_i7.SpecifiedStatView]
class SpecifiedStatRoute extends _i23.PageRouteInfo<SpecifiedStatRouteArgs> {
  SpecifiedStatRoute({
    _i24.Key? key,
    required String title,
    required List<_i27.PieChartListData> dataList,
    required String heroWord,
    required String text,
    _i24.Color? heroWordColor,
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

  final _i24.Key? key;

  final String title;

  final List<_i27.PieChartListData> dataList;

  final String heroWord;

  final String text;

  final _i24.Color? heroWordColor;

  final double percentage;

  @override
  String toString() {
    return 'SpecifiedStatRouteArgs{key: $key, title: $title, dataList: $dataList, heroWord: $heroWord, text: $text, heroWordColor: $heroWordColor, percentage: $percentage}';
  }
}

/// generated route for
/// [_i8.VolunteerLoginView]
class VolunteerLoginRoute extends _i23.PageRouteInfo<VolunteerLoginRouteArgs> {
  VolunteerLoginRoute({
    _i24.Key? key,
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

  final _i24.Key? key;

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
    extends _i23.PageRouteInfo<VolunteerSignUpRouteArgs> {
  VolunteerSignUpRoute({
    _i24.Key? key,
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

  final _i24.Key? key;

  final String userType;

  final String labelUser;

  @override
  String toString() {
    return 'VolunteerSignUpRouteArgs{key: $key, userType: $userType, labelUser: $labelUser}';
  }
}

/// generated route for
/// [_i10.VolunteerProfileView]
class VolunteerProfileRoute extends _i23.PageRouteInfo<void> {
  const VolunteerProfileRoute()
      : super(
          VolunteerProfileRoute.name,
          path: '/volunteer-profile-view',
        );

  static const String name = 'VolunteerProfileRoute';
}

/// generated route for
/// [_i11.VolunteerNotificationsView]
class VolunteerNotificationsRoute extends _i23.PageRouteInfo<void> {
  const VolunteerNotificationsRoute()
      : super(
          VolunteerNotificationsRoute.name,
          path: '/volunteer-notifications-view',
        );

  static const String name = 'VolunteerNotificationsRoute';
}

/// generated route for
/// [_i12.VolunteerTaskView]
class VolunteerTaskRoute extends _i23.PageRouteInfo<void> {
  const VolunteerTaskRoute()
      : super(
          VolunteerTaskRoute.name,
          path: '/volunteer-task-view',
        );

  static const String name = 'VolunteerTaskRoute';
}

/// generated route for
/// [_i13.VolunteerCompleteTaskView]
class VolunteerCompleteTaskRoute extends _i23.PageRouteInfo<void> {
  const VolunteerCompleteTaskRoute()
      : super(
          VolunteerCompleteTaskRoute.name,
          path: '/volunteer-complete-task-view',
        );

  static const String name = 'VolunteerCompleteTaskRoute';
}

/// generated route for
/// [_i14.ExplorerView]
class ExplorerRoute extends _i23.PageRouteInfo<ExplorerRouteArgs> {
  ExplorerRoute({
    _i24.Key? key,
    required _i28.AuthStore authStore,
  }) : super(
          ExplorerRoute.name,
          path: '/explorer-view',
          args: ExplorerRouteArgs(
            key: key,
            authStore: authStore,
          ),
        );

  static const String name = 'ExplorerRoute';
}

class ExplorerRouteArgs {
  const ExplorerRouteArgs({
    this.key,
    required this.authStore,
  });

  final _i24.Key? key;

  final _i28.AuthStore authStore;

  @override
  String toString() {
    return 'ExplorerRouteArgs{key: $key, authStore: $authStore}';
  }
}

/// generated route for
/// [_i15.CartView]
class CartRoute extends _i23.PageRouteInfo<CartRouteArgs> {
  CartRoute({
    required _i29.Cart cart,
    required _i28.AuthStore authStore,
  }) : super(
          CartRoute.name,
          path: '/cart-view',
          args: CartRouteArgs(
            cart: cart,
            authStore: authStore,
          ),
        );

  static const String name = 'CartRoute';
}

class CartRouteArgs {
  const CartRouteArgs({
    required this.cart,
    required this.authStore,
  });

  final _i29.Cart cart;

  final _i28.AuthStore authStore;

  @override
  String toString() {
    return 'CartRouteArgs{cart: $cart, authStore: $authStore}';
  }
}

/// generated route for
/// [_i16.OrderConfirmView]
class OrderConfirmRoute extends _i23.PageRouteInfo<OrderConfirmRouteArgs> {
  OrderConfirmRoute({
    _i24.Key? key,
    required String orderNo,
    required _i28.AuthStore authStore,
  }) : super(
          OrderConfirmRoute.name,
          path: '/order-confirm-view',
          args: OrderConfirmRouteArgs(
            key: key,
            orderNo: orderNo,
            authStore: authStore,
          ),
        );

  static const String name = 'OrderConfirmRoute';
}

class OrderConfirmRouteArgs {
  const OrderConfirmRouteArgs({
    this.key,
    required this.orderNo,
    required this.authStore,
  });

  final _i24.Key? key;

  final String orderNo;

  final _i28.AuthStore authStore;

  @override
  String toString() {
    return 'OrderConfirmRouteArgs{key: $key, orderNo: $orderNo, authStore: $authStore}';
  }
}

/// generated route for
/// [_i17.DonorFoodListView]
class DonorFoodListRoute extends _i23.PageRouteInfo<DonorFoodListRouteArgs> {
  DonorFoodListRoute({
    _i24.Key? key,
    required _i28.AuthStore authStore,
  }) : super(
          DonorFoodListRoute.name,
          path: '/donor-food-list-view',
          args: DonorFoodListRouteArgs(
            key: key,
            authStore: authStore,
          ),
        );

  static const String name = 'DonorFoodListRoute';
}

class DonorFoodListRouteArgs {
  const DonorFoodListRouteArgs({
    this.key,
    required this.authStore,
  });

  final _i24.Key? key;

  final _i28.AuthStore authStore;

  @override
  String toString() {
    return 'DonorFoodListRouteArgs{key: $key, authStore: $authStore}';
  }
}

/// generated route for
/// [_i18.DonorAddFoodView]
class DonorAddFoodRoute extends _i23.PageRouteInfo<DonorAddFoodRouteArgs> {
  DonorAddFoodRoute({
    _i24.Key? key,
    required _i28.AuthStore authStore,
  }) : super(
          DonorAddFoodRoute.name,
          path: '/donor-add-food-view',
          args: DonorAddFoodRouteArgs(
            key: key,
            authStore: authStore,
          ),
        );

  static const String name = 'DonorAddFoodRoute';
}

class DonorAddFoodRouteArgs {
  const DonorAddFoodRouteArgs({
    this.key,
    required this.authStore,
  });

  final _i24.Key? key;

  final _i28.AuthStore authStore;

  @override
  String toString() {
    return 'DonorAddFoodRouteArgs{key: $key, authStore: $authStore}';
  }
}

/// generated route for
/// [_i19.DonorUpdateFoodView]
class DonorUpdateFoodRoute
    extends _i23.PageRouteInfo<DonorUpdateFoodRouteArgs> {
  DonorUpdateFoodRoute({
    _i24.Key? key,
    required _i30.Food food,
    required _i28.AuthStore authStore,
  }) : super(
          DonorUpdateFoodRoute.name,
          path: '/donor-update-food-view',
          args: DonorUpdateFoodRouteArgs(
            key: key,
            food: food,
            authStore: authStore,
          ),
        );

  static const String name = 'DonorUpdateFoodRoute';
}

class DonorUpdateFoodRouteArgs {
  const DonorUpdateFoodRouteArgs({
    this.key,
    required this.food,
    required this.authStore,
  });

  final _i24.Key? key;

  final _i30.Food food;

  final _i28.AuthStore authStore;

  @override
  String toString() {
    return 'DonorUpdateFoodRouteArgs{key: $key, food: $food, authStore: $authStore}';
  }
}

/// generated route for
/// [_i20.MyOrdersView]
class MyOrdersRoute extends _i23.PageRouteInfo<void> {
  const MyOrdersRoute()
      : super(
          MyOrdersRoute.name,
          path: '/my-orders-view',
        );

  static const String name = 'MyOrdersRoute';
}

/// generated route for
/// [_i21.VolunteerRewardView]
class VolunteerRewardRoute extends _i23.PageRouteInfo<void> {
  const VolunteerRewardRoute()
      : super(
          VolunteerRewardRoute.name,
          path: '/volunteer-reward-view',
        );

  static const String name = 'VolunteerRewardRoute';
}

/// generated route for
/// [_i22.PaymentAddressView]
class PaymentAddressRoute extends _i23.PageRouteInfo<PaymentAddressRouteArgs> {
  PaymentAddressRoute({
    _i24.Key? key,
    required _i28.AuthStore authStore,
    required List<_i31.CartItem> cartItems,
  }) : super(
          PaymentAddressRoute.name,
          path: '/payment-address-view',
          args: PaymentAddressRouteArgs(
            key: key,
            authStore: authStore,
            cartItems: cartItems,
          ),
        );

  static const String name = 'PaymentAddressRoute';
}

class PaymentAddressRouteArgs {
  const PaymentAddressRouteArgs({
    this.key,
    required this.authStore,
    required this.cartItems,
  });

  final _i24.Key? key;

  final _i28.AuthStore authStore;

  final List<_i31.CartItem> cartItems;

  @override
  String toString() {
    return 'PaymentAddressRouteArgs{key: $key, authStore: $authStore, cartItems: $cartItems}';
  }
}
