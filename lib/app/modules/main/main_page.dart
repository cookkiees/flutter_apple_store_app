import 'package:apple_store/app/modules/cart/cart_page.dart';
import 'package:apple_store/app/modules/store/store_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'controllers/main_controller.dart';
import 'widgets/main_appbar_widget.dart';
import 'widgets/main_drawer_widget.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.mainScaffoldKey,
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: MainAppBarWidget(),
      ),
      body: Obx(
        () => IndexedStack(
          index: controller.pageIndex.value,
          children: [
            if (controller.isLoading.value)
              Center(child: CupertinoActivityIndicator(color: Colors.grey[900]))
            else
              const StorePage(),
            if (controller.isLoading.value)
              Center(child: CupertinoActivityIndicator(color: Colors.grey[900]))
            else
              const CartPage(),
          ],
        ),
      ),
      drawer: const MainDrawerWidget(),
      bottomNavigationBar: Obx(
        () => Container(
          height: 86,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 12),
          color: controller.isPrimaryLight.value,
          alignment: Alignment.topCenter,
          child: GNav(
            gap: 8,
            haptic: true,
            iconSize: 24,
            tabBorderRadius: 8,
            backgroundColor: controller.isPrimaryLight.value,
            color: controller.isChangeTheme.value
                ? Colors.grey[100]
                : Colors.grey[900],
            activeColor: controller.isChangeTheme.value
                ? Colors.grey[100]!
                : Colors.grey[900],
            rippleColor: Colors.grey[800]!,
            hoverColor: Colors.grey[700]!,
            tabBackgroundColor: controller.isPrimaryLight.value,
            curve: Curves.bounceIn,
            tabActiveBorder: Border.all(
              color: controller.isChangeTheme.value
                  ? Colors.grey[100]!
                  : Colors.grey[900]!,
              width: 0.5,
            ),
            tabBorder: Border.all(
              color: controller.isChangeTheme.value
                  ? Colors.grey[100]!
                  : Colors.grey[900]!,
              width: 0.5,
            ),
            selectedIndex: controller.pageIndex.value,
            onTabChange: controller.onTabSelected,
            duration: const Duration(milliseconds: 900),
            mainAxisAlignment: MainAxisAlignment.center,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            tabs: const [
              GButton(
                icon: Icons.apple,
                text: 'STORE',
              ),
              GButton(
                icon: Icons.shopping_bag,
                text: 'CART',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
