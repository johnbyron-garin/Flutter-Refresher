import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/my_cart_tile.dart';
import 'package:provider/provider.dart';

import '../models/store.dart';
import '../widgets/my_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Store>(builder: (context, store, child) {
      final userCart = store.cart;

      return Scaffold(
        appBar: AppBar(
          title: const Text("Cart"),
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title:
                        const Text("Are you sure you want to clear your cart?"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          store.clearCart();
                        },
                        child: const Text("Yes"),
                      ),
                    ],
                  ),
                );
              },
              icon: const Icon(Icons.delete),
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  userCart.isEmpty
                      ? const Expanded(
                          child: Center(
                            child: Text("Your cart is empty"),
                          ),
                        )
                      : Expanded(
                          child: ListView.builder(
                              itemCount: userCart.length,
                              itemBuilder: (context, index) {
                                final cartItem = userCart[index];

                                return MyCartTile(cartItem: cartItem);
                              }),
                        )
                ],
              ),
            ),
            MyButton(onTap: () {}, text: "Checkout"),
            const SizedBox(height: 25),
          ],
        ),
      );
    });
  }
}
