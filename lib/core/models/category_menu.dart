import 'package:json_annotation/json_annotation.dart';

import 'menu.dart';

part 'category_menu.g.dart';

@JsonSerializable()
class CategoryMenuRestModel  {
  final String name;
  final String? subtitle;
  @JsonKey(name: "is_hot_sale")
  final bool isHotSale;
  final List<MenuRestModel> menu;

  CategoryMenuRestModel(
      {required this.name,
         this.subtitle,
        required this.isHotSale,
        required this.menu});

  factory CategoryMenuRestModel.fromJson(Map<String, dynamic> json) => _$CategoryMenuRestModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryMenuRestModelToJson(this);
}