import 'package:flutter/material.dart';
import 'package:foodie_heaven/src/core/constants/colors.dart';
import 'package:foodie_heaven/src/core/constants/styles.dart';

class CategoryWidget extends StatelessWidget {
  final String name;
  final String image;

  const CategoryWidget({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 140,
        child: Container(
          margin: const EdgeInsets.only(left: 20),
          child: Column(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(image),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  name,
                  style: textStyleColor(AppColors().amber),
                ),
              ),
            ],
          ),
        ));
  }
}
