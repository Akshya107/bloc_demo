// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dogs_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DogsModel _$DogsModelFromJson(Map<String, dynamic> json) => DogsModel(
      json['message'] as String?,
    )..status = json['status'] as String?;

Map<String, dynamic> _$DogsModelToJson(DogsModel instance) => <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
    };
