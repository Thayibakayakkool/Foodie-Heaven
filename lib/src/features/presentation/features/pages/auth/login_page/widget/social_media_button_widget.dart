import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodie_heaven/src/core/constants/colors.dart';
import 'package:foodie_heaven/src/core/constants/string.dart';
import 'package:foodie_heaven/src/core/constants/styles.dart';


Widget socialMediaWidget(void Function()? func) {
  return SizedBox(
    width: 300.w,
    height: 50.h,
    child: GestureDetector(
      onTap: func,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              'https://cdn.pixabay.com/photo/2015/12/11/11/43/google-1088004_1280.png',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              AppStrings.signInWithGoogle,
              style: textStyle(
                AppColors().amber,
                14.sp,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
