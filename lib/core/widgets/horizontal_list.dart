import 'package:flutter/material.dart';

import '../../pages/home/widgets/category_item.dart';
import '../../pages/home/widgets/subcategory_item.dart';

enum TypeOfContainer {
  normal,
  circle,
  colored,
}

class HorizontalList extends StatelessWidget {
  final String? title;
  final List<dynamic> list;
  final TypeOfContainer itemType;

  const HorizontalList(
      {Key? key,
      this.title,
      required this.list,
      this.itemType = TypeOfContainer.normal})
      : super(key: key);

  Widget itemContainer(dynamic itemList) {
    final type = <TypeOfContainer, Widget>{
      TypeOfContainer.normal: CategoryItem(
        name: itemList.name,
        photoAsset: itemList.photoUrl,
      ),
      TypeOfContainer.circle: const CircleAvatar(),
      TypeOfContainer.colored: SubcategoryItem(
        name: itemList.name,
        photo: itemList.photoUrl,
        color: itemList.color,
      ),
    };
    final item = type.entries.where((element) => element.key == itemType).first;

    return item.value;
  }

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
            SizedBox(
              height: 100,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: list.length,
                itemBuilder: (__, int index) {
                  final item = list[index];
                  return itemContainer(item);
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
