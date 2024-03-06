import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodie_heaven/src/core/constants/constants.dart';
import 'package:foodie_heaven/src/core/constants/string.dart';
import 'package:foodie_heaven/src/core/routes/routes_name.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/bloc/categories/categories_bloc.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/bloc/wishlist/wishlist_bloc.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/home/settings_page/wishlist_page/wishlist_page.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/home/widgets/appbar_widget.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/home/widgets/category_widget.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/home/categories_page/categories_page.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/home/widgets/popular_widget.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/home/widgets/recommended_widget.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/home/widgets/search_widget.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/home/widgets/text_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    BlocProvider.of<WishlistBloc>(context).add(GetWishlistDataEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<CategoriesBloc>(context);
    return SafeArea(
      child: Scaffold(
        appBar: appBarWidget(() {
          BlocProvider.of<WishlistBloc>(context).add(GetWishlistDataEvent());
          Navigator.pushNamed(
            context,wishlistPage
          );
        }),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SearchWidget(),
              kSizedBox10,
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const CategoriesPage(
                                        text: AppStrings.all,
                                      )));
                          bloc.add(AllEvent());
                        },
                        child: const CategoryWidget(
                            name: AppStrings.all,
                            image: 'assets/foods/fast-food.jpg')),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const CategoriesPage(
                                        text: AppStrings.combo,
                                      )));
                          bloc.add(ComboEvent());
                        },
                        child: const CategoryWidget(
                            name: AppStrings.combo,
                            image: 'assets/foods/combo.jpg')),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CategoriesPage(
                                    text: AppStrings.pizza)));
                        bloc.add(PizzaEvent());
                      },
                      child: const CategoryWidget(
                          name: AppStrings.pizza,
                          image: 'assets/foods/pizza.jpg'),
                    ),
                    GestureDetector(
                      onTap: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CategoriesPage(
                                      text: AppStrings.burger,
                                    )));
                        bloc.add(BurgerEvent());
                      },
                      child: const CategoryWidget(
                          name: AppStrings.burger,
                          image: 'assets/foods/burger.jpg'),
                    ),
                    GestureDetector(
                      onTap: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CategoriesPage(
                                      text: AppStrings.fries,
                                    )));
                        bloc.add(FriesEvent());
                      },
                      child: const CategoryWidget(
                          name: AppStrings.fries,
                          image: 'assets/foods/fries.jpg'),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CategoriesPage(
                                      text: AppStrings.wrap,
                                    )));
                        bloc.add(WrapEvent());
                      },
                      child: const CategoryWidget(
                          name: AppStrings.wrap,
                          image: 'assets/foods/shawarma.jpg'),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CategoriesPage(
                                      text: AppStrings.sandwich,
                                    )));
                        bloc.add(SandwichEvent());
                      },
                      child: const CategoryWidget(
                          name: AppStrings.sandwich,
                          image: 'assets/foods/sandwich.jpg'),
                    ),
                    GestureDetector(
                      onTap: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CategoriesPage(
                                      text: AppStrings.coolDrinks,
                                    )));
                        bloc.add(CoolDrinksEvent());
                      },
                      child: const CategoryWidget(
                          name: AppStrings.coolDrinks,
                          image: 'assets/foods/drinks.jpg'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: textWidget('Popular', 25),
              ),
              kSizedBox15,
              const PopularWidget(),
              kSizedBox20,
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: textWidget('Recommended', 25),
              ),
              kSizedBox10,
              const RecommendedWidget(),
              kSizedBox5,
            ],
          ),
        ),
      ),
    );
  }
}
