import 'package:chanllenging_order_app/core/app_strings/app_strings.dart';
import 'package:chanllenging_order_app/core/helper/extentions.dart';
import 'package:chanllenging_order_app/core/helper/spacing.dart';
import 'package:chanllenging_order_app/core/routing/routes.dart';
import 'package:chanllenging_order_app/core/theming/app_colors.dart';
import 'package:chanllenging_order_app/core/theming/styles.dart';
import 'package:chanllenging_order_app/core/widgets/dish_item_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../generated/assets.dart';

class WalletView extends StatelessWidget {
  const WalletView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment:  MainAxisAlignment.start,
          children: [
            Text(
              AppStrings.wallet,
              style: AppTextStyles.font24BlackBold,
            ),
            verticalSpace(16),
            Expanded(child: Center(child: Text('158.5 \$',style: AppTextStyles.font60BlackBold,)))
          ],
        ),
      ),
    );
  }
}
