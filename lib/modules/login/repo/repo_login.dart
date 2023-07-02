import 'package:app/common/http/http.dart';
import 'package:app/config/hosts.dart';
import 'package:app/core/auth/model/token.dart';
import 'package:app/core/auth/repo/token_data.dart';
import 'package:app/modules/login/model/input/input_login.dart';
import 'package:app/modules/login/model/service/service_login.dart';

class LoginRepo extends HttpService implements LoginService {
  @override
  Future<AuthToken> login(LoginInput input) async {
    try {
      final response = await post(
        '$host/login',
        body: input.toMap(),
      );
      return TokenData.fromMap(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
