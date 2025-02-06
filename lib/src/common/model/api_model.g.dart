// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiModel _$ApiModelFromJson(Map<String, dynamic> json) => ApiModel(
      json['succes'] as bool?,
      json['data'],
      json['error'],
      json['status'] as String?,
      json['message'] as String?,
    );

Map<String, dynamic> _$ApiModelToJson(ApiModel instance) => <String, dynamic>{
      'succes': instance.succes,
      'data': instance.data,
      'error': instance.error,
      'status': instance.status,
      'message': instance.message,
    };
