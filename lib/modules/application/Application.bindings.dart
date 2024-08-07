import 'package:get/get.dart';

import 'Application.controller.dart';

class ApplicationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApplicationController>(() => ApplicationController());
  }
}
