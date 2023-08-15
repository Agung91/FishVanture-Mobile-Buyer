import 'package:app/modules/budidaya/model/input_create_budidaya.dart';
import 'package:app/modules/budidaya/model/model_budidaya.dart';

abstract class BudidayaService {
  Future<String?> createBudidaya(CreateBudidayaInput input);
  Future<List<BudidayaModel>> getBudidaya(String id);
}
