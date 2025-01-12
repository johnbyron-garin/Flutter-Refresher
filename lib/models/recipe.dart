class Recipe {
  final String name;
  final String description;
  final String thumbnailUrl;

  Recipe({
    required this.name,
    required this.description,
    required this.thumbnailUrl,
  });

  factory Recipe.fromJson(dynamic json) {
    return Recipe(
      name: json['name'] as String,
      description: json['description'] as String,
      thumbnailUrl: json['thumbnail_url'] as String,
    );
  }
}
