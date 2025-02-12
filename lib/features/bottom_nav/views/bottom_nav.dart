import 'package:chanllenging_order_app/core/app_strings/app_strings.dart';
import 'package:chanllenging_order_app/core/theming/app_colors.dart';
import 'package:chanllenging_order_app/core/widgets/app_text_form_field.dart';
import 'package:chanllenging_order_app/features/Home/views/home_view.dart';
import 'package:chanllenging_order_app/features/menu/views/menu_view.dart';
import 'package:chanllenging_order_app/features/wallet/views/wallet_view.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class BottomNavBarView extends StatefulWidget {
  const BottomNavBarView({super.key});

  @override
  State<BottomNavBarView> createState() => _BottomNavBarViewState();
}

class _BottomNavBarViewState extends State<BottomNavBarView> {
  int _selectedIndex = 0;
  TextEditingController nameController = TextEditingController();
  String? action;
  List<Widget> tabItems = [
    HomeView(),
    MenuView(),
    WalletView(),
  ];

  @override
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showAnimatedDialog();
    });
  }

  Future<void> addUser(
      {required String name, required int walletNumber}) async {
    final supabase = Supabase.instance.client;

    try {
      await supabase.from('users').insert({
        'name': name,
        'wallet_number': walletNumber,
      });

      print('✅ User added successfully!');
    } catch (e) {
      print('❌ Error adding user: $e');
    }
  }

  Future<void> _showAnimatedDialog() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return PopScope(
          canPop: false,
          child: GiffyDialog.image(
            scrollable: true,
            Image.network(
              "https://raw.githubusercontent.com/Shashank02051997/FancyGifDialog-Android/master/GIF's/gif14.gif",
              height: 200.h,
              fit: BoxFit.cover,
            ),
            title: Text(
              AppStrings.enterYourName,
              textAlign: TextAlign.center,
            ),
            content: AppTextFormField(
              hintText: AppStrings.enterYourName,
              controller: nameController,
            ),
            actions: [
              TextButton(
                onPressed: () async {
                  if (nameController.text.isNotEmpty) {
                    addUser(name: nameController.text, walletNumber: 0);
                    Navigator.pop(context, 'CANCEL');
                  }
                },
                child: const Text('Go Ahead'),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: tabItems[_selectedIndex],
      ),
      bottomNavigationBar: FlashyTabBar(
        // backgroundColor: AppColors.b,
        animationCurve: Curves.linear,
        selectedIndex: _selectedIndex,
        iconSize: 25,
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
            icon: Icon(Icons.restaurant_menu),
            title: Text('Orders'),
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
