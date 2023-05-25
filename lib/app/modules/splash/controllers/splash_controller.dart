import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  RxBool isDarkMode = false.obs;

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
  }

  Rx<BoxShape> boxShape = BoxShape.rectangle.obs;
  Rx<IconData> icon = Icons.apple.obs;

  void toggleShape() {
    if (boxShape.value == BoxShape.rectangle) {
      boxShape.value = BoxShape.circle;
    } else {
      boxShape.value = BoxShape.rectangle;
    }
  }

  void toggleIcon() {
    if (icon.value == Icons.apple) {
      icon.value = Icons.android;
    } else {
      icon.value = Icons.apple;
    }
  }

  @override
  // ignore: unnecessary_overrides
  void onInit() {
    super.onInit();
    Timer.periodic(const Duration(seconds: 5), (_) {
      // toggleShape();
      // toggleIcon();
      toggleTheme();
    });
  }
}
