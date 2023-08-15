import 'package:app/modules/pond/model/model_pond.dart';

abstract class PondService {
  Future<List<PondModel>> getPonds();
}
