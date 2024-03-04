import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodie_heaven/src/features/domain/entities/order_entity.dart';

class OrderModel extends OrderEntity {
  const OrderModel({
    required super.subTotal,
    required super.deliveryFee,
    required super.totalPrice,
    required super.orders,
    required super.name,
    required super.address,
    required super.phoneNo,
    required super.paymentMethod,
    required super.orderBy,
    required super.orderDate,
  });

  factory OrderModel.fromSnapshot(DocumentSnapshot snapshot) {
    return OrderModel(
      subTotal: snapshot.get('subTotal'),
      deliveryFee: snapshot.get('deliveryFee'),
      totalPrice: snapshot.get('totalPrice'),
      orders: snapshot.get('orders'),
      name: snapshot.get('name'),
      address: snapshot.get('address'),
      phoneNo: snapshot.get('phoneNo'),
      paymentMethod: snapshot.get('paymentMethod'),
      orderBy: snapshot.get('orderBy'),
      orderDate: snapshot.get('orderDate'),
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      "subTotal": subTotal,
      "deliveryFee": deliveryFee,
      "totalPrice": totalPrice,
      "orders": orders,
      "name": name,
      "address": address,
      "phoneNo": phoneNo,
      "paymentMethod": paymentMethod,
      "orderBy": orderBy,
      "orderDate": orderDate,
    };
  }
}
