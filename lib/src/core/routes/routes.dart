import 'package:flutter/material.dart';
import 'package:foodie_heaven/src/core/routes/routes_name.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/auth/login_page/forgot_password_page/forgot_password_page.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/auth/login_page/login_page.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/auth/signup_page/signup_page.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/home/cart_page/cart_page.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/home/settings_page/order_page/order_page.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/home/settings_page/wishlist_page/wishlist_page.dart';

Route<dynamic> routes(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case loginPage:
      return MaterialPageRoute(
        builder: (context) => LoginPage(),
      );
    case signUpPage:
      return MaterialPageRoute(builder: (context) => SignUpPage());
    case forgotPasswordPage:
      return MaterialPageRoute(builder: (context) => ForgotPasswordPage());
    case orderPage:
      return MaterialPageRoute(builder: (context) => OrderPage());
    case wishlistPage:
      return MaterialPageRoute(builder: (context) => WishlistPage());
    case cartPage:
      return MaterialPageRoute(builder: (context) => CartPage());
    default:
      throw ('This route name does not exist');
  }
}
