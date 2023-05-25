import 'package:get/get.dart';

import '../../store/controller/store_controller.dart';
import 'cart_controller.dart';

class CartBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartController>(() => CartController());
    Get.lazyPut<StoreController>(() => StoreController());
  }
}
