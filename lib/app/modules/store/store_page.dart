import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/iphone_card_accessories_widget.dart';
import '../../components/iphone_card_product_item_widget.dart';
import '../main/controllers/main_controller.dart';
import 'controller/store_controller.dart';

class StorePage extends GetView<StoreController> {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    // controller.startImageTimer();
    return GetBuilder<MainController>(
      init: MainController(),
      builder: (main) {
        return Obx(
          () => Scaffold(
            body: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(top: 12, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 16, bottom: 32),
                      child: Text(
                        'The best way to buy the products you love.',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16, bottom: 16),
                      child: Text(
                        'iPhone',
                        style: GoogleFonts.urbanist(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: main.isPrimaryDark.value,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 400,
                      width: double.infinity,
                      child: ListView.builder(
                        itemCount: controller.typeiPhone.length,
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.only(left: 16),
                        itemBuilder: (BuildContext context, int index) {
                          var iPhone = controller.typeiPhone[index];
                          return IPHONECardProductItemWidget(
                            onTap: () {
                              controller.addItemToCart(iPhone.id!);
                              Get.snackbar('Oke', 'message');
                            },
                            itemName: iPhone.name.toString(),
                            itemPrice: iPhone.price.toString(),
                            itemStatus: iPhone.status.toString(),
                            itemImage: 'assets/images/${iPhone.image![2]}.png',
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16, top: 16),
                      child: Text(
                        'iPhone accessories',
                        style: GoogleFonts.urbanist(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: main.isPrimaryDark.value,
                        ),
                      ),
                    ),
                    const IPHONECardAccessoriesWidget(),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 32),
                        child: Text(
                          "That's all for now",
                          style: GoogleFonts.urbanist(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
