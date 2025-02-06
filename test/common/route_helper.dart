import 'package:bloc_example/src/common/router/route_name.dart';
import 'package:bloc_example/src/feature/dog/bloc/dogs_bloc.dart';
import 'package:bloc_example/src/feature/dog/domain/repo/dog_repo.dart';
import 'package:bloc_example/src/feature/dog/presentation/dog_page.dart';
import 'package:bloc_example/src/feature/planet/bloc/planet_bloc.dart';
import 'package:bloc_example/src/feature/planet/domain/repo/planet_repo.dart';
import 'package:bloc_example/src/feature/planet/presentation/planet_page.dart';
import 'package:bloc_example/src/feature/splash/presentation/splash.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class RouterHelper {
  final router = GoRouter(
    initialLocation: RouteName.splashScreenPath,
    routes: [
      GoRoute(
        name: RouteName.splashScreen,
        path: RouteName.splashScreenPath,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        name: RouteName.planetScreen,
        path: RouteName.planetScreenPath,
        builder: (context, state) => PlanetPage(),
      ),
      GoRoute(
        name: RouteName.dogScreen,
        path: RouteName.dogScreenPath,
        builder: (context, state) => DogPage(),
      ),
    ],
  );
}
