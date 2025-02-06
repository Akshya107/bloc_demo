part of 'dogs_bloc.dart';

sealed class DogsState extends Equatable {
  const DogsState();
}

final class DogsLoading extends DogsState {
  @override
  List<Object> get props => [];
}

final class DogFetchedSuccessfully extends DogsState {
  final DogsModel info;

  const DogFetchedSuccessfully({required this.info});

  @override
  List<Object?> get props => [info];
}

final class DogsNotFound extends DogsState {
  @override
  List<Object> get props => [];
}

final class DogsError extends DogsState {
  final int code;

  const DogsError({required this.code});

  @override
  List<Object> get props => [code];
}
