import 'package:get/get.dart';

import '../../pages/details/controller.dart';
import '../../pages/home/controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}

class BusinessDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BusinessDetailsController());
  }
}