import 'package:app/modules/budidaya/model/input_create_budidaya.dart';
import 'package:app/modules/budidaya/model/model_budidaya.dart';
import 'package:app/modules/budidaya/repo/repo_budidaya.dart';
import 'package:flutter/foundation.dart';
import 'package:sstream/sstream.dart';

class BudidayaBloc {
  BudidayaBloc(this._repo);

  final BudidayaHttpRepo _repo;

  final listBudidaya = SStream<List<BudidayaModel>>([]);
  final budidaya = SStream<BudidayaModel?>(null);

  void _sort(List<BudidayaModel> listBudidaya) {
    listBudidaya.sort(
      (a, b) => a.estPanenDate!.compareTo(b.estPanenDate ?? DateTime.now()),
    );
    for (var element in listBudidaya) {
      if (kDebugMode) {
        print('akhir ${element.estPanenDate} - awal ${element.dateOfSeed}');
      }
    }
    final now = DateTime.now();
    // final closetsDateTimeToNow = dateTimes.reduce(
    //     (a, b) => a.difference(now).abs() < b.difference(now).abs() ? a : b);

    // print(closetsDateTimeToNow);
    // budidaya.add();
  }

  Future<void> getListBudidaya(String id) async {
    try {
      final response = await _repo.getBudidaya(id);
      _sort(response);
      listBudidaya.add(response);
    } catch (e) {
      rethrow;
    }
  }
}
