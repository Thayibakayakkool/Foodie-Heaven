import 'package:foodie_heaven/src/core/constants/firebase_constant.dart';
import 'package:foodie_heaven/src/features/data/datasources/order/order_firebase_remote_data_source.dart';
import 'package:foodie_heaven/src/features/data/models/order_model.dart';
import 'package:foodie_heaven/src/features/domain/entities/order_entity.dart';

class OrderFirebaseRemoteDataSourceImpl
    implements OrderFirebaseRemoteDataSource {

  @override
  Future<void> orderConfirm(OrderEntity orderEntity) async {
   orderCollection.doc().get().then((value) {
      final order = OrderModel(
        subTotal: orderEntity.subTotal,
        deliveryFee: orderEntity.deliveryFee,
        totalPrice: orderEntity.totalPrice,
        orders: orderEntity.orders,
        name: orderEntity.name,
        address: orderEntity.address,
        phoneNo: orderEntity.phoneNo,
        paymentMethod: orderEntity.paymentMethod,
        orderBy: orderEntity.orderBy,
        orderDate: orderEntity.orderDate,
      ).toDocument();
      orderCollection.doc().set(order);
      return;
    });
  }
}
