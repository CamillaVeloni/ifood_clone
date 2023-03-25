import 'package:json_annotation/json_annotation.dart';

import 'category_menu.dart';
import 'sub_category.dart';

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
  @JsonKey(name: "categories_menu")
  final List<CategoryMenuRestModel> categoriesMenu;
  @JsonKey(name: 'photo_url')
  final String photoUrl;
  @JsonKey(name: 'banner_url')
  final String bannerUrl;
  // final List<ReviewRestModel>? reviews;

  BusinessRestModel({
    required this.id,
    required this.name,
    required this.rating,
    required this.reviewCount,
    required this.price,
    required this.categories,
    required this.categoriesMenu,
    required this.photoUrl,
    required this.bannerUrl,
    // required this.reviews,
  });

  factory BusinessRestModel.fromJson(Map<String, dynamic> json) => _$BusinessRestModelFromJson(json);
  Map<String, dynamic> toJson() => _$BusinessRestModelToJson(this);
}