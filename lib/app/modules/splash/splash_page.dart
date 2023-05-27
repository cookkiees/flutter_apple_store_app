import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../routes/app_routes.dart';
import '../../theme/utils/my_colors.dart';
import 'controllers/splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      Get.offNamed(AppRoutes.main);
    });
    return Scaffold(
      backgroundColor: MyColors.onPrimary,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [LottieBuilder.asset('assets/lottie/loading.json')],
          ),
        ),
      ),
    );
  }
}
