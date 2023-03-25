import 'package:json_annotation/json_annotation.dart';

part 'menu.g.dart';

@JsonSerializable()
class MenuRestModel {
  String name;
  String description;
  double price;
  @JsonKey(name: "image_url")
  String imageUrl;

  MenuRestModel(
      {required this.name,
      required this.description,
      required this.price,
      required this.imageUrl});

  factory MenuRestModel.fromJson(Map<String, dynamic> json) => _$MenuRestModelFromJson(json);

  Map<String, dynamic> toJson() => _$MenuRestModelToJson(this);
}
