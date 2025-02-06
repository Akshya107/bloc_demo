import 'package:bloc_example/src/feature/planet/domain/model/planet_model.dart';
import 'package:bloc_example/src/feature/planet/domain/repo/planet_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'planet_event.dart';

part 'planet_state.dart';

class PlanetBloc extends HydratedBloc<PlanetEvent, PlanetState> {
  final PlanetRepo repo;

  PlanetBloc({required this.repo}) : super(PlanetLoading()) {
    on<FetchPlanets>(onFetchPlanets);
  }

  onFetchPlanets(FetchPlanets event, Emitter<PlanetState> emit) async {
    try {
      List<PlanetModelData>? planets = await repo.fetchPlanets();
      if (planets != null && planets.isNotEmpty) {
        emit(PlanetLoaded(data: planets));
      } else {
        emit(PlanetNotFound());
      }
    } catch (e) {
      emit(PlanetError(errorCode: 300));
    }
  }

  @override
  Map<String, dynamic>? toJson(PlanetState state) {
    if (state is PlanetLoaded) {
      return {'planets': state.data.map((p) => p.toJson()).toList()};
    }
    return null;
  }

  @override
  PlanetState? fromJson(Map<String, dynamic> json) {
    try {
      if (json['planets'] != null) {
        final planets = (json['planets'] as List)
            .map((e) => PlanetModelData.fromJson(e))
            .toList();
        return PlanetLoaded(data: planets);
      }
    } catch (_) {}
    return null;
  }
}
