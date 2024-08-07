import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase_chatapp/common/models/user.dart';
import 'package:flutter_firebase_chatapp/common/services/FireStoreService.dart';
import 'package:get/get.dart';

import 'Contacts.state.dart';

class ContactController extends GetxController {
  ContactController();
  final ContactState state = ContactState();
  final db = FirebaseFirestore.instance;
  final token = UserStore.to.token;

  @override
  void onReady() {
    super.onReady();
    asyncLoadAllData();
  }

  asyncLoadAllData() async {
    var usersbase = await db
        .collection("users")
        .where("id", isNotEqualTo: token)
        .withConverter(
            fromFirestore: UserData.fromFirestore,
            toFirestore: (UserData userdata, options) => userdata.toFirestore())
        .get();
    for(var doc in usersbase.docs){
      state.contactList.add(doc.data());
    }
  }
}
