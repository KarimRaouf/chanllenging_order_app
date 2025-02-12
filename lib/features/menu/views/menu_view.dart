import 'package:chanllenging_order_app/core/app_strings/app_strings.dart';
import 'package:chanllenging_order_app/core/helper/extentions.dart';
import 'package:chanllenging_order_app/core/helper/spacing.dart';
import 'package:chanllenging_order_app/core/routing/routes.dart';
import 'package:chanllenging_order_app/core/theming/app_colors.dart';
import 'package:chanllenging_order_app/core/theming/styles.dart';
import 'package:chanllenging_order_app/core/widgets/dish_item_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../generated/assets.dart';

class MenuView extends StatefulWidget {
  const MenuView({super.key});

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  final SupabaseClient supabase = Supabase.instance.client;

  Future<List<Map<String, dynamic>>> fetchMenu() async {
    final response = await supabase.from('orders').select();
    return response as List<Map<String, dynamic>>;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Orders',
              style: AppTextStyles.font24BlackBold,
            ),
            verticalSpace(16),
            FutureBuilder(
                future: fetchMenu(),
                builder: (context,
                    AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                  if (!snapshot.hasData) {
                    return Expanded(
                      child: Center(
                        child: LoadingAnimationWidget.fourRotatingDots(
                          color: AppColors.darkBeige,
                          size: 30,
                        ),
                      ),
                    );
                  }

                  final menuItems = snapshot.data!;
                  return Expanded(
                    child: ListView.builder(
                      itemCount: menuItems.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: DishItemBox(
                            isMenu: true,
                            index: index,
                            menuItems: menuItems,
                          ),
                        );
                      },
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
