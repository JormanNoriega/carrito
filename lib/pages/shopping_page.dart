import 'package:carrito/pages/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/product_controller.dart';
import 'add_product_page.dart';

import '../controllers/cart_controller.dart';

class ShoppingPage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping'),
        backgroundColor: Colors.teal,
        actions: [
          Obx(() {
            return IconButton(
              icon: Row(
                children: [
                  const Icon(Icons.shopping_bag),
                  const SizedBox(width: 5),
                  Text(cartController.itemCount.toString()),
                ],
              ),
              onPressed: () {
                Get.to(() => CartPage());
              },
            );
          }),
        ],
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: productController.products.length,
          itemBuilder: (context, index) {
            final product = productController.products[index];
            return ListTile(
              leading: CircleAvatar(
                child: Image.network(
                    'https://portal.andina.pe/EDPfotografia3/Thumbnail/2017/06/05/000425938W.jpg'),
              ),
              title: Text(product.name),
              subtitle: Text("\$${product.price}"),
              trailing: IconButton(
                icon: const Icon(Icons.add_shopping_cart),
                onPressed: () {
                  cartController.addToCart(product);
                },
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        child: const Icon(Icons.add),
        onPressed: () {
          Get.to(
              () => AddProductPage()); // Navega a la página de añadir productos
        },
      ),
    );
  }
}
