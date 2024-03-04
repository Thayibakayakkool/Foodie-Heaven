import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodie_heaven/src/core/constants/colors.dart';
import 'package:foodie_heaven/src/core/constants/styles.dart';

Widget textFormFieldWidget(String labelText, String hintText, bool obscureText,
    TextEditingController controller,
    {prefix, Widget? suffix}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.w),
    child: TextFormField(
      obscureText: obscureText,
      controller: controller,
      style: textStyleColor(
        AppColors().amber,
      ),
      decoration: InputDecoration(
        prefixIcon: prefix,
        suffixIcon: suffix,
        labelText: labelText,
        labelStyle: textStyleColor(
          AppColors().amber,
        ),
        hintText: hintText,
        hintStyle: textStyleColor(
          AppColors().grey,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors().amber,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
  );
}
