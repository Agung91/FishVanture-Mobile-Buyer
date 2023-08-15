import 'package:app/core/auth/bloc/authenticated.dart';
import 'package:app/modules/pond/model/model_pond.dart';
import 'package:app/modules/pond/repo/repo_pond.dart';
import 'package:sstream/sstream.dart';

class PondBloc extends Authenticated {
  PondBloc(this._repo) {
    getPonds();
  }
  final PondHttpRepo _repo;

  final listPond = SStream<List<PondModel>>([]);
  final status = ''.stream;

  Future<void> getPonds() async {
    try {
      final response = await _repo.getPonds();
      listPond.add(response);
      // status.add(response?.status ?? '');
      // save pond id
      // PondID().addId(response?.id);
    } catch (e) {
      rethrow;
    }
  }

  void _makeEmpty() {
    listPond.add([]);
    status.add('');
  }

  @override
  Future<void> onLogin() async {
    getPonds();
  }

  @override
  Future<void> onLogout() async {
    _makeEmpty();
  }
}
