import 'package:app/modules/orders/model/input_order.dart';
import 'package:app/modules/orders/model/input_order_cancel.dart';

abstract class OrderService {
  Future<String?> createOrder(OrderInput input);
  Future<String?> cancelOrder(OrderCancelInput input);
}
