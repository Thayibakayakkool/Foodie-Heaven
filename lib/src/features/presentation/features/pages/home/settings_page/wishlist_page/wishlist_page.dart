import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodie_heaven/src/core/constants/colors.dart';
import 'package:foodie_heaven/src/core/constants/constants.dart';
import 'package:foodie_heaven/src/core/constants/styles.dart';
import 'package:foodie_heaven/src/core/utils/utils.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/bloc/wishlist/wishlist_bloc.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/home/widgets/text_widget.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    AppColors appColors = AppColors();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          color: appColors.amber,
          icon: const Icon(Icons.arrow_back),
        ),
        backgroundColor: appColors.transparent,
        centerTitle: true,
        title: textWidget('Wishlist', 33),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: BlocBuilder<WishlistBloc, WishlistState>(
          builder: (context, state) {
            if (state is WishlistLoading) {
              return Utils().loadingWidget();
            } else if (state is WishlistError) {
              return Utils()
                  .showSnackBar(context: context, content: state.errorMessage);
            } else if (state is WishlistSuccess) {
              return Container(
                margin: const EdgeInsets.only(top: 15),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 15,
                            crossAxisSpacing: 9,
                            mainAxisExtent: 265),
                    itemCount: state.wishlistEntity.length,
                    itemBuilder: (context, index) {
                      var data = state.wishlistEntity[index];
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: appColors.amber)),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: state.wishlistIds.contains(data.id)
                                        ? Icon(
                                            Icons.favorite,
                                            color: appColors.amber,
                                          )
                                        : Icon(
                                            Icons.favorite_outline,
                                            color: appColors.amber,
                                          ))
                              ],
                            ),
                            CircleAvatar(
                              radius: 62,
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
                            Text('₹ ' '${data.price}',
                                style:
                                    textStyle(appColors.amberShade700, 16)),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              );
            } else {
              return Center(
                  child: Text(
                'Empty',
                style: TextStyle(color: appColors.amber),
              ));
            }
          },
        ),
      ),
    );
  }
}
