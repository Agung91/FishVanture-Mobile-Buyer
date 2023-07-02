import 'package:app/common/http/http.dart';
import 'package:app/config/hosts.dart';
import 'package:app/modules/profile/model/model_profile.dart';
import 'package:app/modules/profile/model/service_profile.dart';

class ProfileHttpRepo extends HttpService implements ProfileService {
  @override
  Future<ProfileModel> getProfile() async {
    try {
      final reseponse = await get('$host/profile');
      return ProfileModel.fromMap(reseponse);
    } catch (e) {
      rethrow;
    }
  }
}
