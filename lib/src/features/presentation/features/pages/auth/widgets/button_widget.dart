import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodie_heaven/src/core/constants/colors.dart';
import 'package:foodie_heaven/src/core/constants/styles.dart';

Widget buttonWidget(void Function()? func, String text) {
  return SizedBox(
    width: 300.w,
    height: 45.h,
    child: ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColors().amber),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      onPressed: func,
      child: Text(
        text,
        style: textStyle(
          AppColors().blackColors,
          16,
        ),
      ),
    ),
  );
}
