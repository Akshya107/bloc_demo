import 'package:bloc_example/src/feature/planet/domain/model/planet_model.dart';
import 'package:flutter/material.dart';

class PlanetList extends StatefulWidget {
  final List<PlanetModelData> data;

  const PlanetList({super.key, required this.data});

  @override
  State<PlanetList> createState() => _PlanetListTileState();
}

class _PlanetListTileState extends State<PlanetList> {
  late List<PlanetModelData> list;

  @override
  void initState() {
    list = widget.data;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (context, index) => ListTile(
              title: Text(list[index].name ?? ''),
              subtitle: Text(list[index].orderFromSun.toString()),
            ),
        separatorBuilder: (context, index) => Divider(),
        itemCount: list.length);
  }
}
