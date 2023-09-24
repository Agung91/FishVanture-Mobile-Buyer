import 'package:app/core/auth/bloc/authenticated.dart';
import 'package:sstream/sstream.dart';

import 'package:app/modules/budidaya/model/model_budidaya.dart';
import 'package:app/modules/budidaya/repo/repo_budidaya.dart';

class BudidayaBloc extends Authenticated {
  BudidayaBloc(this._repo);

  final BudidayaHttpRepo _repo;

  final pondBudidaya = SStream<List<BudidayaModel>>([]);

  final listBudidaya = SStream<List<BudidayaModel>>([]);

  final nearestBudidaya = SStream<List<BudidayaModel>>([]);

  void makeEmpty() {
    pondBudidaya.add([]);
  }

  Future<void> budidayaPond(String id) async {
    try {
      final response = await _repo.budidayaPond(id);
      pondBudidaya.add(response);
    } catch (e) {
      rethrow;
    }
  }

  void _schedule(List<BudidayaModel> response) {
    final nearestBudidayaVal = nearestBudidaya.value;
    final listData = response.where((element) {
      for (var currentData in nearestBudidayaVal) {
        return element.id != currentData.id && element.estPanenDate != null;
      }
      return true;
    }).toList();
    // for (var element in response) {
    //   if (element.estPanenDate != null) {
    //     nearestBudidayaVal.add(element);
    //   }
    // }
    // nearestBudidayaVal.add(listData);
    listData.sort(
      (a, b) => a.estPanenDate!.compareTo(b.estPanenDate!),
    );
    nearestBudidaya.add(listData);
  }

  Future<void> budidayas() async {
    try {
      final response = await _repo.listBudidaya();
      // response.sort((a, b) => b.estPanenDate.compareTo(a.estPanenDate),);
      listBudidaya.add(response);
      _schedule(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> onLogin() async {
    budidayas();
  }

  @override
  Future<void> onLogout() async {
    pondBudidaya.add([]);
    listBudidaya.add([]);
  }
}
