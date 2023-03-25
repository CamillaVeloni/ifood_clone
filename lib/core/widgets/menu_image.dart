import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MenuImage extends StatelessWidget {
  final double? width;
  final double? height;
  final String imageUrl;
  const MenuImage({Key? key, required this.imageUrl, this.width = 84, this.height = 60}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.all(6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          image: DecorationImage(
            image: CachedNetworkImageProvider(imageUrl),
            fit: BoxFit.cover,
          )
      ),
    );
  }
}