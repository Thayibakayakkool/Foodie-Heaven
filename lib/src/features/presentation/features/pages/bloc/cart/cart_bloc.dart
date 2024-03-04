import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodie_heaven/src/core/constants/firebase_constant.dart';
import 'package:foodie_heaven/src/core/utils/utils.dart';
import 'package:foodie_heaven/src/features/domain/entities/cart_entity.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<AddToCartEvent>(_addToCartEvent);
  }

  void _addToCartEvent(AddToCartEvent event, Emitter<CartState> emit) async {
    emit(CartLoading());
    try {
      await cartUseCases.addToCart(event.cartEntity);
      emit(CartLoaded(cartEntity: event.cartEntity));
    } catch (e) {
      emit(CartError(errorMessage: e.toString()));
    }
  }


}
