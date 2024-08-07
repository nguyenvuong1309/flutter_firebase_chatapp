import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_firebase_chatapp/modules/contacts/pages/Contacts.controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_firebase_chatapp/common/services/FireStoreService.dart';
import 'package:get/get.dart';

class ContactList extends GetView<ContactController> {
  const ContactList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget BuildListItem(UserData item) {
      return Container(
          child: InkWell(
              onTap: () {},
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        child: SizedBox(
                            width: 54.w,
                            height: 54.w,
                            child: CachedNetworkImage(
                                imageUrl: "${item.photourl}")))
                  ])));
    }

    return CustomScrollView(slivers: [
      SliverPadding(
          padding: EdgeInsets.symmetric(vertical: 0.w, horizontal: 0.w),
          sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            var item = controller.state.contactList[index];
            return Container();
          }, childCount: controller.state.contactList.length)))
    ]);
  }
}
