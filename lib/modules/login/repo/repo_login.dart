import 'package:app/common/http/http.dart';
import 'package:app/config/hosts.dart';
import 'package:app/modules/login/model/input/input_login.dart';
import 'package:app/modules/login/model/service/service_login.dart';

class LoginRepo extends HttpService implements LoginService {
  @override
  Future<String?> login(LoginInput input) async {
    try {
      final response = await post(
        '$host/login',
        body: input.toMap(),
      );
      return response.id;
    } catch (e) {
      rethrow;
    }
  }
}
