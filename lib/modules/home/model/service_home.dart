import 'package:app/modules/home/model/model_promos.dart';

abstract class HomeService {
  Future<List<PromosModel>> banner();
}
