import 'package:app/modules/login/model/input/input_login.dart';
import 'package:app/modules/login/repo/repo_login.dart';
import 'package:sstream/sstream.dart';

class LoginBLoc {
  LoginBLoc(this._repo);

  final LoginRepo _repo;

  final email = "".stream;
  final password = "".stream;

  Future<void> login() async {
    try {
      final emailVal = email.value;
      if (emailVal == '') {
        throw 'error';
      }
      final passVal = password.value;
      if (passVal == '') {
        throw 'error';
      }
      await _repo.login(
        LoginInput(
          email: emailVal,
          password: passVal,
          applicationType: 'buyer',
        ),
      );
    } catch (e) {
      rethrow;
    }
  }
}
