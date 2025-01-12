import 'package:flutter/material.dart';
import '../models/recipe.dart';
import '../repository/recipe_repository.dart';

class HomeViewModel extends ChangeNotifier {
  List<Recipe> _recipes = [];
  bool _isLoading = true;

  List<Recipe> get recipes => _recipes;
  bool get isLoading => _isLoading;

  HomeViewModel() {
    fetchRecipes();
  }

  Future<void> fetchRecipes() async {
    _recipes = await RecipeRepository().getRecipes();
    _isLoading = false;
    notifyListeners();
  }
}
