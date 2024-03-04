import 'package:equatable/equatable.dart';

class CartEntity extends Equatable {
  final String image;
  final String name;
  final int price;
  final int quantity;
  final int total;
  final String addedBy;

  const CartEntity({
    required this.image,
    required this.name,
    required this.price,
    required this.quantity,
    required this.total,
    required this.addedBy,
  });

  @override
  List<Object?> get props => [
        image,
        name,
        price,
        quantity,
        total,
        addedBy,
      ];
}
