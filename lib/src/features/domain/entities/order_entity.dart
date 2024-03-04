import 'package:equatable/equatable.dart';

class OrderEntity extends Equatable {
  final int subTotal;
  final int deliveryFee;
  final int totalPrice;
  final dynamic orders;
  final String name;
  final String address;
  final String phoneNo;
  final String paymentMethod;
  final String orderBy;
  final String orderDate;

  const OrderEntity({
    required this.subTotal,
    required this.deliveryFee,
    required this.totalPrice,
    required this.orders,
    required this.name,
    required this.address,
    required this.phoneNo,
    required this.paymentMethod,
    required this.orderBy,
    required this.orderDate,
  });

  @override
  List<Object?> get props => [
        subTotal,
        deliveryFee,
        totalPrice,
        orders,
        name,
        address,
        phoneNo,
        paymentMethod,
        orderBy,
        orderDate,
      ];
}
