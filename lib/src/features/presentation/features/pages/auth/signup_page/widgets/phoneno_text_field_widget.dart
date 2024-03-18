import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodie_heaven/src/core/constants/colors.dart';
import 'package:foodie_heaven/src/core/constants/constants.dart';
import 'package:foodie_heaven/src/core/constants/string.dart';
import 'package:foodie_heaven/src/core/constants/styles.dart';

Widget phoneNoTextFieldWidget(TextEditingController controller) {
  return Container(
    height: 50.h,
    decoration: BoxDecoration(
      border: Border.all(
        width: 1,
        color: AppColors().grey,
      ),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      children: [
        wSizedBox15,
        SizedBox(
          width: 40.w,
          child: Text(
            '+91',
            style: textStyle(
              AppColors().amber,
              18,
            ),
          ),
        ),
        Text(
          '|',
          style: textStyle(
            AppColors().grey,
            33,
          ),
        ),
        wSizedBox10,
        Expanded(
          child: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            style: textStyleColor(
              AppColors().amber,
            ),
            decoration: InputDecoration(

              border: InputBorder.none,
              hintText: 'Phone No',
              hintStyle: textStyleColor(
                AppColors().amber,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
