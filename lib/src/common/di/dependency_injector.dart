import 'package:bloc_example/src/feature/dog/data/dog_repo_impl.dart';
import 'package:bloc_example/src/feature/dog/domain/repo/dog_repo.dart';
import 'package:bloc_example/src/feature/planet/data/planet_repo_impl.dart';
import 'package:bloc_example/src/feature/planet/domain/repo/planet_repo.dart';
import 'package:bloc_example/src/services/api_services.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class DependencyInjection {
  final getIt = GetIt.I;

  Future<void> init() async {
    getIt.registerSingleton<ApiService>(ApiService(Dio()));
    getIt.registerSingleton<PlanetRepo>(PlanetRepoImpl(apiService: getIt()));
    getIt.registerSingleton<DogRepo>(DogRepoImpl(service: getIt()));
  }
}
