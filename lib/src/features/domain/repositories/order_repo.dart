import 'package:foodie_heaven/src/features/domain/entities/order_entity.dart';

abstract class OrderRepo {
  Future<void> orderConfirm(OrderEntity orderEntity);
}
