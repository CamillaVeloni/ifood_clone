import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller.dart';
import 'business_item.dart';

class BusinessList extends StatelessWidget {
  const BusinessList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(builder: (controller) {
      return SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            final item = controller.listOfBusiness[index];
            return BusinessWidget(
              name: item.name,
              category: item.categories.first.title,
              rating: item.rating,
              image: item.photoUrl,
            );
          },
          childCount: controller.listOfBusiness.length,
        ),
      );
    });
  }
}
