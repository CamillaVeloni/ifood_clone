import 'package:flutter/material.dart';

import '../../../core/styles/styles.dart';

class BusinessItem extends StatelessWidget {
  final String name;
  final String imageUrl;
  const BusinessItem({Key? key, required this.name, required this.imageUrl}) : super(key: key);

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
            Container(
              width: 80,
              height: 80,
              margin: const EdgeInsets.all(6),
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400,),
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                backgroundImage: NetworkImage(imageUrl),
                backgroundColor: Colors.transparent,
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  name,
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.center,
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
