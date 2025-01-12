import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/recipe.dart';
import '../repository/recipe_repository.dart';

class RecipeApi {
  static Future<List<Recipe>> fetchRecipes() async {
    var uri = Uri.https('tasty.p.rapidapi.com', '/recipes/list', {
      'from': '0',
      'size': '20',
      'tags': 'under_30_minutes',
    });

    final response = await http.get(uri, headers: {
      'x-rapidapi-host': 'tasty.p.rapidapi.com',
      'x-rapidapi-key': '9f6c35fdf0msh84b19742717f9e2p1e37d1jsn32db0a295ce0',
    });

    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);
      List temp = [];

      for (var i = 0; i < data['results'].length; i++) {
        temp.add(data['results'][i]);
      }

      return RecipeRepository.recipesFromSnapshot(temp);
    } else {
      throw Exception('Failed to load recipes');
    }
  }
}
