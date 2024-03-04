import 'package:foodie_heaven/src/features/data/repositories/wishlist_repositories_impl.dart';
import 'package:foodie_heaven/src/features/domain/entities/wishlist_entity.dart';
import 'package:foodie_heaven/src/features/domain/repositories/wishlist_repo.dart';

class WishlistUseCases {
  final WishlistRepo wishlistRepo = WishlistRepoImpl();

  Future<void> addWishlist(
    WishlistEntity wishlistEntity,
  ) {
    return wishlistRepo.addWishlist(
      wishlistEntity,
    );
  }

  Future<List<WishlistEntity>> getWishlistData() {
    return wishlistRepo.getWishlistData();
  }

  Future<void> removeWishlist(WishlistEntity wishlistEntity) {
    return wishlistRepo.removeWishlist(wishlistEntity);
  }
}
