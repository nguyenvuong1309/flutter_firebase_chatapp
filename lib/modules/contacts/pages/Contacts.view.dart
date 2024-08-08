import 'package:flutter/material.dart';
import 'package:flutter_firebase_chatapp/common/wigets/index.dart';
import 'package:flutter_firebase_chatapp/modules/contacts/widgets/contact_list.dart';
import 'package:flutter_firebase_chatapp/utils/color.utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_firebase_chatapp/modules/contacts/pages/index.dart';
import 'package:get/get.dart';

class ContactPage extends GetView<ContactController> {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("🚀 ~ ContactPage ~ Widgetbuild ~ BuildContext:${controller.state.contactList.length}");
    AppBar _buildAppBar() {
      return transparentAppBar(
          titleText: "Contact",
          titleStyle:
              TextStyle(color: AppColors.white, fontWeight: FontWeight.w900),
          backgroundGradient: AppColors.primaryBackground);
    }

    return Scaffold(
      appBar: _buildAppBar(),
      body: ContactList(),
    );
  }   
}
