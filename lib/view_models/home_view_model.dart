import 'package:flutter/material.dart';
import '../models/recipe.dart';
import '../repository/recipe_repository.dart';

class HomeViewModel extends ChangeNotifier {
  List<Recipe> _recipes = [];
  bool _isLoadingRecipes = true;

  List<Recipe> get recipes => _recipes;

  bool get isLoadingRecipes => _isLoadingRecipes;

  HomeViewModel() {
    fetchRecipes();
  }

  Future<void> fetchRecipes() async {
    _recipes = await RecipeRepository().getRecipes();
    _isLoadingRecipes = false;
    notifyListeners();
  }
}
