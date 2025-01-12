import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/my_food_tile.dart';
import 'package:flutter_application_1/widgets/my_tab_bar.dart';
import 'package:provider/provider.dart';
import '../models/food.dart';
import '../models/store.dart';
import '../widgets/my_current_location.dart';
import '../widgets/my_description_box.dart';
import '../widgets/my_drawer.dart';
import 'food_screen.dart';
import '../widgets/my_sliver_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: FoodCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Food> _filterItemsByCategory(FoodCategory type, List<Food> items) {
    return items.where((element) => element.type == type).toList();
  }

  List<Widget> getFoodInThisCategory(List<Food> items) {
    return FoodCategory.values.map((type) {
      List<Food> filteredItems = _filterItemsByCategory(type, items);
      return ListView.builder(
        itemCount: filteredItems.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final food = filteredItems[index];
          return MyFoodTile(
            food: food,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FoodScreen(
                  food: food,
                ),
              ),
            ),
          );
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
                MySliverAppBar(
                  title: MyTabBar(
                    tabController: _tabController,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Divider(
                        indent: 25,
                        endIndent: 25,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      const MyCurrentLocation(),
                      const MyDescriptionBox(),
                    ],
                  ),
                ),
              ],
          body: Consumer<Store>(
            builder: (context, store, child) => TabBarView(
              controller: _tabController,
              children: getFoodInThisCategory(store.items),
            ),
          )

          // // recipe
          // body: Consumer<HomeViewModel>(
          //   builder: (context, viewModel, child) {
          //     if (viewModel.isLoadingRecipes) {
          //       return const Center(
          //         child: CircularProgressIndicator(),
          //       );
          //     } else {
          //       return TabBarView(
          //         controller: _tabController,
          //         children: [
          //           ListView.builder(
          //             itemCount: viewModel.recipes.length,
          //             itemBuilder: (context, index) {
          //               final recipe = viewModel.recipes[index];
          //               return MyRecipeTile(
          //                 recipe: recipe,
          //                 onTap: () {},
          //               );
          //             },
          //           ),
          //         ],
          //       );
          //     }
          //   },
          // ),
          ),
    );
  }
}
