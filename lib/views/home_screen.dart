import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/my_food_tile.dart';
import 'package:flutter_application_1/widgets/my_tab_bar.dart';
import 'package:provider/provider.dart';
import '../models/food.dart';
import '../widgets/my_current_location.dart';
import '../widgets/my_description_box.dart';
import '../widgets/my_drawer.dart';
import 'food_screen.dart';
import '../widgets/my_sliver_app_bar.dart';
import '../viewmodels/home_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late HomeViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = HomeViewModel();
    _viewModel
        .init(TabController(length: FoodCategory.values.length, vsync: this));
  }

  @override
  void dispose() {
    _viewModel.tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (_) => _viewModel,
      child: Scaffold(
        drawer: const MyDrawer(),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            MySliverAppBar(
              title: MyTabBar(
                tabController: _viewModel.tabController,
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
          body: Consumer<HomeViewModel>(
            builder: (context, viewModel, child) {
              return TabBarView(
                controller: viewModel.tabController,
                children: FoodCategory.values.map((category) {
                  final foods = viewModel.getFoodsByCategory(category);
                  return ListView.builder(
                    itemCount: foods.length,
                    itemBuilder: (context, index) {
                      final food = foods[index];
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
                }).toList(),
              );
            },
          ),
        ),
      ),
    );
  }
}
