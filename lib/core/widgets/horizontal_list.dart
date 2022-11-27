import 'package:flutter/material.dart';

import '../../pages/home/widgets/category_item.dart';
import '../../pages/home/widgets/subcategory_item.dart';

class HorizontalList extends StatelessWidget {
  final String? title;
  final List<dynamic> list;
  final bool isContainerNormal;

  const HorizontalList(
      {Key? key,
      this.title,
      required this.list, this.isContainerNormal = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (title != null)
              Padding(
                padding: const EdgeInsets.all(6),
                child: Text(
                  title!,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 19),
                ),
              ),
            if (list.isNotEmpty) SizedBox(
              height: 100,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: list.length,
                itemBuilder: (__, int index) {
                  final item = list[index];
                  // return itemContainer(item);
                  return isContainerNormal
                      ? CategoryItem(
                    name: item.name,
                    photoAsset: item.photoUrl,
                  ) : SubcategoryItem(
                    name: item.name,
                    photo: item.photoUrl,
                    color: item.color,
                  );
                },
                separatorBuilder: (__, _) => const SizedBox(
                  width: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
