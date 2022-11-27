import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller.dart';
import 'business_item.dart';

class BusinessHorizontalList extends StatelessWidget {
  final String title;
  final bool showFamousList;

  const BusinessHorizontalList({Key? key, required this.title, this.showFamousList = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    title,
                    style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                  ),
                  TextButton(onPressed: () {}, child: const Text('Ver mais')),
                ],
              ),
            ),
            GetBuilder<HomeController>(
              builder: (controller) {
                final list = showFamousList ? controller.mostFamousList : controller.lastSeenList;
                return list.isNotEmpty ? SizedBox(
                  height: 130,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: list.length,
                    itemBuilder: (__, int index) {
                      final item = list[index];
                      return BusinessItem(name: item.name, imageUrl: item.photoUrl,);
                    },
                    separatorBuilder: (__, _) => const SizedBox(
                      width: 12,
                    ),
                  ),
                ) : Container();
              }
            ),
          ],
        ),
      ),
    );
  }
}
