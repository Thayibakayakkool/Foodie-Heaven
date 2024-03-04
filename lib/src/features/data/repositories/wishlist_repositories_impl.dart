import 'package:foodie_heaven/src/features/data/datasources/wishlist/wishlist_firebase_remote_data_source.dart';
import 'package:foodie_heaven/src/features/data/datasources/wishlist/wishlist_firebase_remote_data_source_impl.dart';
import 'package:foodie_heaven/src/features/domain/entities/wishlist_entity.dart';
import 'package:foodie_heaven/src/features/domain/repositories/wishlist_repo.dart';

class WishlistRepoImpl implements WishlistRepo {
  final WishlistFirebaseRemoteDataSource remoteDataSource =
      WishlistFirebaseRemoteDataSourceImpl();

  @override
  Future<void> addWishlist(WishlistEntity wishlistEntity) async =>
      await remoteDataSource.addWishlist(wishlistEntity);

  @override
  Future<void> removeWishlist(WishlistEntity wishlistEntity) async =>
      await remoteDataSource.removeWishlist(wishlistEntity);

  @override
  Future<List<WishlistEntity>> getWishlistData() async =>
      await remoteDataSource.getWishlistData();
}
