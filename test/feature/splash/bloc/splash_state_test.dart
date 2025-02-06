import 'package:bloc_example/src/feature/splash/bloc/splash_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Splash State Test", () {
    test("SplashLoadedState is a subclass of SplashState", () {
      expect(SplashLoadedState(), isA<SplashState>());
    });

    test("SplashShowedState is a subclass of SplashState", () {
      expect(SplashShowedState(), isA<SplashState>());
    });

    test("Two instances of SplashLoadedState are equal",(){
      expect(SplashLoadedState(), equals(SplashLoadedState()));
    });
    test("Two instances of SplashShowedState are equal",(){
      expect(SplashShowedState(), equals(SplashShowedState()));
    });

    test("SplashLoadedState and SplashShowedState are not equal",(){
      expect(SplashLoadedState(), isNot(SplashShowedState()));
    });


  });
}
