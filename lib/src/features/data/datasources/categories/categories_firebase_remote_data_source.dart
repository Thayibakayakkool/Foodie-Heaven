import 'package:foodie_heaven/src/features/domain/entities/categories_entity.dart';

abstract class CategoriesFirebaseRemoteDataSource {
  Future<List<CategoriesEntity>> getPizza();

  Future<List<CategoriesEntity>> getBurger();

  Future<List<CategoriesEntity>> getFries();

  Future<List<CategoriesEntity>> getCombo();

  Future<List<CategoriesEntity>> getWrap();

  Future<List<CategoriesEntity>> getSandwich();

  Future<List<CategoriesEntity>> getCoolDrinks();

  Future<List<CategoriesEntity>> getAll();
}
