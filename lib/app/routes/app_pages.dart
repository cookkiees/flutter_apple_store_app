import 'package:get/get.dart';

import '../modules/cart/cart_page.dart';
import '../modules/cart/controllers/cart_binding.dart';
import '../modules/store/controller/store_binding.dart';
import '../modules/store/store_page.dart';
import '../modules/main/controllers/main_binding.dart';
import '../modules/main/main_page.dart';
import '../modules/splash/controllers/splash_binding.dart';
import '../modules/splash/splash_page.dart';
import 'app_routes.dart';

abstract class AppPages {
  static const initial = AppRoutes.initial;
  static final pages = [
    GetPage(
      name: AppRoutes.initial,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.main,
      page: () => const MainPage(),
      binding: MainBinding(),
    ),
    GetPage(
      name: AppRoutes.store,
      page: () => const StorePage(),
      binding: StoreBinding(),
    ),
    GetPage(
      name: AppRoutes.cart,
      page: () => const CartPage(),
      binding: CartBinding(),
    )
  ];
}
