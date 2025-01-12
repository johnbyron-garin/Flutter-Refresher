import 'dart:convert';
import 'package:http/http.dart' as http;

import 'recipe.dart';

class RecipeApi {
  static Future<List<Recipe>> getRecipes() async {
    var uri = Uri.https('tasty.p.rapidapi.com', '/recipes/list', {
      'from': '0',
      'size': '20',
      'tags': 'under_30_minutes',
    });

    final response = await http.get(uri, headers: {
      'x-rapidapi-host': 'tasty.p.rapidapi.com',
      'x-rapidapi-key': '9f6c35fdf0msh84b19742717f9e2p1e37d1jsn32db0a295ce0',
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i = 0; i < data['results'].length; i++) {
      _temp.add(data['results'][i]);
    }

    return Recipe.recipesFromSnapshot(_temp);
  }
}
