
import 'package:carrito/models/product.dart';
import 'package:get/get.dart';


class CartController extends GetxController {
  var cartItems = <Product>[].obs;
  var numero = 0.obs;

  void addToCart(Product product) {
    cartItems.add(product);
  }

  void removeFromCart(Product product) {
    cartItems.remove(product);
  }

  int get itemCount => cartItems.length;

  double get totalPrice => cartItems.fold(0, (sum, item) => sum + item.price);
}