import 'package:flutter/material.dart';
import 'package:foodie_heaven/src/core/constants/colors.dart';
import 'package:foodie_heaven/src/core/constants/styles.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/home/widgets/search_page/search_page.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        controller: searchController,
        style: textStyleColor(AppColors().amber),
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: AppColors().amber)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors().amber),
              borderRadius: BorderRadius.circular(30),
            ),
            suffixIcon: IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SearchPage(
                    title: searchController.text,
                  ),
                ));
              },
              icon: Icon(Icons.search, color: AppColors().amber),
            ),
            hintText: 'Search your food here...',
            hintStyle: fontStyleAndColor(AppColors().grey, FontStyle.italic)),
      ),
    );
  }
}
