import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_strings/app_strings.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/assets.dart';

class CoffeeImageAndUserName extends StatelessWidget {
  const CoffeeImageAndUserName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          Assets.imagesCoffeeCup,
          width: 60.w,
          height: 60.h,
        ),
        horizontalSpace(16),
        Text(
          "${AppStrings.importingTasty}\n Karim AbdEl-Raouf",
          style: AppTextStyles.font24BlackBold,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
