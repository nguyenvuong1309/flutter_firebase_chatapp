import 'package:flutter_firebase_chatapp/common/services/FireStoreService.dart';
import 'package:get/get.dart';

class ContactState {
  var count = 0.obs;
  RxList<UserData> contactList = <UserData>[].obs;
}
