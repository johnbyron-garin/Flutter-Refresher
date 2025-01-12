class Food {
  final String name;
  final String description;
  final String image;
  final double price;
  final FoodCategory type;
  List<Addon> availableAddons = [];

  Food({
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.type,
    required this.availableAddons,
  });
}

enum FoodCategory {
  Sweet,
  Savory,
}

class Addon {
  String name;
  double price;

  Addon({
    required this.name,
    required this.price,
  });
}
