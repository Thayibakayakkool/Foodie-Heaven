import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodie_heaven/src/core/constants/colors.dart';
import 'package:foodie_heaven/src/core/constants/styles.dart';

Widget reusableTextWidget(String text) {
  return Text(
    text,
    style: regularTextStyle(
      FontWeight.bold,
      AppColors().amber,
      40.sp,
    ),
  );
}
