import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodie_heaven/src/core/constants/colors.dart';
import 'package:foodie_heaven/src/core/constants/constants.dart';
import 'package:foodie_heaven/src/core/constants/styles.dart';
import 'package:foodie_heaven/src/core/service/firebase_service.dart';
import 'package:foodie_heaven/src/core/utils/utils.dart';
import 'package:foodie_heaven/src/features/domain/entities/wishlist_entity.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/bloc/wishlist/wishlist_bloc.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/home/categories_page/product_details_page/product_details_page.dart';

class RecommendedWidget extends StatefulWidget {
  const RecommendedWidget({
    super.key,
  });

  @override
  State<RecommendedWidget> createState() => _RecommendedWidgetState();
}

class _RecommendedWidgetState extends State<RecommendedWidget> {
  List<String> wishlistIds = [];

  @override
  Widget build(BuildContext context) {
    AppColors appColors = AppColors();
    return FutureBuilder(
      future: FirebaseService.getRecommendedProduct(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Utils().loadingWidget();
        } else if (snapshot.data!.docs.isEmpty) {
          return Text(
            'No Recommended Products',
            style: textStyleColor(appColors.amber),
          );
        } else {
          var data = snapshot.data!.docs;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  mainAxisExtent: 265),
              itemCount: data.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return ProductDetailsPage(
                            image: data[index]['image'],
                            desc: data[index]['desc'],
                            rating: data[index]['rating'],
                            calories: data[index]['calories'],
                            time: data[index]['time'],
                            price: data[index]['price'],
                            name: data[index]['name'],
                            id: data[index]['id']);
                      },
                    ));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: appColors.amber)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            BlocConsumer<WishlistBloc, WishlistState>(
                              listener: (context, state) {
                                if (state is WishlistSuccess) {
                                  setState(() {
                                    wishlistIds = state.wishlistIds;
                                  });
                                }
                              },
                              builder: (context, state) {
                                final isWishlisted = context
                                    .read<WishlistBloc>()
                                    .wishlistIds
                                    .contains(data[index]['id']);

                                if (state is WishlistLoading) {
                                  return Utils().loadingWidget();
                                } else if (state is WishlistError) {
                                  return Utils().showSnackBar(
                                      context: context,
                                      content: state.errorMessage);
                                }
                                return IconButton(
                                    onPressed: () {
                                      if (isWishlisted) {
                                        BlocProvider.of<WishlistBloc>(context)
                                            .add(RemoveWishlistEvent(
                                          wishlistEntity: WishlistEntity(
                                              image: data[index]['image'],
                                              name: data[index]['name'],
                                              price: data[index]['price'],
                                              id: data[index]['id'],
                                              time: data[index]['time'],
                                              calories: data[index]['calories'],
                                              rating: data[index]['rating'],
                                              desc: data[index]['desc']),
                                        ));
                                      } else {
                                        BlocProvider.of<WishlistBloc>(context)
                                            .add(AddWishlistEvent(
                                          wishlistEntity: WishlistEntity(
                                              image: data[index]['image'],
                                              name: data[index]['name'],
                                              price: data[index]['price'],
                                              id: data[index]['id'],
                                              time: data[index]['time'],
                                              calories: data[index]['calories'],
                                              rating: data[index]['rating'],
                                              desc: data[index]['desc']),
                                        ));
                                      }
                                    },
                                    icon: isWishlisted
                                        ? Icon(
                                            Icons.favorite,
                                            color: appColors.amber,
                                          )
                                        : Icon(
                                            Icons.favorite_outline,
                                            color: appColors.amber,
                                          ));
                              },
                            ),
                          ],
                        ),
                        CircleAvatar(
                          radius: 62,
                          backgroundImage: NetworkImage(data[index]['image']),
                        ),
                        kSizedBox5,
                        Text(
                          data[index]['name'],
                          style: regularTextStyle(
                              FontWeight.bold, appColors.amber, 16),
                          textAlign: TextAlign.center,
                        ),
                        kSizedBox5,
                        Text('₹ ' '${data[index]['price']}',
                            style: textStyle(appColors.amberShade700, 16)),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
