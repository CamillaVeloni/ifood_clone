import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utils/utils.dart';
import '/core/models/business.dart';

class HomeController extends GetxController {
  String address = 'R. da República, 102';

  // carousel control
  final activePage = 0.obs;
  late PageController _pageController;
  PageController get pageController => _pageController;
  void changeActivePage(v) => activePage.value = v;

  // last seen
  final lastSeenList = <Business>[];

  // banners
  List<String> allBanners = [
    "banner_01.png",
    "banner_02.png",
    "banner_03.png",
    "banner_04.png",
    "banner_05.png",
  ];
  late String randomBanner;

  @override
  void onInit() {
    _pageController = PageController(viewportFraction: 0.8);
    randomBanner = allBanners[Utils.next(0, 5)];

    super.onInit();
  }

}