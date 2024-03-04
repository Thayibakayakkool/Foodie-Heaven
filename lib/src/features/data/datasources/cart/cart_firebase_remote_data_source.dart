import 'package:foodie_heaven/src/features/domain/entities/cart_entity.dart';

abstract class CartFirebaseRemoteDataSource {
  Future<void> addToCart(CartEntity cartEntity);
}
