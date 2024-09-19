import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';

class CartPage extends StatelessWidget {
  final CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        backgroundColor: Colors.teal,
      ),
      body: Obx(() {
        return cartController.cartItems.isEmpty
            ? const Center(child: Text('Your cart is empty'))
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: cartController.cartItems.length,
                      itemBuilder: (context, index) {
                        final product = cartController.cartItems[index];
                        return ListTile(
                          title: Text(product.name),
                          subtitle: Text("\$${product.price}"),
                          trailing: IconButton(
                            icon: const Icon(Icons.remove_shopping_cart),
                            onPressed: () {
                              cartController.removeFromCart(product);
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Total: \$${cartController.totalPrice}",
                      style: const TextStyle(fontSize: 24),
                    ),
                  ),
                ],
              );
      }),
    );
  }
}
