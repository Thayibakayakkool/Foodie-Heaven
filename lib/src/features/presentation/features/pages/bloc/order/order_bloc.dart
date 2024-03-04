
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodie_heaven/src/core/constants/firebase_constant.dart';
import 'package:foodie_heaven/src/features/domain/entities/order_entity.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(OrderInitial()) {
    on<OrderConfirmEvent>(_orderConfirmEvent);
  }
  void _orderConfirmEvent(OrderConfirmEvent event,Emitter<OrderState> emit) async{
    try{
      await orderUseCases.orderConfirm(event.orderEntity);
    }catch (e){
      emit(OrderError(errorMessage: e.toString()));
    }
  }
}
