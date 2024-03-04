import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodie_heaven/src/core/constants/colors.dart';
import 'package:foodie_heaven/src/core/constants/string.dart';
import 'package:foodie_heaven/src/core/constants/styles.dart';


Widget forgotPasswordWidget() {
  return Text(
    AppStrings.forgotPassword,
    style: forgotTextStyle(
      AppColors().amber,
      14.sp,
      FontStyle.italic,
    ),
  );
}
