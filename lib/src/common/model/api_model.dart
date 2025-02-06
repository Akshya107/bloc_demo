import 'package:json_annotation/json_annotation.dart';

part 'api_model.g.dart';

@JsonSerializable()
class ApiModel {
  final bool? succes;
  final dynamic data;
  final dynamic error;
  final String? status;
  final String? message;

  ApiModel(this.succes, this.data, this.error, this.status, this.message);

  factory ApiModel.fromJson(Map<String, dynamic> json) =>
      _$ApiModelFromJson(json);
}
