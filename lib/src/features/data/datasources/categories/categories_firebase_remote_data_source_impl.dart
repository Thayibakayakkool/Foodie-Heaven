import 'package:foodie_heaven/src/core/constants/firebase_constant.dart';
import 'package:foodie_heaven/src/core/utils/utils.dart';
import 'package:foodie_heaven/src/features/data/datasources/categories/categories_firebase_remote_data_source.dart';
import 'package:foodie_heaven/src/features/domain/entities/categories_entity.dart';

class CategoriesFirebaseRemoteDataSourceImpl
    implements CategoriesFirebaseRemoteDataSource {
  @override
  Future<List<CategoriesEntity>> getBurger() async {
    try {
      return await burgerCollection.get().then((value) => value.docs
          .map((e) => CategoriesEntity.fromDocument(e.data()))
          .toList());
    } catch (e) {
      Utils().flutterToast(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<CategoriesEntity>> getCombo() async {
    try {
      return await comboCollection.get().then((value) => value.docs
          .map((e) => CategoriesEntity.fromDocument(e.data()))
          .toList());
    } catch (e) {
      Utils().flutterToast(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<CategoriesEntity>> getCoolDrinks() async {
    try {
      return await coolDrinksCollection.get().then((value) => value.docs
          .map((e) => CategoriesEntity.fromDocument(e.data()))
          .toList());
    } catch (e) {
      Utils().flutterToast(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<CategoriesEntity>> getFries() async {
    try {
      return await friesCollection.get().then((value) => value.docs
          .map((e) => CategoriesEntity.fromDocument(e.data()))
          .toList());
    } catch (e) {
      Utils().flutterToast(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<CategoriesEntity>> getPizza() async {
    try {
      return await pizzaCollection.get().then((value) => value.docs
          .map((e) => CategoriesEntity.fromDocument(e.data()))
          .toList());
    } catch (e) {
      Utils().flutterToast(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<CategoriesEntity>> getSandwich() async {
    try {
      return await sandwichCollection.get().then((value) => value.docs
          .map((e) => CategoriesEntity.fromDocument(e.data()))
          .toList());
    } catch (e) {
      Utils().flutterToast(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<CategoriesEntity>> getWrap() async {
    try {
      return await wrapCollection.get().then((value) => value.docs
          .map((e) => CategoriesEntity.fromDocument(e.data()))
          .toList());
    } catch (e) {
      Utils().flutterToast(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<CategoriesEntity>> getAll() async {
    try {
      return await allCollection.get().then((value) => value.docs
          .map((e) => CategoriesEntity.fromDocument(e.data()))
          .toList());
    } catch (e) {
      Utils().flutterToast(e.toString());
      rethrow;
    }
  }
}
