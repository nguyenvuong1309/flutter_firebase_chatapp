import 'package:flutter_firebase_chatapp/modules/contacts/pages/contact-list/index.dart';
import 'package:get/get.dart';

import 'Application.controller.dart';

class ApplicationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApplicationController>(() => ApplicationController());
    Get.lazyPut<ContactController>(() => ContactController());
  }
}
