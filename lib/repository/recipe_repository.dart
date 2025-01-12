import '../api/recipe.api.dart';
import '../models/recipe.dart';

class RecipeRepository {
  Future<List<Recipe>> getRecipes() async {
    return await RecipeApi.fetchRecipes();
  }

  static List<Recipe> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Recipe.fromJson(data);
    }).toList();
  }
}
