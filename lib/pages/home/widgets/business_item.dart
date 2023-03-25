import 'package:flutter/material.dart';

import '../../../core/styles/styles.dart';
import '../../../core/widgets/circle_image.dart';

class BusinessItem extends StatelessWidget {
  final String name;
  final String imageUrl;

  const BusinessItem({Key? key, required this.name, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('nome loja $name');
      },
      child: SizedBox(
        width: 90,
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 2,
              child: CircleImage(imageUrl: imageUrl),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  name,
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: kTextColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}