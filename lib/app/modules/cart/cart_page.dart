import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/utils/my_colors.dart';
import '../main/controllers/main_controller.dart';
import '../store/controller/store_controller.dart';
import 'controllers/cart_controller.dart';
import 'widgets/cart_cart_item_product_widget.dart';

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
          appBar: AppBar(
            elevation: 0.4,
            toolbarHeight: 40,
            flexibleSpace: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 6),
                child: Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total price :',
                        style: GoogleFonts.anton(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: main.isPrimaryDark.value,
                          textStyle: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Obx(() => controller.isQuantity.value
                          ? const SizedBox.shrink()
                          : Text(
                              " \$  ${controller.calculateTotalPrice.toString()}",
                              style: GoogleFonts.urbanist(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.red,
                                textStyle: const TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ))
                    ],
                  ),
                )),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                child: Obx(
                  () => Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...List.generate(
                        controller.cartItems.length,
                        (index) {
                          var cart = controller.cartItems[index];
                          if (controller.cartItems.isEmpty) {
                            return Center(
                              child: Container(
                                height: 100,
                                width: double.infinity,
                                color: MyColors.onPrimary,
                                child: Text(
                                  'Your cart still Empty',
                                  style: GoogleFonts.anton(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.red,
                                    textStyle: const TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return CartCardItemProductWidget(
                              label: "${cart.name}",
                              price: "\$ ${cart.price}",
                              quantity: Obx(
                                () => controller.isQuantity.value
                                    ? const SizedBox.shrink()
                                    : Text(
                                        '${cart.quantity}',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.anton(
                                          fontSize: 14,
                                          color: main.isPrimaryDark.value,
                                        ),
                                      ),
                              ),
                              display: "${cart.display}",
                              displayType: "${cart.displayType}",
                              onTapDeleteItem: () =>
                                  controller.removeCartItemById(cart.id!),
                              onTapIsExpanded: () =>
                                  controller.toggleExpanded(index),
                              increment: () => controller
                                  .incrementCartItemQuantityById(cart.id!),
                              decrement: () => controller
                                  .decrementCartItemQuantityById(cart.id!),
                              height:
                                  controller.isExpandedList[index] ? 300 : 130,
                              image: 'assets/images/${cart.image![2]}.png',
                              isExpanded: (controller.isExpandedList[index])
                                  ? Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12),
                                      width: double.infinity,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          CartIsExpadedChildWidget(
                                            icon: 'battery',
                                            note: "${cart.battery}",
                                          ),
                                          const SizedBox(height: 6),
                                          CartIsExpadedChildWidget(
                                            icon: 'camera',
                                            note: "${cart.cameraSystem}",
                                          ),
                                          const SizedBox(height: 6),
                                          CartIsExpadedChildWidget(
                                            icon: 'chip',
                                            note: "${cart.chip}",
                                          ),
                                          const SizedBox(height: 6),
                                          CartIsExpadedChildWidget(
                                            icon: 'network',
                                            note: "${cart.network}",
                                          ),
                                          const SizedBox(height: 6),
                                          CartIsExpadedChildWidget(
                                            icon: 'sos',
                                            note: "${cart.emergency}",
                                          ),
                                          const SizedBox(height: 6),
                                        ],
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                              icon: controller.isExpandedList[index]
                                  ? const Icon(
                                      Icons.keyboard_arrow_up,
                                    )
                                  : const Icon(
                                      Icons.keyboard_arrow_down,
                                    ),
                            );
                          }
                        },
                      ),
                      const SizedBox(
                        height: 72,
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

class CartIsExpadedChildWidget extends StatelessWidget {
  const CartIsExpadedChildWidget({
    super.key,
    required this.note,
    required this.icon,
  });

  final String note;
  final String icon;

  @override
  Widget build(BuildContext context) {
    MainController main = Get.put(MainController());
    return Obx(
      () => Row(
        children: [
          SvgPicture.asset(
            'assets/icons/$icon.svg',
            height: 28,
            colorFilter:
                ColorFilter.mode(main.isPrimaryDark.value, BlendMode.srcIn),
          ),
          const SizedBox(width: 6),
          Flexible(
            child: Text(
              note,
              style: GoogleFonts.urbanist(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: main.isPrimaryDark.value,
                textStyle: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
