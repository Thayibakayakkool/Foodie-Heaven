import 'package:foodie_heaven/src/features/data/datasources/categories/categories_firebase_remote_data_source.dart';
import 'package:foodie_heaven/src/features/data/datasources/categories/categories_firebase_remote_data_source_impl.dart';
import 'package:foodie_heaven/src/features/domain/entities/categories_entity.dart';
import 'package:foodie_heaven/src/features/domain/repositories/categories_repo.dart';

class CategoriesRepoImpl extends CategoriesRepo {
  final CategoriesFirebaseRemoteDataSource remoteDataSource =
      CategoriesFirebaseRemoteDataSourceImpl();

  @override
  Future<List<CategoriesEntity>> getBurger() async =>
      await remoteDataSource.getBurger();

  @override
  Future<List<CategoriesEntity>> getCombo() async =>
      await remoteDataSource.getCombo();

  @override
  Future<List<CategoriesEntity>> getCoolDrinks() async =>
      await remoteDataSource.getCoolDrinks();

  @override
  Future<List<CategoriesEntity>> getFries() async =>
      await remoteDataSource.getFries();

  @override
  Future<List<CategoriesEntity>> getPizza() async =>
      await remoteDataSource.getPizza();

  @override
  Future<List<CategoriesEntity>> getSandwich() async =>
      await remoteDataSource.getSandwich();

  @override
  Future<List<CategoriesEntity>> getWrap() async =>
      await remoteDataSource.getWrap();

  @override
  Future<List<CategoriesEntity>> getAll() async =>
      await remoteDataSource.getAll();
}
