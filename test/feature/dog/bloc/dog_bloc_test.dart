import 'package:bloc_example/src/feature/dog/bloc/dogs_bloc.dart';
import 'package:bloc_example/src/feature/dog/domain/model/dogs_model.dart';
import 'package:bloc_example/src/feature/dog/domain/repo/dog_repo.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helper/hydrated_storage_init.dart';
import '../helper/mock_dog_repo.dart';

void main() {
  initHydratedStorage();
  late DogsBloc bloc;
  late MockDogRepository dogRepo;

  setUp(() {
    dogRepo = MockDogRepository();
    bloc = DogsBloc(repo: dogRepo);
  });
  tearDown(() {
    bloc.close();
  });

  var data = DogsModel("Url of dog image");

  group("Dog Bloc Test", () {
    blocTest<DogsBloc, DogsState>(
        "emit DogFetchedSuccessfully when fetchDog return value ",
        build: () {
          when(() => dogRepo.fetchDog()).thenAnswer((_) async => data);
          return bloc;
        },
        act: (bloc) => bloc.add(FetchDog()),
        expect: () => [DogFetchedSuccessfully(info: data)]);
    blocTest<DogsBloc, DogsState>(
        "emit DogsNotFound when fetchDog return null ",
        build: () {
          when(() => dogRepo.fetchDog()).thenAnswer((_) async => null);
          return bloc;
        },
        act: (bloc) => bloc.add(FetchDog()),
        expect: () => [DogsNotFound()]);
    blocTest<DogsBloc, DogsState>("emit DogsNotFound when an error occurred ",
        build: () {
          when(() => dogRepo.fetchDog()).thenThrow(Exception("Api error"));
          return bloc;
        },
        act: (bloc) => bloc.add(FetchDog()),
        expect: () => [DogsError(code: 400)]);
  });
}
