import 'package:json_annotation/json_annotation.dart';

part 'planet_model.g.dart';

@JsonSerializable()
class PlanetModel {
  bool? success;
  List<PlanetModelData>? data;

  PlanetModel();

  factory PlanetModel.fromJson(Map<String, dynamic> json) =>
      _$PlanetModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlanetModelToJson(this);
}

@JsonSerializable()
class PlanetModelData {
  @JsonKey(name: "_id")
  String? id;
  String? name;
  int? orderFromSun;
  bool? hasRings;
  List<dynamic>? mainAtmosphere;
  PlanetModelDataSurfaceTemperatureC? surfaceTemperatureC;

  PlanetModelData(this.name);

  factory PlanetModelData.fromJson(Map<String, dynamic> json) =>
      _$PlanetModelDataFromJson(json);

  Map<String, dynamic> toJson() => _$PlanetModelDataToJson(this);
}

@JsonSerializable()
class PlanetModelDataSurfaceTemperatureC {
  int? min;
  int? max;
  int? mean;

  PlanetModelDataSurfaceTemperatureC();

  factory PlanetModelDataSurfaceTemperatureC.fromJson(
      Map<String, dynamic> json) =>
      _$PlanetModelDataSurfaceTemperatureCFromJson(json);

  Map<String, dynamic> toJson() => _$PlanetModelDataSurfaceTemperatureCToJson(this);
}
