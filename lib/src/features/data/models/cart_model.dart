import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodie_heaven/src/features/domain/entities/cart_entity.dart';

class CartModel extends CartEntity {
  const CartModel({
    required super.image,
    required super.name,
    required super.price,
    required super.quantity,
    required super.total,
    required super.addedBy,
  });

  factory CartModel.fromSnapshot(DocumentSnapshot snapshot) {
    return CartModel(
        image: snapshot.get('image'),
        name: snapshot.get('name'),
        price: snapshot.get('price'),
        quantity: snapshot.get('quantity'),
        total: snapshot.get('total'),
        addedBy: snapshot.get('added_by'));
  }

  Map<String, dynamic> toDocument() {
    return {
      "name": name,
      "image": image,
      "price": price,
      "quantity": quantity,
      "total": total,
      "added_by": addedBy
    };
  }
}
