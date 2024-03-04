import 'package:foodie_heaven/src/features/domain/entities/order_entity.dart';

abstract class OrderFirebaseRemoteDataSource {
  Future<void> orderConfirm(OrderEntity orderEntity);
}
