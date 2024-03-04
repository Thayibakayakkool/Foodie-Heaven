import 'package:flutter/material.dart';
import 'package:foodie_heaven/src/core/constants/colors.dart';
import 'package:foodie_heaven/src/core/constants/styles.dart';

Widget textWidget(String text, double fontSize) {
  return Text(
    text,
    style: regularTextStyle(FontWeight.bold, AppColors().amber, fontSize),
  );
}
