import 'package:bloc_example/src/common/router/route_name.dart';
import 'package:bloc_example/src/feature/dog/bloc/dogs_bloc.dart';
import 'package:bloc_example/src/feature/dog/domain/repo/dog_repo.dart';
import 'package:bloc_example/src/feature/dog/presentation/dog_page.dart';
import 'package:bloc_example/src/feature/planet/bloc/planet_bloc.dart';
import 'package:bloc_example/src/feature/planet/domain/repo/planet_repo.dart';
import 'package:bloc_example/src/feature/planet/presentation/planet_page.dart';
import 'package:bloc_example/src/feature/splash/presentation/splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRoutingConfig {
  late final GoRouter _router;

  AppRoutingConfig() {
    _router = GoRouter(
        navigatorKey: _rootNavigatorKey,
        initialLocation: RouteName.splashScreenPath,
        routes: [
          GoRoute(
            name: RouteName.splashScreen,
            path: RouteName.splashScreenPath,
            builder: (context, state) => SplashPage(),
          ),
          GoRoute(
            name: RouteName.dogScreen,
            path: RouteName.dogScreenPath,
            builder: (context, state) => BlocProvider<DogsBloc>(
              create: (context) =>
                  DogsBloc(repo: GetIt.I<DogRepo>())..add(FetchDog()),
              child: DogPage(),
            ),
          ),
          GoRoute(
            name: RouteName.planetScreen,
            path: RouteName.planetScreenPath,
            builder: (context, state) => BlocProvider<PlanetBloc>(
              create: (context) =>
                  PlanetBloc(repo: GetIt.I<PlanetRepo>())..add(FetchPlanets()),
              child: PlanetPage(),
            ),
          ),
        ]);
  }

  GoRouter getRouter() {
    return _router;
  }
}
