import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/home_view_model.dart';
import 'widgets/recipe_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.restaurant_menu),
            SizedBox(width: 10),
            Text('Food Recipe'),
          ],
        ),
      ),
      body: ChangeNotifierProvider(
        create: (_) => HomeViewModel(),
        child: Consumer<HomeViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                itemCount: viewModel.recipes.length,
                itemBuilder: (context, index) {
                  return RecipeCard(
                    title: viewModel.recipes[index].name,
                    rating: '4.5',
                    cookTime: '30 mins',
                    thumbnailUrl: viewModel.recipes[index].thumbnailUrl,
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
