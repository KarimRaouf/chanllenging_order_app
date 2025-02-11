import 'package:chanllenging_order_app/core/routing/routes.dart';
import 'package:chanllenging_order_app/features/bottom_nav/views/bottom_nav.dart';
import 'package:chanllenging_order_app/features/wallet/views/wallet_view.dart';
import 'package:flutter/material.dart';

import '../../features/Home/views/home_view.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    // this arguments to be passed in any screen like this (arguments as ClassName)
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case Routes.bottomNavScreen:
        return MaterialPageRoute(builder: (_) => const BottomNavBarView());
      case Routes.walletScreen:
        return MaterialPageRoute(builder: (_) => const WalletView());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
