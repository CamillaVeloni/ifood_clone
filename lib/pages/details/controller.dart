import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rect_getter/rect_getter.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../../core/utils/loading_status.dart';
import '/core/models/business.dart';

class BusinessDetailsController extends GetxController with GetSingleTickerProviderStateMixin {
  final isCollapsed = false.obs;
  late AutoScrollController scrollController;
  late TabController tabController;

  final loadingStatus = LoadingStatus.loading.obs;

  late BusinessRestModel _business;
  final expandedHeight = 350.0;
  final collapsedHeight = kToolbarHeight;

  final listViewKey = RectGetter.createGlobalKey();
  final itemKeys = <int, dynamic>{};

  // prevent animate when press on tab bar
  bool pauseRectGetterIndex = false;

  BusinessRestModel get business => _business;

  @override
  void onInit() {
    _business = Get.arguments as BusinessRestModel;

    tabController = TabController(length: business.categoriesMenu.length, vsync: this);
    scrollController = AutoScrollController();
    super.onInit();
  }

  @override
  void dispose() {
    scrollController.dispose();
    tabController.dispose();
    super.dispose();
  }

  List<int> getVisibleItemsIndex() {
    Rect? rect = RectGetter.getRectFromKey(listViewKey);
    List<int> items = [];
    if (rect == null) return items;
    itemKeys.forEach((index, key) {
      Rect? itemRect = RectGetter.getRectFromKey(key);
      if (itemRect == null) return;
      if (itemRect.top > rect.bottom) return;
      if (itemRect.bottom < rect.top) return;
      items.add(index);
    });
    return items;
  }

  void onCollapsed(bool value) {
    if (isCollapsed.value == value) return;
    isCollapsed.value = value;
  }

  bool onScrollNotification(ScrollNotification notification) {
    if (pauseRectGetterIndex) return true;
    int lastTabIndex = tabController.length - 1;
    List<int> visibleItems = getVisibleItemsIndex();

    bool reachLastTabIndex = visibleItems.isNotEmpty && visibleItems.length <= 2 && visibleItems.last == lastTabIndex;
    if (reachLastTabIndex) {
      tabController.animateTo(lastTabIndex);
    } else if (visibleItems.isNotEmpty) {
      int sumIndex = visibleItems.reduce((value, element) => value + element);
      int middleIndex = sumIndex ~/ visibleItems.length;
      if (tabController.index != middleIndex) tabController.animateTo(middleIndex);
    }
    return false;
  }

  void animateAndScrollTo(int index) {
    pauseRectGetterIndex = true;
    tabController.animateTo(index);
    scrollController
        .scrollToIndex(index, preferPosition: AutoScrollPosition.begin)
        .then((value) => pauseRectGetterIndex = false);
  }

}