import 'package:flutter_firebase_chatapp/modules/welcome/controller.dart';
import 'package:get/get.dart';
import 'index.dart';

class SignInBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInController>(() => SignInController());
  }
}
