import 'package:auto_route/auto_route.dart';
import 'package:food_forward/pages/menu/welcome_view.dart';
import 'package:food_forward/pages/profile/profile_view.dart';

/// Need to run the following command
///    flutter packages pub run build_runner watch --delete-conflicting-outputs

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: [
    MaterialRoute(page: MenuView, initial: true),
    MaterialRoute(page: ProfileView, path: '/profile'),
  ],
)
class $AppRouter {}
