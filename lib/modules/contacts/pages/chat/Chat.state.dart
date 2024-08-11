import 'package:get/get.dart';

class ChatState {
  RxList<dynamic> msgcontentList = <dynamic>[].obs;
  var to_uid = "".obs;
  var to_name = "".obs;
  var to_avatar = "".obs;
  var to_location = "unkown".obs;
}
