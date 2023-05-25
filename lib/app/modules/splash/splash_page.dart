import 'package:apple_store/app/modules/main/controllers/main_controller.dart';
import 'package:apple_store/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      Get.offNamed(AppRoutes.main);
    });
    MainController main = Get.put(MainController());
    return Obx(
      () => Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  onTap: () => controller.toggleTheme(),
                  child: Container(
                    height: 250,
                    width: 250,
                    decoration: BoxDecoration(
                      color: main.isPrimaryLight.value,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: controller.isDarkMode.value
                              ? Colors.black45
                              : Colors.grey[500]!,
                          offset: const Offset(4.0, 4.0),
                          blurRadius: 14.0,
                          spreadRadius: 1.0,
                        ),
                        BoxShadow(
                          color: controller.isDarkMode.value
                              ? Colors.black45
                              : Colors.white,
                          offset: const Offset(-2.0, -2.0),
                          blurRadius: 14.0,
                          spreadRadius: 1.0,
                        )
                      ],
                    ),
                    child: Icon(
                      controller.icon.value,
                      color: controller.isDarkMode.value
                          ? Colors.white
                          : Colors.grey[900],
                      size: 150,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
