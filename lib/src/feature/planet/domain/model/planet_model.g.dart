// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlanetModel _$PlanetModelFromJson(Map<String, dynamic> json) => PlanetModel()
  ..success = json['success'] as bool?
  ..data = (json['data'] as List<dynamic>?)
      ?.map((e) => PlanetModelData.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$PlanetModelToJson(PlanetModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };

PlanetModelData _$PlanetModelDataFromJson(Map<String, dynamic> json) =>
    PlanetModelData(
      json['name'] as String?,
    )
      ..id = json['_id'] as String?
      ..orderFromSun = (json['orderFromSun'] as num?)?.toInt()
      ..hasRings = json['hasRings'] as bool?
      ..mainAtmosphere = json['mainAtmosphere'] as List<dynamic>?
      ..surfaceTemperatureC = json['surfaceTemperatureC'] == null
          ? null
          : PlanetModelDataSurfaceTemperatureC.fromJson(
              json['surfaceTemperatureC'] as Map<String, dynamic>);

Map<String, dynamic> _$PlanetModelDataToJson(PlanetModelData instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'orderFromSun': instance.orderFromSun,
      'hasRings': instance.hasRings,
      'mainAtmosphere': instance.mainAtmosphere,
      'surfaceTemperatureC': instance.surfaceTemperatureC,
    };

PlanetModelDataSurfaceTemperatureC _$PlanetModelDataSurfaceTemperatureCFromJson(
        Map<String, dynamic> json) =>
    PlanetModelDataSurfaceTemperatureC()
      ..min = (json['min'] as num?)?.toInt()
      ..max = (json['max'] as num?)?.toInt()
      ..mean = (json['mean'] as num?)?.toInt();

Map<String, dynamic> _$PlanetModelDataSurfaceTemperatureCToJson(
        PlanetModelDataSurfaceTemperatureC instance) =>
    <String, dynamic>{
      'min': instance.min,
      'max': instance.max,
      'mean': instance.mean,
    };
