import 'package:sstream/sstream.dart';

import 'package:app/modules/budidaya/model/model_budidaya.dart';
import 'package:app/modules/budidaya/repo/repo_budidaya.dart';

class BudidayaBloc {
  BudidayaBloc(this._repo);

  final BudidayaHttpRepo _repo;

  final listBudidaya = SStream<List<BudidayaModel>>([]);

  void makeEmpty() {
    listBudidaya.add([]);
  }

  Future<void> getListBudidaya(String id) async {
    try {
      final response = await _repo.getBudidaya(id);
      listBudidaya.add(response);
    } catch (e) {
      rethrow;
    }
  }
}
