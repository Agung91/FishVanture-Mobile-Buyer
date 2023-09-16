import 'package:app/common/http/http.dart';
import 'package:app/config/hosts.dart';
import 'package:app/modules/orders/model/input_order.dart';
import 'package:app/modules/orders/model/input_order_cancel.dart';
import 'package:app/modules/orders/model/model_order.dart';
import 'package:app/modules/orders/model/service_order.dart';

class OrderHttpRepo extends HttpService implements OrderService {
  @override
  Future<String?> cancelOrder(OrderCancelInput input) async {
    try {
      final response = await post(
        '$host/update-order-cancel',
        body: input.toMap(),
      );
      if (response is Map<String, dynamic>) {
        return response.id;
      }
      throw 'Can\'t parse Order model';
    } catch (e) {
      rethrow;
    }
  }

// /create-order

  @override
  Future<String?> createOrder(OrderInput input) async {
    try {
      final response = await post(
        '$host/create-order',
        body: input.toMap(),
      );
      if (response is Map<String, dynamic>) {
        return response.id;
      }
      throw 'Can\'t parse Order model';
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<PaginatedOrder> order() async {
    try {
      final response = await get(
        '$host/order',
      );
      if (response is Map<String, dynamic>) {
        return PaginatedOrder.fromMap(response);
      }
      throw 'Can\'t parse Order model';
    } catch (e) {
      rethrow;
    }
  }
}
