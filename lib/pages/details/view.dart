import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rect_getter/rect_getter.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import 'widgets/index.dart';

import 'controller.dart';

class BusinessDetailsPage extends GetView<BusinessDetailsController> {
  const BusinessDetailsPage({Key? key}) : super(key: key);

  Widget get _getAppBar => CustomAppBar(
    data: controller.business,
    context: Get.context!,
    scrollController: controller.scrollController,
    expandedHeight: controller.expandedHeight,
    collapsedHeight: controller.collapsedHeight,
    isCollapsed: controller.isCollapsed,
    onCollapsed: controller.onCollapsed,
    tabController: controller.tabController,
    onTap: (index) => controller.animateAndScrollTo(index),
  );

  SliverList get _getBody => SliverList(
    delegate: SliverChildBuilderDelegate(
          (context, index) => buildMenuItem(index),
      childCount: controller.business.categoriesMenu.length,
    ),
  );

  Widget buildMenuItem(int index) {
    controller.itemKeys[index] = RectGetter.createGlobalKey();
    final categoryMenu = controller.business.categoriesMenu[index];

    return RectGetter(
      key: controller.itemKeys[index],
      child: AutoScrollTag(
        key: ValueKey(index),
        index: index,
        controller: controller.scrollController,
        child: CategorySection(categoryMenu: categoryMenu, isFirst: index == 0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: RectGetter(
        key: controller.listViewKey,
        child: NotificationListener<ScrollNotification>(
          onNotification: controller.onScrollNotification,
          child: CustomScrollView(
            controller: controller.scrollController,
            slivers: [
              _getAppBar,
              _getBody,
            ],
          ),
        ),
      ),
    );
  }
}
