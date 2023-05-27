import 'package:get/get.dart';

import '../../../data/model/iphone_model.dart';
import '../../store/controller/store_controller.dart';

class CartController extends GetxController {
  final RxList<Product> cartItems = RxList<Product>([]);
  void removeCartItemById(int id) {
    cartItems.removeWhere((item) => item.id == id);
  }

  var isQuantity = false.obs;
  void incrementCartItemQuantityById(int id) {
    final index = cartItems.indexWhere((item) => item.id == id);
    isQuantity.value = true;
    if (index >= 0 && cartItems[index].quantity < 99) {
      cartItems[index].quantity++;
    }
    isQuantity.value = false;
  }

  void decrementCartItemQuantityById(int id) {
    final index = cartItems.indexWhere((item) => item.id == id);
    isQuantity.value = true;
    if (index >= 0) {
      final currentQuantity = cartItems[index].quantity;
      if (currentQuantity > 1) {
        cartItems[index].quantity--;
      } else {
        cartItems.removeAt(index);
      }
    }
    isQuantity.value = false;
  }

  double get calculateTotalPrice {
    double totalPrice = 0.0;
    for (var item in cartItems) {
      totalPrice += item.price! * item.quantity;
    }
    return totalPrice;
  }

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
