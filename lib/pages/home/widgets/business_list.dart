import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller.dart';
import 'business_item_card.dart';

class BusinessList extends StatelessWidget {
  const BusinessList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(builder: (controller) {
      return SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            final item = controller.listOfBusiness[index];
            return BusinessItemCard(
              name: item.name,
              category: item.categories.first.title,
              rating: item.rating,
              imageUrl: item.photoUrl,
              onTap: () {
                // for now only. use hive for storage
                controller.addOnLastSeenList(item);
                // go to detail page
                Get.toNamed('/business_detail');
              },
            );
          },
          childCount: controller.listOfBusiness.length,
        ),
      );
    });
  }
}
