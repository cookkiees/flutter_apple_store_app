import 'package:get/get.dart';

import '../../cart/controllers/cart_controller.dart';
import '../../store/controller/store_controller.dart';
import 'main_controller.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());
    Get.lazyPut<StoreController>(() => StoreController());
    Get.lazyPut<CartController>(() => CartController());
  }
}
