import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../modules/main/controllers/main_controller.dart';
import '../theme/utils/my_colors.dart';

class IPHONECardAccessoriesWidget extends GetView<MainController> {
  const IPHONECardAccessoriesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: 250,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 32, left: 16, right: 16),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Obx(
              () => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image.asset(
                      (controller.tabColor.value == 0)
                          ? "assets/images/case_yellow_1.png"
                          : (controller.tabColor.value == 1)
                              ? "assets/images/case_blue_1.png"
                              : "assets/images/case_black_1.png",
                    ),
                    Image.asset(
                      (controller.tabColor.value == 0)
                          ? "assets/images/case_yellow_0.png"
                          : (controller.tabColor.value == 1)
                              ? "assets/images/case_blue_0.png"
                              : "assets/images/case_black_0.png",
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12, right: 12, left: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "iPhone 14 Pro Silicone Case with MagSafe",
                          style: GoogleFonts.urbanist(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            textStyle: TextStyle(
                              color: controller.isPrimaryDark.value,
                              overflow: TextOverflow.clip,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
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
                                text: "49.00",
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
                        ),
                        const SizedBox(height: 16),
                        Wrap(
                          runSpacing: 16,
                          spacing: 16,
                          children: [
                            ...List.generate(
                              3,
                              (index) {
                                var color = [
                                  Colors.yellow,
                                  Colors.blue[100],
                                  Colors.grey[800],
                                ];
                                return InkWell(
                                  onTap: () => controller.changeColor(index),
                                  child: CircleAvatar(
                                    radius: 10,
                                    backgroundColor: color[index],
                                  ),
                                );
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: 50,
                      width: 70,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: controller.isChangeTheme.value
                            ? Colors.grey
                            : MyColors.onPrimary,
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
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
