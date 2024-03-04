import 'package:foodie_heaven/src/features/data/repositories/cart_repositories_impl.dart';
import 'package:foodie_heaven/src/features/domain/entities/cart_entity.dart';
import 'package:foodie_heaven/src/features/domain/repositories/cart_repo.dart';

class CartUseCases {
  final CartRepo cartRepo = CartRepoImpl();

  Future<void> addToCart(CartEntity cartEntity) {
    return cartRepo.addToCart(cartEntity);
  }
}
