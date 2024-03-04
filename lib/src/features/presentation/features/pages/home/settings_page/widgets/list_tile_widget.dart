import 'package:flutter/material.dart';
import 'package:foodie_heaven/src/core/constants/colors.dart';
import 'package:foodie_heaven/src/core/constants/styles.dart';

Widget listTileWidget(String text, void Function()? func) {
  return ListTile(
    onTap: func,
    tileColor: AppColors().amber,
    title: Text(
      text,
      style: textStyleColor(AppColors().blackColors),
    ),
    trailing: Icon(
      Icons.arrow_forward,
      color: AppColors().blackColors,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(22),
    ),
  );
}
