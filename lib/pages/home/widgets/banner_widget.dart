import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../controller.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: <Widget>[
          GetBuilder<HomeController>(builder: (controller) {
            return Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                    'assets/images/${controller.randomBanner}',
                    fit: BoxFit.cover),
              ),
            );
          }),
          Divider(thickness: 3, color: Colors.grey.shade300),
        ],
      ),
    );
  }
}
