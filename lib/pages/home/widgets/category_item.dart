import 'package:flutter/material.dart';

import '../../../core/styles/styles.dart';

class CategoryItem extends StatelessWidget {
  final String name;
  final String photoAsset;

  const CategoryItem({required this.name, required this.photoAsset, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('categoria $name');
      },
      child: Column(
        children: <Widget>[
          Container(
            width: 60,
            height: 60,
            margin: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.asset('assets/images/categories/$photoAsset'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(name, style: const TextStyle(color: kTextColor),),
          ),
        ],
      ),
    );
  }
}
