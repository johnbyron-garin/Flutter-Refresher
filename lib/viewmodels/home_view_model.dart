import 'package:flutter/material.dart';
import '../models/food.dart';
import '../repository/food_repository.dart';

class HomeViewModel extends ChangeNotifier {
  late TabController tabController;

  List<Food> get items => foodItems;

  void init(TabController tabController) {
    this.tabController = tabController;
  }

  List<Food> getFoodsByCategory(FoodCategory category) {
    return foodItems.where((food) => food.type == category).toList();
  }
}
