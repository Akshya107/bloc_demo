part of 'planet_bloc.dart';

sealed class PlanetEvent extends Equatable {
  const PlanetEvent();
}

class FetchPlanets extends PlanetEvent {
  @override
  List<Object?> get props => [];
}
