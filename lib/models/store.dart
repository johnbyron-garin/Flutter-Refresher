import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'cart_item.dart';
import 'package:intl/intl.dart';
import 'food.dart';

class Store extends ChangeNotifier {
  final List<Food> _items = [
    // Sweet Filipino Food
    Food(
      name: "Leche Flan",
      description:
          "A rich and creamy custard dessert topped with a golden caramel glaze. Made from egg yolks, condensed milk, and a hint of vanilla, it melts in your mouth with every bite.",
      price: 150,
      image: "lib/images/sweet/leche_flan.jpg",
      type: FoodCategory.Sweet,
      availableAddons: [
        Addon(name: "Extra Caramel", price: 20),
        Addon(name: "Whipped Cream", price: 10),
      ],
    ),

    Food(
      name: "Halo-Halo",
      description:
          "A refreshing Filipino dessert made with shaved ice, sweetened beans, fruits, jelly, and leche flan, all topped with ube ice cream and evaporated milk. Perfect for hot days!",
      price: 120,
      image: "lib/images/sweet/halo_halo.jpg",
      type: FoodCategory.Sweet,
      availableAddons: [
        Addon(name: "Extra Ube Ice Cream", price: 30),
        Addon(name: "Leche Flan", price: 40),
      ],
    ),

    Food(
      name: "Bibingka",
      description:
          "A traditional rice cake baked with coconut milk and topped with salted egg, cheese, and grated coconut. It’s a favorite treat during the holiday season.",
      price: 100,
      image: "lib/images/sweet/bibingka.jpg",
      type: FoodCategory.Sweet,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 20),
        Addon(name: "Salted Egg", price: 30),
      ],
    ),

    Food(
      name: "Turon",
      description:
          "Sweet banana slices and jackfruit wrapped in spring roll pastry and fried to golden perfection with a caramelized sugar coating. A crunchy and sweet Filipino snack.",
      price: 50,
      image: "lib/images/sweet/turon.jpg",
      type: FoodCategory.Sweet,
      availableAddons: [
        Addon(name: "Vanilla Ice Cream", price: 20),
        Addon(name: "Chocolate Syrup", price: 10),
      ],
    ),

    Food(
      name: "Ube Halaya",
      description:
          "A vibrant purple yam jam made from boiled and mashed ube, sweetened milk, and butter. Its creamy texture and unique flavor make it a beloved dessert.",
      price: 200,
      image: "lib/images/sweet/ube_halaya.jpg",
      type: FoodCategory.Sweet,
      availableAddons: [
        Addon(name: "Coconut Flakes", price: 20),
        Addon(name: "Crushed Nuts", price: 30),
      ],
    ),

// Savory Filipino Food
    Food(
      name: "Adobo",
      description:
          "A classic Filipino dish of chicken or pork marinated in soy sauce, vinegar, garlic, and spices, then simmered to perfection. Served with steamed rice for a hearty meal.",
      price: 250,
      image: "lib/images/savory/adobo.jpg",
      type: FoodCategory.Savory,
      availableAddons: [
        Addon(name: "Extra Rice", price: 20),
        Addon(name: "Boiled Egg", price: 10),
      ],
    ),

    Food(
      name: "Sinigang",
      description:
          "A tangy and savory tamarind-based soup loaded with vegetables and your choice of pork, shrimp, or fish. This comforting dish is best enjoyed with rice.",
      price: 220,
      image: "lib/images/savory/sinigang.jpg",
      type: FoodCategory.Savory,
      availableAddons: [
        Addon(name: "Extra Soup", price: 30),
        Addon(name: "Fish Sauce", price: 10),
      ],
    ),

    Food(
      name: "Pancit Canton",
      description:
          "A flavorful stir-fried noodle dish made with wheat noodles, vegetables, pork, chicken, or shrimp, and seasoned with soy sauce and citrus. A staple at Filipino celebrations.",
      price: 180,
      image: "lib/images/savory/pancit_canton.jpg",
      type: FoodCategory.Savory,
      availableAddons: [
        Addon(name: "Extra Vegetables", price: 20),
        Addon(name: "Chili Flakes", price: 10),
      ],
    ),

    Food(
      name: "Kare-Kare",
      description:
          "A traditional peanut stew with oxtail, tripe, and vegetables, served with bagoong (shrimp paste) on the side. Its rich, nutty flavor is a true Filipino favorite.",
      price: 280,
      image: "lib/images/savory/kare_kare.jpg",
      type: FoodCategory.Savory,
      availableAddons: [
        Addon(name: "Extra Bagoong", price: 20),
        Addon(name: "Steamed Rice", price: 10),
      ],
    ),

    Food(
      name: "Lumpiang Shanghai",
      description:
          "Crispy fried spring rolls filled with seasoned ground pork, carrots, and onions. Served with sweet chili sauce for dipping, it’s a popular appetizer or snack.",
      price: 150,
      image: "lib/images/savory/lumpiang_shanghai.jpg",
      type: FoodCategory.Savory,
      availableAddons: [
        Addon(name: "Extra Sweet Chili Sauce", price: 20),
        Addon(name: "Lettuce Leaves", price: 10),
      ],
    ),
  ];

  // GETTERS

  List<Food> get items => _items;
  List<CartItem> get cart => _cart;

  // OPERATIONS

  List<CartItem> _cart = [];

  // add to cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    // checks if there is already a cart item with the same food and addons
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      bool isSameFood = item.food == food;

      // check if the list of selected addons are the same
      bool isSameAddons = ListEquality().equals(
        item.selectedAddons,
        selectedAddons,
      );

      return isSameFood && isSameAddons;
    });

    // if already existing, increase it's quantity
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

  // HELPERS
  String displayCarReceipt() {
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
          "${cartItem.quantity} x ${cartItem.food.name} = ${cartItem.quantity} x ${_formatPrice(cartItem.food.price)}");

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
