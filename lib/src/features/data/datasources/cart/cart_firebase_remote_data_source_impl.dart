import 'package:foodie_heaven/src/core/constants/firebase_constant.dart';
import 'package:foodie_heaven/src/core/utils/utils.dart';
import 'package:foodie_heaven/src/features/data/datasources/cart/cart_firebase_remote_data_source.dart';
import 'package:foodie_heaven/src/features/data/models/cart_model.dart';
import 'package:foodie_heaven/src/features/domain/entities/cart_entity.dart';

class CartFirebaseRemoteDataSourceImpl implements CartFirebaseRemoteDataSource {
  @override
  Future<void> addToCart(CartEntity cartEntity) async {
    cartCollection.doc().get().then((value) {
      final cart = CartModel(
        image: cartEntity.image,
        name: cartEntity.name,
        price: cartEntity.price,
        quantity: cartEntity.quantity,
        total: cartEntity.total,
        addedBy: cartEntity.addedBy,
      ).toDocument();
      cartCollection.doc().set(cart);
      return;
    });
  }
}
