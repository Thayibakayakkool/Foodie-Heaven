import 'package:foodie_heaven/src/features/domain/entities/cart_entity.dart';

abstract class CartRepo {
  Future<void> addToCart(CartEntity cartEntity);
}
