import 'package:apple_store/app/modules/store/controller/store_controller.dart';
import 'package:get/get.dart';

import '../../../data/model/iphone_model.dart';

class CartController extends GetxController {
  final RxList<Product> cartItems = RxList<Product>([]);

  void moveCartItemsFromSource(StoreController storeController) {
    cartItems.addAll(storeController.cartItems);
    storeController.cartItems.clear();
    initializeExpandedList();
  }

  @override
  void onInit() {
    super.onInit();
    initializeExpandedList();
  }

  late List<bool> isExpandedList = <bool>[].obs;

  void initializeExpandedList() {
    isExpandedList.assignAll(List<bool>.generate(
      cartItems.length,
      (index) => false,
    ));
  }

  void toggleExpanded(int index) {
    isExpandedList[index] = !isExpandedList[index];
  }
}
