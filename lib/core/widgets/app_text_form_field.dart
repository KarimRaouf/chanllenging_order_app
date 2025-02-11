import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/app_colors.dart';
import '../theming/styles.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        // isDense: true, // is default padding for textformfield
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20.h,
          vertical: 18.w,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.mainBlue,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(16),

        ),
        enabledBorder:  OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.lighterGrey,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        hintStyle: AppTextStyles.font14LightGreyRegular,
      ),
    );
  }
}
