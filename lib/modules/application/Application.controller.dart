import 'package:flutter/material.dart';
import 'package:flutter_firebase_chatapp/utils/index.dart';
import 'package:get/get.dart';
import 'index.dart';

class ApplicationController extends GetxController {
  final state = ApplicationState();
  ApplicationController();

  late final List<String> tabTitles;
  late final PageController pageController;
  late final List<BottomNavigationBarItem> bottomTabs;

  void handlePageChanged(int index) {
    state.page = index;
  }

  void handleNavBarTap(int index){
    pageController.jumpToPage(index);
  }

  @override
  void onInit() {
    super.onInit();
    tabTitles = ['Chat', 'Contact', 'Profile'];
    bottomTabs = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
          icon: Icon(Icons.message, color: AppColors.grey),
          activeIcon: Icon(Icons.message, color: AppColors.blue),
          label: 'Chat',
          backgroundColor: Color.fromARGB(31, 184, 8, 233)),
      const BottomNavigationBarItem(
          icon: Icon(Icons.contact_page, color: AppColors.grey),
          activeIcon: Icon(Icons.contact_page, color: AppColors.blue),
          label: 'Contact',
          backgroundColor: Color.fromARGB(31, 184, 8, 233)),
      const BottomNavigationBarItem(
          icon: Icon(Icons.person, color: AppColors.grey),
          activeIcon: Icon(Icons.person, color: AppColors.blue),
          label: 'Profile',
          backgroundColor: Color.fromARGB(31, 184, 8, 233))
    ];
    pageController = PageController(initialPage: state.page);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
