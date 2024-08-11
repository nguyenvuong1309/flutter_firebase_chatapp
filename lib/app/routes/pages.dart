import 'package:flutter/material.dart';
import 'package:flutter_firebase_chatapp/common/middlewares/router_welcome.dart';
import 'package:flutter_firebase_chatapp/modules/application/index.dart';
import 'package:flutter_firebase_chatapp/modules/auth/pages/sign_in/index.dart';
import 'package:flutter_firebase_chatapp/modules/contacts/pages/chat/index.dart';
import 'package:flutter_firebase_chatapp/modules/contacts/pages/contact-list/index.dart';
import 'package:flutter_firebase_chatapp/modules/welcome/index.dart';
import 'package:flutter_firebase_chatapp/utils/constant.utils.dart';
import 'package:get/get.dart';

class AppPages {
  static const INITIAL = AppRoutes.INITIAL;
  static const SIGN_IN = AppRoutes.SIGN_IN;
  static const Application = AppRoutes.Application;
  static final RouteObserver<Route> observer = RouteObserver();
  static List<String> history = [];

  static final List<GetPage> routes = [
    GetPage(
        name: AppRoutes.INITIAL,
        page: () => const WelcomePage(),
        binding: WelcomeBinding(),
        middlewares: [RouteWelcomeMiddleware(priority: 1)]),
    GetPage(
      name: AppRoutes.SIGN_IN,
      page: () => const SignInPage(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: AppRoutes.Application,
      page: () => const ApplicationPage(),
      binding: ApplicationBinding(),
    ),
    GetPage(
      name: AppRoutes.Contact,
      page: () => const ContactPage(),
      binding: ContactBinding(),
    ),
    GetPage(
      name: AppRoutes.Chat,
      page: () => const ChatPage(),
      binding: ChatBinding(),
    )
  ];
}
