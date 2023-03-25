import 'package:json_annotation/json_annotation.dart';

part 'sub_category.g.dart';

@JsonSerializable()
class CategoryRestModel {
  String title;

  CategoryRestModel({required this.title});

  factory CategoryRestModel.fromJson(Map<String, dynamic> json) => _$CategoryRestModelFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryRestModelToJson(this);
}