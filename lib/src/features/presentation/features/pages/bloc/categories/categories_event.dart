part of 'categories_bloc.dart';

abstract class CategoriesEvent extends Equatable {
  const CategoriesEvent();

  @override
  List<Object?> get props => [];
}

class PizzaEvent extends CategoriesEvent {}

class AllEvent extends CategoriesEvent {}

class BurgerEvent extends CategoriesEvent {}

class SandwichEvent extends CategoriesEvent {}

class FriesEvent extends CategoriesEvent {}

class ComboEvent extends CategoriesEvent {}

class CoolDrinksEvent extends CategoriesEvent {}

class WrapEvent extends CategoriesEvent {}
