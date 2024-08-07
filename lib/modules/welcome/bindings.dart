import 'package:flutter_firebase_chatapp/modules/welcome/controller.dart';
import 'package:get/get.dart';

class WelcomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WelcomeController>(() => WelcomeController());
  }
}
