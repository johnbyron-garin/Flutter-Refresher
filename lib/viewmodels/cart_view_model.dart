import 'package:flutter/material.dart';
import '../models/cart_item.dart';
import '../models/food.dart';
import 'package:collection/collection.dart';
import 'package:intl/intl.dart';

class CartViewModel extends ChangeNotifier {
  final List<CartItem> _cart = [];

  List<CartItem> get cart => _cart;

  void addToCart(Food food, List<Addon> selectedAddons) {
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      bool isSameFood = item.food == food;
      bool isSameAddons = const ListEquality().equals(
        item.selectedAddons,
        selectedAddons,
      );
      return isSameFood && isSameAddons;
    });

    if (cartItem != null) {
      cartItem.quantity++;
    } else {
      _cart.add(CartItem(food: food, selectedAddons: selectedAddons));
    }
    notifyListeners();
  }

  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  double getTotalPrice() {
    double total = 0;

    for (CartItem item in _cart) {
      double itemTotal = item.food.price;
      for (Addon addon in item.selectedAddons) {
        itemTotal += addon.price;
      }
      total += itemTotal * item.quantity;
    }

    return total;
  }

  int getTotalItemCount() {
    int total = 0;
    for (CartItem item in _cart) {
      total += item.quantity;
    }
    return total;
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt.");
    receipt.writeln();
    String formattedDate =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    receipt.writeln("Date: $formattedDate");
    receipt.writeln();
    receipt.writeln("--------------------");

    for (final cartItem in _cart) {
      receipt.writeln(
          "${cartItem.quantity} x ${cartItem.food.name} = ${_formatPrice(cartItem.food.price * cartItem.quantity)}");
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt.writeln("Addons: ${_formatAddons(cartItem.selectedAddons)}");
      }
      receipt.writeln();
    }
    receipt.writeln("--------------------");
    receipt.writeln();
    receipt.writeln("Total Items: ${getTotalItemCount()}");
    receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");

    return receipt.toString();
  }

  String _formatPrice(double price) {
    return "P${price.toStringAsFixed(2)}";
  }

  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
        .join(", ");
  }
}
