import 'dart:async';
import 'package:bloc_example/src/feature/dog/domain/model/dogs_model.dart';
import 'package:bloc_example/src/feature/dog/domain/repo/dog_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'dogs_event.dart';

part 'dogs_state.dart';

class DogsBloc extends HydratedBloc<DogsEvent, DogsState> {
  final DogRepo repo;

  DogsBloc({required this.repo}) : super(DogsLoading()) {
    on<FetchDog>(onFetchDog);
  }

  onFetchDog(FetchDog event, Emitter<DogsState> emit) async {
    try {
      DogsModel? data = await repo.fetchDog();
      if (data != null) {
        emit(DogFetchedSuccessfully(info: data));
      } else {
        emit(DogsNotFound());
      }
    } catch (e) {
      debugPrint(e.toString());
      emit(DogsError(code: 400));
    }
  }

  @override
  Map<String, dynamic>? toJson(DogsState state) {
    if (state is DogFetchedSuccessfully) {
      return {'dog': state.info.toJson()};
    }
    return null;
  }

  @override
  DogsState? fromJson(Map<String, dynamic> json) {
    try {
      if (json['dog'] != null) {
        final dog = DogsModel.fromJson(json['dog']);
        return DogFetchedSuccessfully(info: dog);
      }
    } catch (_) {}
    return null;
  }
}
