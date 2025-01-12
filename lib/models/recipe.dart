class Recipe {
  final String name;
  final double price;
  final String description;
  final String image;

  Recipe({
    required this.name,
    required this.price,
    required this.description,
    required this.image,
  });

  factory Recipe.fromJson(dynamic json) {
    return Recipe(
      name: json['name'] as String,
      price: json['price']['consumption_portion'] as double,
      description: json['description'] as String,
      image: json['thumbnail_url'] as String,
    );
  }
}
