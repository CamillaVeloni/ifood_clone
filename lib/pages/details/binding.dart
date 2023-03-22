import 'package:get/get.dart';

import 'controller.dart';

class BusinessDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BusinessDetailsController());
  }
}