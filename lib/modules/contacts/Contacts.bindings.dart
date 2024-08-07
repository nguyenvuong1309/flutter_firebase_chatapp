import 'package:get/get.dart';

import 'Contacts.controller.dart';

class ContactBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContactController>(() => ContactController());
  }
}
