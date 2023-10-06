import 'package:auto_route/auto_route.dart';
import 'package:food_forward/pages/menu/welcome_view.dart';
import 'package:food_forward/pages/profile/my_profile_view.dart';
import 'package:food_forward/pages/profile/profile_view.dart';
import 'package:food_forward/pages/stats/my_stats_view.dart';
import 'package:food_forward/pages/stats/specified_stat_view/specified_stat_view.dart';
import 'package:food_forward/pages/tips/expanded_tip/expanded_tip_view.dart';
import 'package:food_forward/pages/tips/tips_view.dart';

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
  ],
)
class $AppRouter {}
