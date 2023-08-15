import 'package:app/common/http/http.dart';
import 'package:app/config/hosts.dart';
import 'package:app/modules/pond/model/model_pond.dart';
import 'package:app/modules/pond/model/service_pond.dart';

class PondHttpRepo extends HttpService implements PondService {
  @override
  Future<List<PondModel>> getPonds() async {
    try {
      final response = await get('$host/list-pond');
      if (response is List) {
        return List<Map<String, dynamic>>.from(response)
            .map((e) => PondModel.fromMap(e))
            .toList();
      }
      throw 'Can\'t parse pond model';
    } catch (e) {
      rethrow;
    }
  }
}
