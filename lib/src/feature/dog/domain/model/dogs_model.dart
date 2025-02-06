import 'package:json_annotation/json_annotation.dart';

part 'dogs_model.g.dart';

@JsonSerializable()
class DogsModel {
  String? message;
  String? status;

  DogsModel(this.message);

  factory DogsModel.fromJson(Map<String, dynamic> json) =>
      _$DogsModelFromJson(json);

  Map<String, dynamic> toJson() => _$DogsModelToJson(this);
}
