import 'package:flutter/material.dart';

import '../../../core/styles/styles.dart';

class SubcategoryItem extends StatelessWidget {
  final String name;
  final String photo;
  final Color color;
  const SubcategoryItem({Key? key, required this.name, required this.photo, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('categoria $name');
      },
      child: SizedBox(
        width: 100,
        child: Stack(
          children: <Widget>[
            Container(
              width: 100,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                color: color,
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: const EdgeInsets.all(6),
                padding: const EdgeInsets.all(4),
                child: Image.asset('assets/images/subcategories/$photo', width: 70, height: 70),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Text(
                  name,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: kTextColor, ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
