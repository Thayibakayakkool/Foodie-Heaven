import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodie_heaven/src/core/constants/colors.dart';
import 'package:foodie_heaven/src/core/constants/constants.dart';
import 'package:foodie_heaven/src/core/constants/styles.dart';
import 'package:foodie_heaven/src/core/utils/utils.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/bloc/categories/categories_bloc.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/bloc/wishlist/wishlist_bloc.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/home/cart_page/cart_page.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/home/categories_page/product_details_page/product_details_page.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/home/settings_page/wishlist_page/wishlist_page.dart';

class CategoriesPage extends StatelessWidget {
  final String text;

  const CategoriesPage({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    AppColors appColors = AppColors();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(
              text,
              style: regularTextStyle(FontWeight.bold, appColors.amber, 30),
            ),
          ),
          backgroundColor: appColors.transparent,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: appColors.amber,
              )),
          actions: [
            IconButton(
                onPressed: () {
                  BlocProvider.of<WishlistBloc>(context)
                      .add(GetWishlistDataEvent());
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const WishlistPage(),
                  ));
                },
                icon: Icon(
                  Icons.favorite,
                  color: appColors.amber,
                )),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CartPage(),
                      ));
                },
                icon: Icon(
                  Icons.shopping_cart,
                  color: appColors.amber,
                )),
          ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.only(left: 8, top: 30, right: 8),
            child: BlocBuilder<CategoriesBloc, CategoriesState>(
              builder: (context, state) {
                if (state is CategoriesLoading) {
                  return Utils().loadingWidget();
                } else if (state is CategoriesError) {
                  return Utils().showSnackBar(
                      context: context, content: state.errorMessage);
                } else if (state is CategoriesLoaded) {
                  return GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 18,
                              crossAxisSpacing: 12,
                              mainAxisExtent: 265),
                      itemCount: state.categories.length,
                      itemBuilder: (context, index) {
                        var data = state.categories[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProductDetailsPage(
                                image: data.image,
                                desc: data.desc,
                                rating: data.rating,
                                calories: data.calories,
                                time: data.time,
                                price: data.price,
                                name: data.name,
                                id: data.id,
                              ),
                            ));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.amber)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 65,
                                  backgroundImage: NetworkImage(data.image),
                                ),
                                kSizedBox5,
                                Text(
                                  data.name,
                                  style: regularTextStyle(
                                      FontWeight.bold, appColors.amber, 16),
                                  textAlign: TextAlign.center,
                                ),
                                kSizedBox5,
                                Text("₹ ${data.price}",
                                    style:
                                        textStyle(appColors.amberShade700, 16)),
                              ],
                            ),
                          ),
                        );
                      });
                } else {
                  return Center(
                      child: Text(
                    'Empty',
                    style: textStyleColor(appColors.amber),
                  ));
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
