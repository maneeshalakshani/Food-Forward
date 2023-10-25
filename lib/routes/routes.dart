import 'package:auto_route/auto_route.dart';
import 'package:food_forward/pages/donor/add_food/add_food_view.dart';
import 'package:food_forward/pages/donor/food_items/food_items_view.dart';
import 'package:food_forward/pages/donor/update_food/update_food_view.dart';
import 'package:food_forward/pages/menu/welcome_view.dart';
import 'package:food_forward/pages/profile/my_profile_view.dart';
import 'package:food_forward/pages/profile/profile_view.dart';
import 'package:food_forward/pages/recipient/cart/cart_view.dart';
import 'package:food_forward/pages/recipient/cart/order_confirmation/order_confirmation_view.dart';
import 'package:food_forward/pages/recipient/cart/payment_and_address/payment_and_address_view.dart';
import 'package:food_forward/pages/recipient/explorer/explorer_view.dart';
import 'package:food_forward/pages/recipient/my_orders/my_orders_view.dart';
import 'package:food_forward/pages/stats/my_stats_view.dart';
import 'package:food_forward/pages/stats/specified_stat_view/specified_stat_view.dart';
import 'package:food_forward/pages/tips/expanded_tip/expanded_tip_view.dart';
import 'package:food_forward/pages/tips/tips_view.dart';
import 'package:food_forward/pages/authentication/login/volunteer_login_view.dart';
import 'package:food_forward/pages/authentication/signup/volunteer_signup_view.dart';
import 'package:food_forward/pages/volunteer/my_profile/my_profile.dart';
import 'package:food_forward/pages/volunteer/my_tasks/complete_task/complete_task_view.dart';
import 'package:food_forward/pages/volunteer/my_tasks/my_tasks_view.dart';
import 'package:food_forward/pages/volunteer/notifications/my_notifications_view.dart';
import 'package:food_forward/pages/volunteer/rewards/rewards_view.dart';

/// Need to run the following command
///    flutter packages pub run build_runner watch --delete-conflicting-outputs

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: [
    MaterialRoute(page: MenuView, initial: true),
    MaterialRoute(page: ProfileView, path: '/profile'),
    MaterialRoute(page: MyProfileView, path: '/myProfile'),
    MaterialRoute(page: MyStatsView, path: '/stats'),
    MaterialRoute(page: TipsView, path: '/tips'),
    MaterialRoute(page: ExpandedTipView, path: '/expandedTips'),
    MaterialRoute(page: SpecifiedStatView, path: '/specifiedStat'),
    MaterialRoute(page: VolunteerLoginView),
    MaterialRoute(page: VolunteerSignUpView),
    MaterialRoute(page: VolunteerProfileView),
    MaterialRoute(page: VolunteerNotificationsView),
    MaterialRoute(page: VolunteerTaskView),
    MaterialRoute(page: VolunteerCompleteTaskView),
    MaterialRoute(page: ExplorerView),
    MaterialRoute(page: CartView),
    MaterialRoute(page: OrderConfirmView),
    MaterialRoute(page: DonorFoodListView),
    MaterialRoute(page: DonorAddFoodView),
    MaterialRoute(page: DonorUpdateFoodView),
    MaterialRoute(page: MyOrdersView),
    MaterialRoute(page: VolunteerRewardView),
    MaterialRoute(page: PaymentAddressView),
  ],
)
class $AppRouter {}
