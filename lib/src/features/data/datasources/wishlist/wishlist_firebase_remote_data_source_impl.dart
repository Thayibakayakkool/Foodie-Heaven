import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodie_heaven/src/core/constants/firebase_constant.dart';
import 'package:foodie_heaven/src/core/utils/utils.dart';
import 'package:foodie_heaven/src/features/data/datasources/wishlist/wishlist_firebase_remote_data_source.dart';
import 'package:foodie_heaven/src/features/domain/entities/wishlist_entity.dart';

class WishlistFirebaseRemoteDataSourceImpl
    implements WishlistFirebaseRemoteDataSource {
  @override
  Future<void> addWishlist(WishlistEntity wishlistEntity) async {
    wishlistCollection.doc(wishlistEntity.id).set({
      'id': wishlistEntity.id,
      'name': wishlistEntity.name,
      'image': wishlistEntity.image,
      'price': wishlistEntity.price,
      'time': wishlistEntity.time,
      'rating': wishlistEntity.rating,
      'calories': wishlistEntity.calories,
      'desc': wishlistEntity.desc,
    });
    Utils().flutterToast('Added to wishlist');
  }

  @override
  Future<void> removeWishlist(WishlistEntity wishlistEntity) async {
    wishlistCollection.doc(wishlistEntity.id).delete();
    Utils().flutterToast('Remove from wishlist');
  }

  @override
  Future<List<WishlistEntity>> getWishlistData() async {
    try {
      return await wishlistCollection.get().then((value) => value.docs
          .map((e) => WishlistEntity.fromDocument(e.data()))
          .toList());
    } catch (e) {
      Utils().flutterToast(e.toString());
      rethrow;
    }
  }
}
