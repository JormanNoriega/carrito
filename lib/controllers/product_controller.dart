import 'package:get/get.dart';
import '../models/product.dart';

class ProductController extends GetxController {
  var products = <Product>[].obs;

  @override
  void onInit() {
    // Inicializar algunos productos de ejemplo
    products.addAll([
      Product('Product 1', 50),
      Product('Product 2', 30),
      Product('Product 3', 20),
      Product('Product 4', 100),
    ]);
    super.onInit();
  }

  void addProduct(String name, double price) {
    products.add(Product(name, price));
    products.refresh();
  }
}