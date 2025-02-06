import 'package:bloc_example/src/common/widgets/app_loading.dart';
import 'package:bloc_example/src/common/widgets/error_found_widget.dart';
import 'package:bloc_example/src/feature/planet/bloc/planet_bloc.dart';
import 'package:bloc_example/src/feature/planet/domain/repo/planet_repo.dart';
import 'package:bloc_example/src/feature/planet/presentation/planet_list.dart';
import 'package:bloc_example/src/common/widgets/not_found_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class PlanetPage extends StatefulWidget {
  const PlanetPage({super.key});

  @override
  State<PlanetPage> createState() => _PlanetPageState();
}

class _PlanetPageState extends State<PlanetPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PlanetBloc, PlanetState>(
        builder: (context, state) {
          switch (state.runtimeType) {
            case PlanetLoaded:
              var st = state as PlanetLoaded;
              return PlanetList(data: st.data);
            case PlanetNotFound:
              return NotFoundWidget(
                message: "Planets not found!",
              );
            case PlanetError:
              var st = state as PlanetError;
              return ErrorFoundWidget(error: st.errorCode.toString());
            default:
              return AppLoading();
          }
        },
      ),
    );
  }
}
