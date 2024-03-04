import 'package:foodie_heaven/src/features/domain/entities/wishlist_entity.dart';

class WishlistModel extends WishlistEntity {
  const WishlistModel({
    required super.image,
    required super.name,
    required super.price,
    required super.id,
    required super.time,
    required super.calories,
    required super.rating,
    required super.desc,
  });
}
