import 'dart:ui';

import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../common/services/StorageService.dart';

class ConfigStore extends GetxController {
  static ConfigStore get to => Get.find();

  bool isFirstOpen = false;
  PackageInfo? _platform;
  String get version => _platform?.version ?? '-';
  bool get isRelease => bool.fromEnvironment("dart.vm.product");
  Locale locale = Locale('en', 'US');
  List<Locale> languages = [
    Locale('en', 'US'),
    Locale('en', "CN"),
  ];

  @override
  void OnInit() {
    super.onInit();
    isFirstOpen = StorageService.to.getBool("STORAGE_DEVICE_FIRST_OPEN_KEY");
  }

  Future<void> getPlatform() async {
    _platform = await PackageInfo.fromPlatform();
  }

  Future<bool> saveAlreadyOpen() {
    return StorageService.to.setBool("STORAGE_DEVICE_FIRST_OPEN_KEY", true);
  }
}
