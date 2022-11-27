import 'package:json_annotation/json_annotation.dart';

import 'sub_category.dart';
import 'menu.dart';

part 'business.g.dart';

@JsonSerializable()
class BusinessRestModel {
  final int id;
  final String name;
  final int rating;
  @JsonKey(name: 'review_count')
  final int reviewCount;
  final String price;
  final List<CategoryRestModel> categories;
  @JsonKey(name: "menu_tags")
  final List<String> menuTags;
  final List<MenuRestModel> menu;
  @JsonKey(name: 'photo_url')
  final String photoUrl;
  // final List<ReviewRestModel>? reviews;

  BusinessRestModel({
    required this.id,
    required this.name,
    required this.rating,
    required this.reviewCount,
    required this.price,
    required this.categories,
    required this.menuTags,
    required this.menu,
    required this.photoUrl,
    // required this.reviews,
  });

  factory BusinessRestModel.fromJson(Map<String, dynamic> json) => _$BusinessFromJson(json);
  Map<String, dynamic> toJson() => _$BusinessToJson(this);
}