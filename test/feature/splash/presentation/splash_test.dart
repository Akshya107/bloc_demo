import 'package:bloc_example/src/feature/dog/bloc/dogs_bloc.dart';
import 'package:bloc_example/src/feature/dog/domain/model/dogs_model.dart';
import 'package:bloc_example/src/feature/dog/domain/repo/dog_repo.dart';
import 'package:bloc_example/src/feature/dog/presentation/dog_page.dart';
import 'package:bloc_example/src/feature/planet/bloc/planet_bloc.dart';
import 'package:bloc_example/src/feature/planet/domain/repo/planet_repo.dart';
import 'package:bloc_example/src/feature/planet/presentation/planet_page.dart';
import 'package:bloc_example/src/feature/splash/bloc/splash_bloc.dart';
import 'package:bloc_example/src/feature/splash/presentation/splash.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common/route_helper.dart';
import '../../dog/helper/mock_dog_repo.dart';
import '../../planet/helper/mock_planet_repo.dart';

class MockSplashBloc extends Mock implements SplashBloc {}

class MockPlanetBloc extends MockBloc<PlanetEvent, PlanetState>
    implements PlanetBloc {}

class MockDogBloc extends MockBloc<DogsEvent, DogsState> implements DogsBloc {}

void main() {
  late MockSplashBloc splashBloc;
  late MockPlanetRepository mockPlanetRepo;
  late MockDogRepository mockDogRepository;
  late MockPlanetBloc planetBloc;
  late MockDogBloc dogBloc;
  final sl = GetIt.instance;

  setUp(() {
    splashBloc = MockSplashBloc();
    planetBloc = MockPlanetBloc();
    dogBloc = MockDogBloc();
    mockPlanetRepo = MockPlanetRepository();
    mockDogRepository = MockDogRepository();
    sl.reset();

    sl.registerSingleton<PlanetRepo>(mockPlanetRepo);
    when(() => mockPlanetRepo.fetchPlanets()).thenAnswer((_) async => []);

    sl.registerSingleton<DogRepo>(mockDogRepository);
    when(() => mockDogRepository.fetchDog()).thenAnswer((v) async => null);

    // Simulate the SplashBloc stream emitting a valid state
    when(() => splashBloc.stream)
        .thenAnswer((_) => const Stream<SplashState>.empty());
    when(() => splashBloc.state).thenReturn(SplashLoadedState());
    when(() => splashBloc.close()).thenAnswer((_) async {});

    // Simulate the PlanetBloc stream emitting a valid state
    when(() => planetBloc.stream).thenAnswer((_) =>
        Stream.value(PlanetLoaded(data: []))); // Simulating a loaded state
    when(() => planetBloc.state)
        .thenReturn(PlanetLoaded(data: [])); // Providing the initial state
    when(() => planetBloc.close()).thenAnswer((_) async {});

    // Simulate the DogBloc stream emitting a valid state
    when(() => dogBloc.stream).thenAnswer((_) => Stream.value(
        DogFetchedSuccessfully(
            info: DogsModel("msg")))); // Simulating a loaded state
    when(() => dogBloc.state).thenReturn(DogFetchedSuccessfully(
        info: DogsModel("msg"))); // Providing the initial state
    when(() => dogBloc.close()).thenAnswer((_) async {});
  });

  tearDown(() {
    splashBloc.close();
    planetBloc.close();
    dogBloc.close();
    sl.reset();
  });

  Widget buildTestableWidget(Widget widget) {
    // sl.reset();
    // sl.registerSingleton<PlanetRepo>(mockPlanetRepo);
    // sl.registerSingleton<DogRepo>(mockDogRepository);

    return MaterialApp.router(
      routerConfig: RouterHelper().router,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<SplashBloc>.value(value: splashBloc),
            BlocProvider<PlanetBloc>.value(value: planetBloc),
            BlocProvider<DogsBloc>.value(value: dogBloc),
          ],
          child: child!,
        );
      },
    );
  }

  testWidgets('navigates to dog screen when Dog button is pressed',
      (WidgetTester tester) async {
    when(() => splashBloc.state).thenReturn(SplashLoadedState());
    await tester.pumpWidget(buildTestableWidget(const SplashPage()));

    // Tap the 'Dogs' button
    await tester.tap(find.text('Dogs'));
    await tester.pumpAndSettle();

    // Verify that the DogPage is displayed
    expect(find.byType(DogPage), findsOneWidget);
  });

  testWidgets('navigates to planet screen when Planet button is pressed',
      (WidgetTester tester) async {
    when(() => splashBloc.state).thenReturn(SplashLoadedState());
    await tester.pumpWidget(buildTestableWidget(const SplashPage()));

    // Tap the 'Planet' button
    await tester.tap(find.text('Planet'));
    await tester.pumpAndSettle();

    // Verify that the PlanetPage is displayed
    expect(find.byType(PlanetPage), findsOneWidget);
  });
}
