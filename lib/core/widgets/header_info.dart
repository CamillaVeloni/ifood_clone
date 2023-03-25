import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import '../utils/utils.dart';
import 'circle_image.dart';

class HeaderInfo extends StatelessWidget {
  final String name;
  final String category;
  final String price;
  final String imageUrl;
  final String bannerUrl;
  final BuildContext context;

  const HeaderInfo({
    Key? key,
    required this.imageUrl,
    required this.context,
    required this.name,
    required this.category,
    required this.bannerUrl,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext _) {
    return Column(
      children: [
        SizedBox(
          height: 130,
          width: double.infinity,
          child: CachedNetworkImage(
            imageUrl: bannerUrl,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(name,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Text(
                      '${category.capitalize} ${Utils.bullet} 2,9km ${Utils.bullet} $price',
                      style:
                          TextStyle(fontSize: 16, color: Colors.grey.shade800),
                    ),
                  ],
                ),
              ),
              CircleImage(
                imageUrl: imageUrl,
                height: 50,
                width: 50,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
