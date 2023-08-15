import 'package:app/modules/budidaya/model/input_create_budidaya.dart';
import 'package:app/modules/budidaya/model/model_budidaya.dart';
import 'package:app/modules/budidaya/repo/repo_budidaya.dart';
import 'package:sstream/sstream.dart';

class BudidayaBloc {
  BudidayaBloc(this._repo);

  final BudidayaHttpRepo _repo;

  final listBudidaya = SStream<List<BudidayaModel>>([]);

  Future<void> getListBudidaya(String id) async {
    try {
      final response = await _repo.getBudidaya(id);
      listBudidaya.add(response);
    } catch (e) {
      rethrow;
    }
  }
}
