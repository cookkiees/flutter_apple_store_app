import 'package:apple_store/app/theme/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../modules/main/controllers/main_controller.dart';

class IPHONECardProductItemWidget extends GetView<MainController> {
  const IPHONECardProductItemWidget({
    super.key,
    required this.itemImage,
    required this.itemName,
    required this.itemPrice,
    required this.itemStatus,
    this.onTap,
  });

  final String itemImage;
  final String itemName;
  final String itemPrice;
  final String itemStatus;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (main) {
        return Obx(
          () => Container(
            width: 300,
            margin: const EdgeInsets.only(right: 24, top: 16, bottom: 16),
            decoration: BoxDecoration(
              color: controller.isPrimaryLight.value,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                width: 0.5,
              ),
              // boxShadow: [
              //   BoxShadow(
              //     color: controller.isChangeTheme.value
              //         ? Colors.black45
              //         : Colors.grey[300]!,
              //     spreadRadius: 2,
              //     blurRadius: 4,
              //     offset: const Offset(1, 2),
              //   ),
              // ],
            ),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Opacity(
                      opacity: main.isChangeTheme.value ? 0.8 : 1,
                      child: Image.asset(
                        itemImage,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 100,
                  width: double.infinity,
                  margin: const EdgeInsets.only(left: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    itemStatus,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.red,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    itemName,
                                    style: GoogleFonts.urbanist(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      textStyle: const TextStyle(
                                          overflow: TextOverflow.ellipsis),
                                      color: controller.isPrimaryDark.value,
                                    ),
                                  ),
                                ],
                              ),
                              RichText(
                                text: TextSpan(
                                  text: "\$ ",
                                  style: GoogleFonts.urbanist(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w800,
                                    textStyle: const TextStyle(
                                      color: Colors.grey,
                                      overflow: TextOverflow.clip,
                                    ),
                                  ),
                                  children: [
                                    TextSpan(
                                      text: itemPrice,
                                      style: GoogleFonts.urbanist(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        textStyle: const TextStyle(
                                          color: Colors.grey,
                                          overflow: TextOverflow.clip,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: onTap,
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            height: 50,
                            width: 70,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: controller.isChangeTheme.value
                                  ? Colors.grey
                                  : MyColors.onPrimary,
                              border: Border.all(
                                width: 0.5,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                              ),
                            ),
                            child: Text(
                              'BUY',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: controller.isPrimaryLight.value,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
