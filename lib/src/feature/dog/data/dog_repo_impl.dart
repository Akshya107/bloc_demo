import 'package:bloc_example/src/common/model/api_model.dart';
import 'package:bloc_example/src/feature/dog/domain/model/dogs_model.dart';
import 'package:bloc_example/src/feature/dog/domain/repo/dog_repo.dart';
import 'package:bloc_example/src/services/api_services.dart';
import 'package:bloc_example/src/utils/api_url.dart';

class DogRepoImpl extends DogRepo {
  final ApiService service;

  DogRepoImpl({required this.service});

  @override
  Future<DogsModel?> fetchDog() async {
    try {
      ApiModel res = await service.call(
        ApiUrlConstants.dog,
      );
      if (res.message != null) {
        return DogsModel(res.message);
      }
    } catch (_) {
      rethrow;
    }
    return null;
  }
}
