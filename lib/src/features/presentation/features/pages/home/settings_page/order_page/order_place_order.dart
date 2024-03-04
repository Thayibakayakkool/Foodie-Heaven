import 'package:flutter/material.dart';
import 'package:foodie_heaven/src/core/constants/colors.dart';
import 'package:foodie_heaven/src/core/constants/styles.dart';

Widget orderPlaceDetails({title1, title2, d1, image}) {
  return Container(
    decoration: BoxDecoration(
        border: Border.all(color: AppColors().amber),
        borderRadius: BorderRadius.circular(12)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(image),
            radius: 30,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                '${title1} ',
                style: regularTextStyle(FontWeight.bold, AppColors().amber, 16),
                textAlign: TextAlign.center,
              ),
              Text('(x${d1})', style: textStyle(AppColors().whiteColors, 18))
            ],
          ),
        ),
        Text(
          '₹ ' '${title2}',
          style: textStyle(AppColors().whiteColors, 17),
        )
      ],
    ),
  );
}
