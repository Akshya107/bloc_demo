import 'package:bloc_example/src/feature/splash/bloc/splash_bloc.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';

void main() {
  group('Splash Bloc Test', () {
    late SplashBloc bloc;
    setUp(() {
      bloc = SplashBloc();
    });
    tearDown(() {
      bloc.close();
    });

    test('Initial state', () {
      expect(bloc.state, equals(SplashLoadedState()));
    });

    blocTest("emit SplashShowedState when SplashViewed event is called ",
        build: () => bloc,
        act: (bloc) => bloc.add(SplashViewed()),
        wait: const Duration(seconds: 2),
        expect: () => [SplashShowedState()]);
  });
}
