class Iphone {}

class Product {
  Product({
    this.quantity = 1,
    this.id,
    this.status,
    this.name,
    this.display,
    this.displayType,
    this.emergency,
    this.battery,
    this.storage,
    this.cameraSystem,
    this.chip,
    this.network,
    this.image,
    this.price,
  });
  int quantity;
  final int? id;
  final String? status;
  final String? name;
  final List<String>? image;
  final String? display;
  final String? displayType;
  final String? emergency;
  final String? storage;
  final String? battery;
  final String? cameraSystem;
  final String? chip;
  final String? network;
  final double? price;
}
