import 'package:flutter/material.dart';
import 'package:foodie_heaven/src/core/constants/colors.dart';
import 'package:foodie_heaven/src/core/constants/styles.dart';

Widget richTextWidget() {
  return RichText(
    text: TextSpan(
      children: [
        TextSpan(
          text: "Already have an Account? ",
          style: textStyle(
            AppColors().grey,
            16,
          ),
        ),
        TextSpan(
          text: "Log in",
          style: regularTextStyle(
            FontWeight.bold,
            AppColors().amber,
            18,
          ),
        ),
      ],
    ),
  );
}
