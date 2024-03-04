import 'package:flutter/material.dart';
import 'package:foodie_heaven/src/core/constants/colors.dart';
import 'package:foodie_heaven/src/core/constants/styles.dart';
import 'package:pinput/pinput.dart';

Widget otpWidget() {
  return Pinput(
    length: 6,
    defaultPinTheme: PinTheme(
      width: 56,
      height: 60,
      textStyle: textStyle(
        AppColors().blackColors,
        22,
      ),
      decoration: BoxDecoration(
        color: AppColors().amber,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors().amber,
        ),
      ),
    ),
  );
}
