import 'package:app/common/http/http.dart';
import 'package:app/config/hosts.dart';
import 'package:app/modules/register/model/input/input_register.dart';
import 'package:app/modules/register/model/service/service_register.dart';

class RegisterRepo extends HttpService implements RegsiterService {
  @override
  Future<String?> register(RegsiterInput input) async {
    try {
      final response = await post(
        '$host/register',
        body: input.toMap(),
      );
      return response.id;
    } catch (e) {
      rethrow;
    }
  }
}
