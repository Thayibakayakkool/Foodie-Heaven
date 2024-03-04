import 'package:foodie_heaven/src/features/data/datasources/cart/cart_firebase_remote_data_source.dart';
import 'package:foodie_heaven/src/features/data/datasources/cart/cart_firebase_remote_data_source_impl.dart';
import 'package:foodie_heaven/src/features/domain/entities/cart_entity.dart';
import 'package:foodie_heaven/src/features/domain/repositories/cart_repo.dart';

class CartRepoImpl implements CartRepo {
  final CartFirebaseRemoteDataSource remoteDataSource =
      CartFirebaseRemoteDataSourceImpl();

  @override
  Future<void> addToCart(CartEntity cartEntity) async =>
      await remoteDataSource.addToCart(cartEntity);
}
