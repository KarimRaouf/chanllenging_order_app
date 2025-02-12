import 'package:chanllenging_order_app/features/home/views/widgets/coffee_image_and_username.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_strings/app_strings.dart';
import '../../../core/helper/spacing.dart';
import '../../../core/theming/styles.dart';
import '../../../core/widgets/dish_item_box.dart';
import '../../../generated/assets.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CoffeeImageAndUserName(),
            verticalSpace(32),
            Text(
              AppStrings.currentOrders,
              style: AppTextStyles.font24BlackBold,
            ),
            verticalSpace(16),
            Image.asset(Assets.imagesEmptyList),
            // DishItemBox(index: 0,)
          ],
        ),
      ),
    );
  }
}

