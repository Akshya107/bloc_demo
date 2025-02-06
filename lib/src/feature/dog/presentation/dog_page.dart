import 'package:bloc_example/src/common/widgets/app_loading.dart';
import 'package:bloc_example/src/common/widgets/cache_image_place_holder.dart';
import 'package:bloc_example/src/common/widgets/error_found_widget.dart';
import 'package:bloc_example/src/common/widgets/not_found_widget.dart';
import 'package:bloc_example/src/feature/dog/bloc/dogs_bloc.dart';
import 'package:bloc_example/src/feature/dog/domain/repo/dog_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class DogPage extends StatelessWidget {
  const DogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DogsBloc, DogsState>(
        builder: (context, state) {
          switch (state.runtimeType) {
            case DogsError:
              var st = state as DogsError;
              return ErrorFoundWidget(error: st.code.toString());
            case DogsNotFound:
              return NotFoundWidget(message: "Dog not found!");
            case DogFetchedSuccessfully:
              var st = state as DogFetchedSuccessfully;
              return Center(
                  child: CacheImagePlaceHolder(url: st.info.message!));
            default:
              return Center(
                child: AppLoading(),
              );
          }
        },
      ),
    );
  }
}
