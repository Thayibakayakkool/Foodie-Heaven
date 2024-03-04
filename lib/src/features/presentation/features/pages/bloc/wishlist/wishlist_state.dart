part of 'wishlist_bloc.dart';

abstract class WishlistState extends Equatable {
  const WishlistState();

  @override
  List<Object> get props => []; // return the list of ids
}

class WishlistInitial extends WishlistState {}

class WishlistSuccess extends WishlistState {
  final List<WishlistEntity> wishlistEntity;
  final List<String> wishlistIds;

  const WishlistSuccess(this.wishlistEntity, this.wishlistIds);

  @override
  List<Object> get props => [wishlistEntity, wishlistIds];
}

class WishlistError extends WishlistState {
  final String errorMessage;

  const WishlistError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class Wishlist extends WishlistState {
  final List<String> wishlistIds;

  const Wishlist({required this.wishlistIds});

  @override
  List<Object> get props => [wishlistIds];
}

class WishlistLoading extends WishlistState {}
