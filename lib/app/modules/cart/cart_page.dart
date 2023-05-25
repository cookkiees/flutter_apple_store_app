import 'package:apple_store/app/modules/store/controller/store_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../main/controllers/main_controller.dart';
import 'controllers/cart_controller.dart';

class CartPage extends GetView<CartController> {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Get.find<StoreController>();
    controller.moveCartItemsFromSource(store);
    return GetBuilder<MainController>(
      init: MainController(),
      initState: (_) {},
      builder: (main) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                child: Obx(
                  () => Column(
                    children: [
                      ...List.generate(
                        controller.cartItems.length,
                        (index) {
                          var cart = controller.cartItems[index];
                          if (controller.cartItems.isEmpty) {
                            return const Text('data');
                          } else {
                            return Column(
                              children: [
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  height: controller.isExpandedList[index]
                                      ? 300
                                      : 130,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: main.isPrimaryDark.value,
                                        width: 0.5,
                                      ),
                                      color: main.isPrimaryLight.value),
                                  child: ListView(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    children: [
                                      Flexible(
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 120,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8,
                                                      horizontal: 8),
                                              child: Image.asset(
                                                'assets/images/${cart.image![2]}.png',
                                                height: 110,
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 12),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "${cart.name}",
                                                      style:
                                                          GoogleFonts.urbanist(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        textStyle:
                                                            const TextStyle(
                                                          overflow:
                                                              TextOverflow.fade,
                                                        ),
                                                        color: main
                                                            .isPrimaryDark
                                                            .value,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 8),
                                                    Text(
                                                      "\$ ${cart.price}",
                                                      style:
                                                          GoogleFonts.urbanist(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        textStyle:
                                                            const TextStyle(
                                                          overflow:
                                                              TextOverflow.fade,
                                                        ),
                                                        color: main
                                                            .isPrimaryDark
                                                            .value,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 120,
                                              padding: const EdgeInsets.only(
                                                  top: 12, right: 12),
                                              decoration: const BoxDecoration(),
                                              child: const Align(
                                                alignment: Alignment.topRight,
                                                child: Icon(
                                                  Icons.delete,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      if (controller.isExpandedList[index])
                                        const Flexible(
                                          child: SizedBox(
                                            width: double.infinity,
                                          ),
                                        )
                                      else
                                        const SizedBox.shrink()
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => controller.toggleExpanded(index),
                                  child: controller.isExpandedList[index]
                                      ? const Icon(
                                          Icons.keyboard_arrow_up,
                                        )
                                      : const Icon(
                                          Icons.keyboard_arrow_down,
                                        ),
                                ),
                              ],
                            );
                          }
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
