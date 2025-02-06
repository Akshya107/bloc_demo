import 'package:bloc_example/src/feature/planet/bloc/planet_bloc.dart';
import 'package:bloc_example/src/feature/planet/domain/model/planet_model.dart';
import 'package:bloc_example/src/feature/planet/domain/repo/planet_repo.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helper/hydrated_storage_init.dart';
import '../helper/mock_planet_repo.dart';

void main() {
  initHydratedStorage();
  late PlanetBloc bloc;
  late MockPlanetRepository mockPlanetRepository;

  setUp(() {
    mockPlanetRepository = MockPlanetRepository();
    bloc = PlanetBloc(repo: mockPlanetRepository);
  });
  tearDown(() {
    bloc.close();
  });
  var data = [PlanetModelData('Earth'), PlanetModelData('Mars')];
  group("PlanetBloc Tests", () {
    blocTest<PlanetBloc, PlanetState>(
        'emits PlanetLoaded when fetchPlanets returns a list of planets',
        build: () {
          when(() => mockPlanetRepository.fetchPlanets())
              .thenAnswer((_) async => data);
          return bloc;
        },
        act: (bloc) => bloc.add(FetchPlanets()),
        expect: () => [PlanetLoaded(data: data)]);

    blocTest<PlanetBloc, PlanetState>(
        "emits PlanetNotFound when fetchPlanets returns a empty list of planets",
        build: () {
          when(() => mockPlanetRepository.fetchPlanets())
              .thenAnswer((_) async => []);
          return bloc;
        },
        act: (bloc) => bloc.add(FetchPlanets()),
        expect: () => [PlanetNotFound()]);

    blocTest<PlanetBloc, PlanetState>(
        "emits PlanetError when fetchPlanets throw exception",
        build: () {
          when(() => mockPlanetRepository.fetchPlanets())
              .thenThrow(Exception("Api error"));
          return bloc;
        },
        act: (bloc) => bloc.add(FetchPlanets()),
        expect: () => [PlanetError(errorCode: 300)]);
  });
}
