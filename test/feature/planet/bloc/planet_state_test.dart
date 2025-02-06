import 'package:bloc_example/src/feature/planet/bloc/planet_bloc.dart';
import 'package:bloc_example/src/feature/planet/domain/model/planet_model.dart';
import 'package:flutter_test/flutter_test.dart';

var data = [PlanetModelData('Earth'), PlanetModelData('Mars')];

void main() {
  group("PlanetState Tests", () {
    test("PlanetLoading supports value comparison ", () {
      expect(PlanetLoading(), PlanetLoading());
    });
    test("PlanetNotFound supports value comparison ", () {
      expect(PlanetNotFound(), PlanetNotFound());
    });
    test("PlanetError supports value comparison ", () {
      expect(PlanetError(errorCode: 300), PlanetError(errorCode: 300));
    });
    test("PlanetLoaded supports value comparison with same data ", () {
      expect(PlanetLoaded(data: data), PlanetLoaded(data: data));
    });
    test("PlanetError with different error should not be equal", () {
      expect(PlanetError(errorCode: 300) == PlanetError(errorCode: 301), false);
    });
    test("PlanetLoaded with different list of planet should not be equal", () {
      final data1 = [PlanetModelData('Earth1'), PlanetModelData('Mars1')];
      expect(PlanetLoaded(data: data) == PlanetLoaded(data: data1), false);
    });
  });
}
