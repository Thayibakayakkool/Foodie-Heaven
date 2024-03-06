import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodie_heaven/src/core/constants/colors.dart';
import 'package:foodie_heaven/src/core/constants/constants.dart';
import 'package:foodie_heaven/src/core/constants/firebase_constant.dart';
import 'package:foodie_heaven/src/core/constants/styles.dart';
import 'package:foodie_heaven/src/core/utils/utils.dart';
import 'package:foodie_heaven/src/features/domain/entities/cart_entity.dart';
import 'package:foodie_heaven/src/features/domain/entities/wishlist_entity.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/bloc/cart/cart_bloc.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/bloc/wishlist/wishlist_bloc.dart';
import 'package:readmore/readmore.dart';
import 'package:share_plus/share_plus.dart';

class ProductDetailsPage extends StatefulWidget {
  final String image;
  final int price;
  final String name;
  final int time;
  final String calories;
  final double rating;
  final String desc;
  final String id;

  const ProductDetailsPage(
      {super.key,
      required this.image,
      required this.desc,
      required this.rating,
      required this.calories,
      required this.time,
      required this.price,
      required this.name,
      required this.id});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int total = 0;
  int a = 0;
  AppColors appColors = AppColors();

  @override
  void initState() {
    super.initState();
    total = int.parse(total.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          BlocBuilder<WishlistBloc, WishlistState>(
            builder: (context, state) {
              final isWishlisted =
                  context.watch<WishlistBloc>().wishlistIds.contains(widget.id);

              if (state is WishlistLoading) {
                return Utils().loadingWidget();
              } else if (state is WishlistError) {
                return Utils().showSnackBar(
                    context: context, content: state.errorMessage);
              }
              return IconButton(
                  onPressed: () {
                    if (isWishlisted) {
                      BlocProvider.of<WishlistBloc>(context)
                          .add(RemoveWishlistEvent(
                        wishlistEntity: WishlistEntity(
                            image: widget.image,
                            name: widget.name,
                            price: widget.price,
                            id: widget.id,
                            time: widget.time,
                            calories: widget.calories,
                            rating: widget.rating,
                            desc: widget.desc),
                      ));
                    } else {
                      BlocProvider.of<WishlistBloc>(context)
                          .add(AddWishlistEvent(
                        wishlistEntity: WishlistEntity(
                            image: widget.image,
                            name: widget.name,
                            price: widget.price,
                            id: widget.id,
                            time: widget.time,
                            calories: widget.calories,
                            rating: widget.rating,
                            desc: widget.desc),
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
          IconButton(
              onPressed: () async {
                Share.share(
                    "${widget.name}\n${widget.image}\n₹ ${widget.price}");
              },
              icon: Icon(
                Icons.share,
                color: appColors.amber,
              )),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Image.network(
              widget.image,
              width: 360.w,
              height: 280.h,
              fit: BoxFit.cover,
            ),
            kSizedBox5,
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(widget.name,
                      style: regularTextStyle(
                          FontWeight.bold, appColors.amber, 25),
                      textAlign: TextAlign.left)),
            ),
            kSizedBox5,
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ' ₹ ' '${widget.price}',
                    style: textStyle(appColors.whiteColors, 21),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 9, right: 7),
                    width: 80,
                    height: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        border: Border.all(color: appColors.amber)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (a > 0) {
                              --a;
                              total =
                                  total - int.parse(widget.price.toString());
                              setState(() {});
                            }
                          },
                          child: Icon(
                            Icons.remove,
                            color: appColors.whiteColors,
                            size: 15,
                          ),
                        ),
                        Text(
                          '$a',
                          style: textStyle(appColors.amber, 18),
                        ),
                        GestureDetector(
                          onTap: () {
                            ++a;
                            total = total + int.parse(widget.price.toString());
                            setState(() {});
                          },
                          child: Icon(
                            Icons.add,
                            color: appColors.whiteColors,
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            kSizedBox5,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.lock_clock_outlined,
                          color: appColors.amber,
                        )),
                    Text(
                      '${widget.time} min',
                      style: textStyle(appColors.whiteColors, 19),
                    )
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.local_fire_department_outlined,
                          color: appColors.amber,
                        )),
                    Text(
                      '${widget.calories} calories',
                      style: textStyle(appColors.whiteColors, 19),
                    )
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.star,
                          color: appColors.amber,
                        )),
                    Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: Text(
                        '${widget.rating}',
                        style: textStyle(appColors.whiteColors, 19),
                      ),
                    )
                  ],
                ),
              ],
            ),
            kSizedBox5,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ReadMoreText(
                widget.desc,
                trimLines: 3,
                trimMode: TrimMode.Line,
                textAlign: TextAlign.justify,
                trimCollapsedText: ' Show more',
                trimExpandedText: ' Show less',
                style: textStyle(appColors.whiteColors, 17),
                lessStyle: textStyleColor(appColors.amber),
                moreStyle: textStyleColor(appColors.amber),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 9, right: 8, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 150,
              height: 60,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    side: MaterialStateProperty.all(
                        BorderSide(color: appColors.amber)),
                    backgroundColor:
                        MaterialStateProperty.all(appColors.blackColors)),
                child: Column(
                  children: [
                    kSizedBox5,
                    Text(
                      'Total :',
                      style: textStyle(AppColors().amber, 18),
                    ),
                    Text(
                      '₹ ' '$total',
                      style: textStyle(AppColors().whiteColors, 16),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 160,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  BlocProvider.of<CartBloc>(context).add(AddToCartEvent(
                      cartEntity: CartEntity(
                    image: widget.image,
                    name: widget.name,
                    price: widget.price,
                    quantity: a,
                    total: total,
                    addedBy: auth.currentUser!.uid,
                  )));
                  Utils().flutterToast('Added to cart');
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(appColors.amber)),
                child: Row(
                  children: [
                    Icon(
                      Icons.shopping_cart,
                      color: appColors.blackColors,
                    ),
                    wSizedBox5,
                    Text(
                      'Add to cart',
                      style: textStyle(appColors.blackColors, 16),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
