import 'package:app/modules/login/model/input/input_login.dart';

abstract class LoginService {
  Future<String?> login(LoginInput input);
}
