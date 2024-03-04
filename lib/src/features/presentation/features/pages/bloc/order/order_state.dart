part of 'order_bloc.dart';

abstract class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}

class OrderInitial extends OrderState {}

class OrderError extends OrderState {
  final String errorMessage;

  const OrderError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
