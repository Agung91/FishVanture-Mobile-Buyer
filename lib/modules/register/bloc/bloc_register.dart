import 'package:app/modules/register/model/input/input_register.dart';
import 'package:app/modules/register/repo/repo_register.dart';
import 'package:sstream/sstream.dart';

class RegisterBloc {
  RegisterBloc(this._repo);

  final RegisterRepo _repo;

  final name = "".stream;
  final email = "".stream;
  final password = "".stream;
  final konfirmPassword = "".stream;

  void makeEmpty() {
    name.add('');
    email.add('');
    password.add('');
    konfirmPassword.add('');
  }

  Future<void> register() async {
    try {
      final nameVal = name.value;
      if (nameVal == '') {
        throw 'error';
      }
      final emailVal = email.value;
      if (emailVal == '') {
        throw 'error';
      }
      final passVal = password.value;
      if (passVal == '') {
        throw 'error';
      }
      final konfirmPassVal = konfirmPassword.value;
      if (konfirmPassVal == '') {
        throw 'error';
      }
      if (passVal != konfirmPassVal) {
        throw 'error';
      }
      await _repo.register(
        RegsiterInput(
          name: nameVal,
          email: emailVal,
          password: passVal,
          applicationType: 'buyer',
        ),
      );
      makeEmpty();
    } catch (e) {
      rethrow;
    }
  }
}
