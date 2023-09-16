import 'package:app/modules/orders/model/input_order.dart';
import 'package:app/modules/orders/model/input_order_cancel.dart';
import 'package:app/modules/orders/model/model_order.dart';

abstract class OrderService {
  Future<String?> createOrder(OrderInput input);
  Future<String?> cancelOrder(OrderCancelInput input);
  Future<PaginatedOrder> order();
}
