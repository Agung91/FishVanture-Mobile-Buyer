import 'package:app/common/http/http.dart';
import 'package:app/config/hosts.dart';
import 'package:app/modules/home/model/model_promos.dart';
import 'package:app/modules/home/model/service_home.dart';

class HomeHttpRepo extends HttpService implements HomeService {
  @override
  Future<List<PromosModel>> banner() async {
    try {
      final response = await get('$host/banner');
      if (response is List) {
        return List<Map<String, dynamic>>.from(response)
            .map((e) => PromosModel.fromMap(e))
            .toList();
      }
      throw 'Can\'t parse promos model';
    } catch (e) {
      rethrow;
    }
  }
}
