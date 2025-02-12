import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/app_colors.dart';
import '../theming/styles.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon, this.backgroundColor, this.controller,
  });

  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          isDense: true,
          // is default padding for textformfield
          contentPadding: contentPadding ??
              EdgeInsets.symmetric(
                horizontal: 20.h,
                vertical: 18.w,
              ),
          focusedBorder: focusedBorder ??
              OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.beige,
                  width: 1.3,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
          enabledBorder: enabledBorder ??
              OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.lighterGrey,
                  width: 1.3,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
          hintStyle: hintStyle ?? AppTextStyles.font14LightGreyRegular,
          hintText: hintText,
          suffixIcon: suffixIcon,
          fillColor: backgroundColor ?? AppColors.lightGrey,
          filled: true
      ),
      obscureText: isObscureText ?? false,
      style: AppTextStyles.font14BlackRegular,
    );
  }
}