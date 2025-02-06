import 'package:bloc_example/src/feature/planet/domain/model/planet_model.dart';

abstract class PlanetRepo {
  Future<List<PlanetModelData>?> fetchPlanets();
}
