import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodie_heaven/src/core/constants/colors.dart';
import 'package:foodie_heaven/src/core/constants/constants.dart';
import 'package:foodie_heaven/src/core/constants/styles.dart';
import 'package:foodie_heaven/src/core/service/firebase_service.dart';
import 'package:foodie_heaven/src/core/utils/utils.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/bloc/wishlist/wishlist_bloc.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/home/cart_page/cart_page.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/home/categories_page/product_details_page/product_details_page.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/home/settings_page/wishlist_page/wishlist_page.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/home/widgets/text_widget.dart';

class SearchPage extends StatelessWidget {
  final String? title;

  const SearchPage({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                BlocProvider.of<WishlistBloc>(context).add(GetWishlistDataEvent());
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const WishlistPage(),
                ));
              },
              icon: Icon(
                Icons.favorite,
                color: AppColors().amber,
              )),
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CartPage(),));
              },
              icon: Icon(
                Icons.shopping_cart,
                color: AppColors().amber,
              )),
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          color: AppColors().amber,
          icon: const Icon(Icons.arrow_back),
        ),
        backgroundColor: AppColors().transparent,
        centerTitle: true,
        title: textWidget(title!, 33),
      ),
      body: FutureBuilder(
          future: FirebaseService.searchProduct(title),
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Utils().loadingWidget();
            } else if (snapshot.data!.docs.isEmpty) {
              return Text(
                'No food found',
                style: textStyleColor(AppColors().amber),
              );
            } else {
              var data = snapshot.data!.docs;
              var items = data
                  .where((element) => element['name']
                      .toString()
                      .toLowerCase()
                      .contains(title!.toLowerCase()))
                  .toList();

              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  margin: const EdgeInsets.only(top: 15),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 18,
                              crossAxisSpacing: 12,
                              mainAxisExtent: 265),
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetailsPage(
                                      image: items[index]['image'],
                                      desc: items[index]['desc'],
                                      rating: items[index]['rating'],
                                      calories: items[index]['calories'],
                                      time: items[index]['time'],
                                      price: items[index]['price'],
                                      name: items[index]['name'],
                                      id: items[index]['id']),
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
                                  radius: 62,
                                  backgroundImage:
                                      NetworkImage(items[index]['image']),
                                ),
                                kSizedBox5,
                                Text(
                                  items[index]['name'],
                                  style: regularTextStyle(
                                      FontWeight.bold, AppColors().amber, 16),
                                  textAlign: TextAlign.center,
                                ),
                                kSizedBox5,
                                Text('₹ ' '${items[index]['price']}',
                                    style: textStyle(
                                        AppColors().amberShade700, 16)),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              );
            }
          }),
    );
  }
}
