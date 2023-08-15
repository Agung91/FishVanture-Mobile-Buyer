import 'package:app/common/http/http.dart';
import 'package:app/config/hosts.dart';
import 'package:app/modules/budidaya/model/input_create_budidaya.dart';
import 'package:app/modules/budidaya/model/model_budidaya.dart';
import 'package:app/modules/budidaya/model/service_budidaya.dart';

class BudidayaHttpRepo extends HttpService implements BudidayaService {
  @override
  Future<String?> createBudidaya(CreateBudidayaInput input) async {
    try {
      final response = await post(
        '$host/create-budidaya',
        body: input.toMap(),
      );
      return response.id;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<BudidayaModel>> getBudidaya(String id) async {
    try {
      final response = await get('$host/list-budidaya?id=$id');
      if (response is List) {
        return List<Map<String, dynamic>>.from(response)
            .map((e) => BudidayaModel.fromMap(e))
            .toList();
      }
      throw 'Can\'t parse budidaya model';
    } catch (e) {
      rethrow;
    }
  }
}
