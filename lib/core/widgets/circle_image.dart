import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CircleImage extends StatelessWidget {
  final double? width;
  final double? height;
  final String imageUrl;
  const CircleImage({Key? key, required this.imageUrl, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.all(6),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400,),
          shape: BoxShape.circle,
          image: DecorationImage(
            image: CachedNetworkImageProvider(imageUrl),
            fit: BoxFit.cover,
          )
      ),
    );
  }
}
