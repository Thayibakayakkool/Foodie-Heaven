import 'package:flutter/material.dart';
import 'package:foodie_heaven/src/core/constants/colors.dart';

AppBar appBarWidget(void Function()? func) {
  return AppBar(
    backgroundColor: AppColors().transparent,
    actions: [
      IconButton(
          onPressed: func,
          icon: Icon(
            Icons.favorite,
            color: AppColors().amber,
          ))
    ],
  );
}
