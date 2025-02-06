import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:replay_bloc/replay_bloc.dart';

part 'splash_event.dart';

part 'splash_state.dart';


class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashLoadedState()) {
    on<SplashViewed>(onSplashViewedEvent);
  }

  FutureOr<void> onSplashViewedEvent(event, emit) async {
    await Future.delayed(const Duration(seconds: 2));
    emit(SplashShowedState());
  }
}
