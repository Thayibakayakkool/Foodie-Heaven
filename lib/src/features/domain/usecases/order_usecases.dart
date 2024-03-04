import 'package:foodie_heaven/src/features/data/repositories/order_repositories_impl.dart';
import 'package:foodie_heaven/src/features/domain/entities/order_entity.dart';
import 'package:foodie_heaven/src/features/domain/repositories/order_repo.dart';

class OrderUseCases{
final OrderRepo orderRepo=OrderRepoImpl();
  Future<void> orderConfirm(OrderEntity orderEntity){
    return orderRepo.orderConfirm(orderEntity);
  }
}