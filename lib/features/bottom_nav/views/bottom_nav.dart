import 'package:chanllenging_order_app/core/theming/app_colors.dart';
import 'package:chanllenging_order_app/features/Home/views/home_view.dart';
import 'package:chanllenging_order_app/features/wallet/views/wallet_view.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';

class BottomNavBarView extends StatefulWidget {
  const BottomNavBarView({super.key});

  @override
  State<BottomNavBarView> createState() => _BottomNavBarViewState();
}

class _BottomNavBarViewState extends State<BottomNavBarView> {
  int _selectedIndex = 0;

  List<Widget> tabItems = [
    HomeView(),
    WalletView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: tabItems[_selectedIndex],
      ),
      bottomNavigationBar: FlashyTabBar(
        backgroundColor: AppColors.lighterGrey,
        animationCurve: Curves.linear,
        selectedIndex: _selectedIndex,
        iconSize: 30,
        showElevation: false,
        // use this to remove appBar's elevation
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
        }),
        items: [
          FlashyTabBarItem(
            icon: Icon(Icons.home_filled),
            title: Text('Home'),
          ),
          FlashyTabBarItem(
            icon: Icon(Icons.wallet),
            title: Text('Wallet'),
          ),
        ],
      ),
    );
  }
}
