import 'package:bloc_example/src/feature/dog/domain/model/dogs_model.dart';

abstract class DogRepo {
  Future<DogsModel?> fetchDog();
}