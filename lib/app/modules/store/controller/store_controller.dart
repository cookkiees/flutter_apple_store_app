import 'package:get/get.dart';

import '../../../data/model/iphone_model.dart';

class StoreController extends GetxController {
  // RxInt imageIndex = 1.obs;

  // void startImageTimer() {
  //   Timer.periodic(const Duration(seconds: 7), (timer) {
  //     imageIndex.value = (imageIndex.value + 1) % typeiPhone.length;
  //   });
  // }

  var typeiPhone = [
    Product(
      id: 0,
      status: 'New',
      display: '6.7″ or 6.1″',
      price: 999,
      name: 'iPhone 14 pro max',
      chip: 'A16 Bionic chip',
      network: 'Superfast 5G cellularfootnote⁵',
      cameraSystem: 'Pro camera system',
      battery: 'Up to 29 hours video playbackfootnote⁴',
      displayType:
          'Super Retina XDR displayfootnote¹ProMotion technology Always-On display',
      emergency:
          'Emergency SOS via satellitefootnote³ Emergency SOS Crash Detectionfootnote⁶',
      image: [
        'iphone_14_pro_gold',
        'iphone_14_pro_purple',
        'iphone_14_pro_silver',
        'iphone_14_pro_black'
      ],
    ),
    Product(
      id: 1,
      status: 'New',
      price: 799,
      display: '6.7" or 6.1"',
      name: 'iPhone 14 plus',
      chip: 'A15 Bionic chip with 5-core GPU',
      network: 'Superfast 5G cellularfootnote⁵',
      cameraSystem: 'Advanced dual-camera system',
      battery: 'Up to 26 hours video playbackfootnote⁴',
      displayType: 'Super Retina XDR displayfootnote¹',
      emergency:
          'Emergency SOS via satellitefootnote³ Emergency SOS Crash Detectionfootnote⁶',
      image: [
        'iphone_14_blue',
        'iphone_14_red',
        'iphone_14_yellow',
        'iphone_14_black'
      ],
    ),
    Product(
      id: 2,
      status: '',
      price: 599,
      display: '6.1″ or 5.4″"',
      name: 'iPhone 13',
      chip: 'A15 Bionic chip with 4-core GPU',
      network: 'Superfast 5G cellularfootnote⁵',
      cameraSystem: 'Dual-camera system',
      battery: 'Up to 19 hours video playbackfootnote⁴',
      displayType: 'Super Retina XDR displayfootnote¹',
      emergency: 'Emergency SOS',
      image: [
        'iphone_13_blue',
        'iphone_13_pink',
        'iphone_13_black',
      ],
    ),
  ].obs;
  final RxList<Product> cartItems = RxList<Product>([]);
  void removeCartItemById(int id) {
    cartItems.removeWhere((item) => item.id == id);
  }

  void addItemToCart(int id) {
    final product = typeiPhone.firstWhere((p) => p.id == id);

    // Cari apakah item dengan id yang sama sudah ada di cart
    bool itemFound = false;
    for (int i = 0; i < cartItems.length; i++) {
      if (cartItems[i].id == id) {
        // Item ditemukan, tambahkan quantity-nya
        cartItems[i].quantity++;
        itemFound = true;
        break;
      }
    }
    if (!itemFound) {
      product.quantity = 1;

      cartItems.add(product);
    }
  }
}
