import 'package:flutter/material.dart';
import 'package:flutter_firebase_chatapp/app/store/config.dart';
import 'package:flutter_firebase_chatapp/common/models/user.dart';
import 'package:flutter_firebase_chatapp/utils/index.dart';
import 'package:get/get.dart';

class RouteWelcomeMiddleware extends GetMiddleware {
  @override
  int? priority = 0;
  RouteWelcomeMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    print(
        "🚀 ~ RouteWelcomeMiddleware ~ RouteSettings?redirect ~ ConfigStore.to.isFirstOpen: ${ConfigStore.to.isFirstOpen}");
    if (ConfigStore.to.isFirstOpen == false) {
      return null;
    } else if (UserStore.to.isLogin == true) {
      return const RouteSettings(name: AppRoutes.Application);
    } else {
      return const RouteSettings(name: AppRoutes.SIGN_IN);
    }
  }
}
