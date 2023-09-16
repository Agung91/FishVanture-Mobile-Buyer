import 'package:app/modules/budidaya/model/model_price_list.dart';
import 'package:app/modules/orders/model/error_order.dart';
import 'package:app/modules/orders/model/input_order.dart';
import 'package:app/modules/orders/model/input_order_cancel.dart';
import 'package:app/modules/orders/repo/repo_order.dart';
import 'package:flutter/foundation.dart';
import 'package:sstream/sstream.dart';

class OrderBloc {
  OrderBloc(this._repo);

  final OrderHttpRepo _repo;

  final quantity = 1.stream;
  final bookDate = SStream<DateTime?>(null);
  final price = 0.stream;
  final amount = 0.stream;

  void makeEmpty() {
    quantity.add(1);
    bookDate.add(null);
    price.add(0);
    amount.add(0);
  }

  void increment() {
    int quantityVal = quantity.value;
    quantityVal++;
    quantity.add(quantityVal);
  }

  void decrement() {
    int quantityVal = quantity.value;
    if (quantityVal <= 1) {
      return;
    }
    quantityVal--;
    quantity.add(quantityVal);
  }

  void updatePrice(List<PriceListModel>? listPrice) {
    listPrice?.sort(
      (a, b) => a.limit - b.limit,
    );
    if (kDebugMode) {
      print(price.value);
    }
    int quantityVal = quantity.value;
    listPrice?.forEach((element) {
      if (quantityVal >= element.limit) {
        price.add(element.price);
        return;
      }
    });
  }

  void calculatePrice() {
    int quantityVal = quantity.value;
    int priceVal = price.value;
    final result = quantityVal * priceVal;
    amount.add(result);
  }

  Future<void> createOrder(String budidayaID) async {
    final bookDateVal = bookDate.value;
    if (bookDateVal == null) {
      throw OrderError();
    }
    try {
      await _repo.createOrder(OrderInput(
        budidayaID: budidayaID,
        qty: quantity.value,
        bookingDate: bookDateVal,
      ));
    } catch (e) {
      rethrow;
    }
  }

  Future<void> cancelOrder(String budidayaID) async {
    try {
      await _repo.cancelOrder(OrderCancelInput(
        id: budidayaID,
      ));
    } catch (e) {
      rethrow;
    }
  }
}
