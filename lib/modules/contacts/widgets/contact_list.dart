import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_firebase_chatapp/modules/contacts/pages/Contacts.controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_firebase_chatapp/utils/color.utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_firebase_chatapp/common/services/FireStoreService.dart';
import 'package:get/get.dart';

class ContactList extends GetView<ContactController> {
  const ContactList({Key? key}) : super(key: key);
  Widget BuildListItem(UserData item) {
    print("🚀 ~ ContactList ~ WidgetBuildListItem ~ ${item.photourl}");
    return Container(
        padding: EdgeInsets.only(top: 15.w, left: 15.w, right: 15.w),
        child: InkWell(
            onTap: () {
              if (item.id != null) {
                controller.goChat(item);
              }
            },
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding:
                          EdgeInsets.only(top: 0.w, left: 0.w, right: 15.w),
                      child: SizedBox(
                          width: 54.w,
                          height: 54.w,
                          child: CachedNetworkImage(
                              imageUrl: "${item.photourl}"))),
                  Container(
                      width: 250.w,
                      padding: EdgeInsets.only(
                          top: 15.w, left: 0.w, right: 0.w, bottom: 0.w),
                      decoration: const BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(width: 1, color: Color(0xffe5efe5))),
                      ),
                      child: Row(children: [
                        SizedBox(
                            width: 200.w,
                            height: 42.w,
                            child: Text(item.name ?? "",
                                style: TextStyle(
                                    fontFamily: "Avenir",
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.thirdElement,
                                    fontSize: 16.sp)))
                      ]))
                ])));
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => CustomScrollView(slivers: [
          SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 0.w, horizontal: 0.w),
              sliver: SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                // print(
                //     "🚀 ~ ContactList ~ delegate:SliverChildBuilderDelegate ~ ${controller.state.contactList?.length}");
                // var item = controller.state.contactList[index];
                // print(">> item $item");
                // return BuildListItem(item);
                if (controller.state.contactList != null &&
                    index < controller.state.contactList.length) {
                  var item = controller.state.contactList[index];

                  return BuildListItem(item);
                } else {
                  // Optionally handle the case where the list is null or index is out of bounds
                  return SizedBox.shrink(); // Or any other placeholder
                }
              }, childCount: controller.state.contactList.length)))
        ]));
  }
}
