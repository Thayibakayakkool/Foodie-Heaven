import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodie_heaven/src/core/constants/colors.dart';
import 'package:foodie_heaven/src/core/constants/constants.dart';
import 'package:foodie_heaven/src/core/constants/firebase_constant.dart';
import 'package:foodie_heaven/src/core/constants/styles.dart';
import 'package:foodie_heaven/src/core/service/firebase_service.dart';
import 'package:foodie_heaven/src/core/utils/utils.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/bloc/auth/auth_bloc.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/bloc/wishlist/wishlist_bloc.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/home/settings_page/order_page/order_page.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/home/settings_page/widgets/list_tile_widget.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/home/settings_page/wishlist_page/wishlist_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder(
          stream: FirebaseService.getUser(auth.currentUser!.uid),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Utils().loadingWidget();
            } else {
              var data = snapshot.data!.docs[0];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    kSizedBox25,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/images/Foodie heavan.png',
                        width: 150,
                      ),
                    ),
                    Text(
                      '${data['name']}',
                      style: textStyle(AppColors().amber, 20),
                    ),
                    Text('${data['email']}',
                        style: textStyle(AppColors().amber, 17)),
                    kSizedBox30,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: listTileWidget('My Orders', () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const OrderPage(),
                            ));
                      }),
                    ),
                    kSizedBox15,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: listTileWidget('My Wishlist', () {
                        BlocProvider.of<WishlistBloc>(context)
                            .add(GetWishlistDataEvent());
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const WishlistPage(),
                            ));
                      }),
                    ),
                    // kSizedBox15,
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: listTileWidget('Share', () {}),
                    // ),
                    kSizedBox15,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: listTileWidget('Log Out', () {
                        BlocProvider.of<AuthBloc>(context).add(LogOutEvent());
                      }),
                    )
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
