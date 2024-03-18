import 'package:foodie_heaven/src/core/constants/firebase_constant.dart';
import 'package:foodie_heaven/src/features/data/datasources/order/order_firebase_remote_data_source.dart';
import 'package:foodie_heaven/src/features/data/datasources/order/order_firebase_remote_data_source_impl.dart';
import 'package:foodie_heaven/src/features/domain/entities/order_entity.dart';
import 'package:foodie_heaven/src/features/domain/repositories/order_repo.dart';

class OrderRepoImpl implements OrderRepo {
  final OrderFirebaseRemoteDataSource remoteDataSource =
      OrderFirebaseRemoteDataSourceImpl();

  @override
  Future<void> orderConfirm(OrderEntity orderEntity) async =>
      await remoteDataSource.orderConfirm(orderEntity);
}
