import 'package:flutter/material.dart';
import 'package:flutter_firebase_chatapp/modules/contacts/pages/Contacts.view.dart';
import 'package:flutter_firebase_chatapp/utils/color.utils.dart';
import 'package:get/get.dart';
import 'Application.controller.dart';

class ApplicationPage extends GetView<ApplicationController> {
  const ApplicationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _buildPageView() {
      return PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller.pageController,
          onPageChanged: controller.handlePageChanged,
          children: [
            Center(
              child: Text("chat"),
            ),
            ContactPage(),
            Center(child: Text("profile")),
          ]);
    }

    Widget _buildBottomNavigationBar() {
      return Obx(() => BottomNavigationBar(
            items: controller.bottomTabs,
            currentIndex: controller.state.page,
            type: BottomNavigationBarType.fixed,
            onTap: controller.handleNavBarTap,
            showUnselectedLabels: true,
            showSelectedLabels: true,
            unselectedItemColor: AppColors.grey,
            selectedItemColor: AppColors.blue,
          ));
    }

    return Scaffold(
      body: _buildPageView(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}
