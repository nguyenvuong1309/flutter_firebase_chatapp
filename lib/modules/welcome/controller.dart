import 'package:flutter_firebase_chatapp/modules/welcome/index.dart';
import 'package:flutter_firebase_chatapp/utils/constant.utils.dart';
import 'package:get/get.dart';

import '../../app/store/config.dart';

class WelcomeController extends GetxController {
  final state = WelcomeState();
  WelcomeController();
  changePage(int index) async {
    state.index.value = index;
  }

  handleSignIn() async {
    print("🚀 ~ WelcomeController ~ handleSignIn ~ handleSignIn:");
    final res = await ConfigStore.to.saveAlreadyOpen();
    print("🚀 ~ WelcomeController ~ handleSignIn ~ $res:");
    Get.offAndToNamed(AppRoutes.SIGN_IN);
  }
}
