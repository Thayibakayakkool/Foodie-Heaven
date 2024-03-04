import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodie_heaven/src/core/constants/firebase_constant.dart';
import 'package:foodie_heaven/src/features/domain/entities/wishlist_entity.dart';

part 'wishlist_event.dart';

part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  List<String> wishlistIds = [];

  WishlistBloc() : super(WishlistInitial()) {
    on<AddWishlistEvent>(_addWishlistEvent);
    on<RemoveWishlistEvent>(_removeWishlistEvent);
    on<GetWishlistDataEvent>(_getWishlistDataEvent);
  }

  void _addWishlistEvent(
      AddWishlistEvent event, Emitter<WishlistState> emit) async {
    emit(WishlistLoading());
    try {
      wishlistIds.add(event.wishlistEntity.id);
      await wishlistUseCases.addWishlist(event.wishlistEntity);
      emit(Wishlist(wishlistIds: wishlistIds));
    } catch (e) {
      emit(WishlistError(errorMessage: e.toString()));
    }
  }

  void _removeWishlistEvent(
      RemoveWishlistEvent event, Emitter<WishlistState> emit) async {
    emit(WishlistLoading());
    try {
      wishlistIds.remove(event.wishlistEntity.id);
      await wishlistUseCases.removeWishlist(event.wishlistEntity);
      emit(Wishlist(wishlistIds: wishlistIds));
    } catch (e) {
      emit(WishlistError(errorMessage: e.toString()));
    }
  }

  void _getWishlistDataEvent(
      GetWishlistDataEvent event, Emitter<WishlistState> emit) async {
    try {
      List<WishlistEntity> wishlist = await wishlistUseCases.getWishlistData();
      emit(WishlistSuccess(wishlist, wishlistIds));
    } catch (e) {
      emit(WishlistError(errorMessage: e.toString()));
    }
  }
}
