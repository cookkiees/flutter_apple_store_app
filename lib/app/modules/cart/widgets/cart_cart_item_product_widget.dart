import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../main/controllers/main_controller.dart';

class CartCardItemProductWidget extends StatelessWidget {
  const CartCardItemProductWidget({
    super.key,
    required this.height,
    required this.image,
    required this.label,
    required this.price,
    this.onTapIsExpanded,
    required this.icon,
    required this.isExpanded,
    required this.display,
    required this.displayType,
    this.onTapDeleteItem,
    required this.quantity,
    this.increment,
    this.decrement,
  });
  final double height;
  final String image;
  final String label;
  final String price;
  final Widget quantity;
  final String display;
  final String displayType;
  final Widget icon;
  final Widget isExpanded;
  final Function()? onTapIsExpanded;
  final Function()? onTapDeleteItem;
  final Function()? increment;
  final Function()? decrement;

  @override
  Widget build(BuildContext context) {
    MainController main = Get.put(MainController());
    return Obx(
      () => Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: height,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: main.isPrimaryDark.value,
                  width: 0.5,
                ),
                color: main.isPrimaryLight.value),
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 120,
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 8),
                      child: Image.asset(
                        image,
                        height: 110,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              label,
                              style: GoogleFonts.urbanist(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                textStyle: const TextStyle(
                                  overflow: TextOverflow.fade,
                                ),
                                color: main.isPrimaryDark.value,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '$price ',
                              style: GoogleFonts.urbanist(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                textStyle: const TextStyle(
                                  overflow: TextOverflow.fade,
                                ),
                                color: Colors.red,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              display,
                              style: GoogleFonts.urbanist(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                textStyle: const TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                ),
                                color: main.isPrimaryDark.value,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: decrement,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(width: 0.2)),
                                    child: const Icon(Icons.remove),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                quantity,
                                const SizedBox(width: 12),
                                InkWell(
                                  onTap: increment,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(width: 0.2)),
                                    child: const Icon(Icons.add),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 130,
                      padding: const EdgeInsets.only(top: 12, right: 12),
                      decoration: const BoxDecoration(),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: onTapDeleteItem,
                              child: const Icon(
                                Icons.delete,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                isExpanded
              ],
            ),
          ),
          GestureDetector(
            onTap: onTapIsExpanded,
            child: icon,
          ),
        ],
      ),
    );
  }
}
