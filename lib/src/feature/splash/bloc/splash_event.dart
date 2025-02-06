part of 'splash_bloc.dart';

sealed class SplashEvent extends Equatable {
  const SplashEvent();
}
class SplashViewed extends SplashEvent {
  @override
  List<Object?> get props => [];
}


