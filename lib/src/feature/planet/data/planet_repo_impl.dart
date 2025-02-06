import 'package:bloc_example/src/common/model/api_model.dart';
import 'package:bloc_example/src/feature/planet/domain/model/planet_model.dart';
import 'package:bloc_example/src/feature/planet/domain/repo/planet_repo.dart';
import 'package:bloc_example/src/services/api_services.dart';
import 'package:bloc_example/src/utils/api_url.dart';

class PlanetRepoImpl extends PlanetRepo {
  final ApiService apiService;

  PlanetRepoImpl({required this.apiService});

  @override
  Future<List<PlanetModelData>?> fetchPlanets() async {
    try {
      ApiModel res = await apiService.call(ApiUrlConstants.planets);
      if (res.succes != null && res.succes is bool && res.succes!) {
        List<PlanetModelData> list = (res.data as List<dynamic>)
            .map((val) => PlanetModelData.fromJson(val))
            .toList();
        return list;
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }
}
