import 'package:app/modules/budidaya/model/input_create_budidaya.dart';
import 'package:app/modules/budidaya/model/model_budidaya.dart';

abstract class BudidayaService {
  Future<List<BudidayaModel>> listBudidaya();
  Future<List<BudidayaModel>> budidayaPond(String id);
}
