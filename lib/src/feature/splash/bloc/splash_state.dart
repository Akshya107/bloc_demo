part of 'splash_bloc.dart';

sealed class SplashState extends Equatable {
  const SplashState();
}

final class SplashLoadedState extends SplashState {
  @override
  List<Object> get props => [];
}

final class SplashShowedState extends SplashState {
  @override
  List<Object> get props => [];
}
