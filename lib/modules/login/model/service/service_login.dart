import 'package:app/core/auth/model/token.dart';
import 'package:app/modules/login/model/input/input_login.dart';

abstract class LoginService {
  Future<AuthToken> login(LoginInput input);
}
