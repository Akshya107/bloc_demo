part of 'planet_bloc.dart';

sealed class PlanetState extends Equatable {
  const PlanetState();
}

final class PlanetLoading extends PlanetState {
  @override
  List<Object> get props => [];
}

final class PlanetNotFound extends PlanetState {
  @override
  List<Object> get props => [];
}

final class PlanetError extends PlanetState {
  final int errorCode;

  const PlanetError({required this.errorCode});

  @override
  List<Object> get props => [errorCode];
}

final class PlanetLoaded extends PlanetState {
  final List<PlanetModelData> data;

  const PlanetLoaded({required this.data});

  @override
  List<Object> get props => [data];
}
