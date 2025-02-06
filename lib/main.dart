import 'package:bloc_example/src/common/di/dependency_injector.dart';
import 'package:bloc_example/src/common/hydrated_storage_init/hydrated_storage_init.dart';
import 'package:bloc_example/src/common/observer/bloc_observer.dart';
import 'package:bloc_example/src/common/router/routing_config.dart';
import 'package:bloc_example/src/feature/dog/presentation/dog_page.dart';
import 'package:bloc_example/src/feature/planet/presentation/planet_page.dart';
import 'package:bloc_example/src/feature/splash/bloc/splash_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initHydratedStorage();
  Bloc.observer = MyBlocObserver();
  try {
    await DependencyInjection().init();
  } catch (e) {
    debugPrint("An error is occurs during DI initialisation -------> $e");
  }
  runApp(MultiBlocProvider(
    providers: [BlocProvider(create: (_) => SplashBloc()..add(SplashViewed()))],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRoutingConfig().getRouter(),
    );
  }
}
