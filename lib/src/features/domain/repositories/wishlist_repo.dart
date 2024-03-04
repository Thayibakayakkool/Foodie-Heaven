import 'package:foodie_heaven/src/features/domain/entities/wishlist_entity.dart';

abstract class WishlistRepo {
  Future<void> addWishlist(WishlistEntity wishlistEntity);

  Future<void> removeWishlist(WishlistEntity wishlistEntity);

  Future<List<WishlistEntity>> getWishlistData();
}
