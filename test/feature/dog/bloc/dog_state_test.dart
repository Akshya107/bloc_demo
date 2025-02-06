import 'package:bloc_example/src/feature/dog/bloc/dogs_bloc.dart';
import 'package:bloc_example/src/feature/dog/domain/model/dogs_model.dart';
import 'package:flutter_test/flutter_test.dart';

var data = DogsModel("message");

void main() {
  group("Dog State Test", () {
    test("DogsLoading support comparison", () {
      expect(DogsLoading(), DogsLoading());
    });
    test("DogsNotFound support comparison", () {
      expect(DogsNotFound(), DogsNotFound());
    });
    test("DogFetchedSuccessfully support comparison", () {
      expect(DogFetchedSuccessfully(info: data),
          DogFetchedSuccessfully(info: data));
    });
    test("DogsError support comparison", () {
      expect(DogsError(code: 200), DogsError(code: 200));
    });
    test("DogsError with different error should not be equal", () {
      expect(DogsError(code: 300) == DogsError(code: 301), false);
    });
    test(
        "DogFetchedSuccessfully with different list of planet should not be equal",
        () {
      var data1 = DogsModel("other_message");
      expect(
          DogFetchedSuccessfully(info: data) ==
              DogFetchedSuccessfully(info: data1),
          false);
    });
  });
}
