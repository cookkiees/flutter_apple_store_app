import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/main_controller.dart';

class MainDrawerWidget extends GetView<MainController> {
  const MainDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const [
          DrawerHeader(
            decoration: BoxDecoration(),
            child: Icon(
              Icons.apple,
              size: 150,
            ),
          ),
        ],
      ),
    );
  }
}
