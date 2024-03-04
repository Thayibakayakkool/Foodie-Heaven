import 'package:flutter/material.dart';
import 'package:foodie_heaven/src/core/constants/colors.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/home/cart_page/cart_page.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/home/home_page.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/home/settings_page/settings_page.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({super.key});

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  int currentIndex = 0;

  var navBody = [
    const HomePage(),
    const CartPage(),
    const SettingsPage(),
  ];

  final navBarItem = [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
          color: AppColors().amber,
          size: 30,
        ),
        label: 'Home'),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.shopping_cart,
          color: AppColors().amber,
          size: 30,
        ),
        label: 'Cart'),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.settings,
          color: AppColors().amber,
          size: 30,
        ),
        label: 'Settings')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: AppColors().amber,
            spreadRadius: 3,
            blurRadius: 8,
          ),
        ]),
        child: BottomNavigationBar(
          unselectedItemColor: AppColors().amber,
          selectedItemColor: AppColors().amber,
          backgroundColor: AppColors().blackColors,
          items: navBarItem,
          currentIndex: currentIndex,
          onTap: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
      body: navBody[currentIndex],
    );
  }
}
