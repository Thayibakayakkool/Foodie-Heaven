part of 'wishlist_bloc.dart';

abstract class WishlistEvent extends Equatable {
  const WishlistEvent();

  @override
  List<Object?> get props => [];
}

class AddWishlistEvent extends WishlistEvent {
  final WishlistEntity wishlistEntity;

  const AddWishlistEvent({required this.wishlistEntity});

  @override
  List<Object?> get props => [wishlistEntity];
}

class GetWishlistDataEvent extends WishlistEvent {}

class RemoveWishlistEvent extends WishlistEvent {
  final WishlistEntity wishlistEntity;

  const RemoveWishlistEvent({
    required this.wishlistEntity,
  });

  @override
  List<Object?> get props => [wishlistEntity];
}
