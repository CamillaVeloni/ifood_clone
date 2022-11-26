import 'package:json_annotation/json_annotation.dart';

part 'menu.g.dart';

@JsonSerializable()
class Menu {
  String name;
  String description;
  double price;
  @JsonKey(name: "image_url")
  String imageUrl;
  String tag;

  Menu(
      {required this.name,
      required this.description,
      required this.price,
      required this.imageUrl,
      required this.tag});

  factory Menu.fromJson(Map<String, dynamic> json) => _$MenuFromJson(json);

  Map<String, dynamic> toJson() => _$MenuToJson(this);
}
