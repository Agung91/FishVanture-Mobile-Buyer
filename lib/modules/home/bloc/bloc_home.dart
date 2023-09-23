import 'package:sstream/sstream.dart';

import 'package:app/modules/home/model/model_promos.dart';
import 'package:app/modules/home/repo/repo_home.dart';

class HomeBloc {
  HomeBloc(
    this._repo,
  ) {
    banners();
  }
  final HomeHttpRepo _repo;

  Future<void> banners() async {
    try {
      final response = await _repo.banner();
      listBanner.add(response);
    } catch (e) {
      rethrow;
    }
  }

  final listBanner = SStream<List<PromosModel>>([]);
}
