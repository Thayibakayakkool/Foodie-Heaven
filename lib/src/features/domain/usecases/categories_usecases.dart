import 'package:foodie_heaven/src/features/data/repositories/categories_repositories_impl.dart';
import 'package:foodie_heaven/src/features/domain/entities/categories_entity.dart';

import 'package:foodie_heaven/src/features/domain/repositories/categories_repo.dart';

class CategoriesUseCases {
  final CategoriesRepo categoriesRepo = CategoriesRepoImpl();

  Future<List<CategoriesEntity>> getPizza() {
    return categoriesRepo.getPizza();
  }

  Future<List<CategoriesEntity>> getAll() {
    return categoriesRepo.getAll();
  }

  Future<List<CategoriesEntity>> getCombo() {
    return categoriesRepo.getCombo();
  }

  Future<List<CategoriesEntity>> getBurger() {
    return categoriesRepo.getBurger();
  }

  Future<List<CategoriesEntity>> getSandwich() {
    return categoriesRepo.getSandwich();
  }

  Future<List<CategoriesEntity>> getWrap() {
    return categoriesRepo.getWrap();
  }

  Future<List<CategoriesEntity>> getFries() {
    return categoriesRepo.getFries();
  }

  Future<List<CategoriesEntity>> getCoolDrinks() {
    return categoriesRepo.getCoolDrinks();
  }
}
